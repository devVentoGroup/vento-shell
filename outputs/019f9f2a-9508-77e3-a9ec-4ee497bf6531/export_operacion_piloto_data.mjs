import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { createClient } from "@supabase/supabase-js";

const scriptDir = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(scriptDir, "..", "..");
const envPath = path.join(repoRoot, ".env.local");
const outputPath = path.join(scriptDir, "operacion_piloto_data.json");

function loadEnv(filePath) {
  const values = {};
  for (const rawLine of fs.readFileSync(filePath, "utf8").split(/\r?\n/)) {
    const line = rawLine.trim();
    if (!line || line.startsWith("#")) continue;
    const separator = line.indexOf("=");
    if (separator < 1) continue;
    const key = line.slice(0, separator).trim();
    let value = line.slice(separator + 1).trim();
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1);
    }
    values[key] = value;
  }
  return values;
}

async function fetchAll(supabase, table, columns, configure = (query) => query) {
  const pageSize = 1000;
  const rows = [];
  for (let from = 0; ; from += pageSize) {
    const query = configure(
      supabase
        .from(table)
        .select(columns)
        .range(from, from + pageSize - 1),
    );
    const { data, error } = await query;
    if (error) throw new Error(`${table}: ${error.message}`);
    rows.push(...data);
    if (data.length < pageSize) break;
  }
  return rows;
}

function presentationRank(profile) {
  const contextRank = {
    remission: 0,
    general: 2,
    purchase: 4,
  };
  return (
    (contextRank[profile.usage_context] ?? 6) +
    (profile.is_default ? 0 : 1)
  );
}

function yesNo(value) {
  if (value === true) return "SÍ";
  if (value === false) return "NO";
  return "";
}

const env = loadEnv(envPath);
const supabaseUrl = env.NEXT_PUBLIC_SUPABASE_URL;
const serviceRoleKey = env.SUPABASE_SERVICE_ROLE_KEY;
if (!supabaseUrl || !serviceRoleKey) {
  throw new Error(
    "Faltan NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY en .env.local",
  );
}

const supabase = createClient(supabaseUrl, serviceRoleKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});

const [products, categories, profiles, sites, areas, locations] =
  await Promise.all([
    fetchAll(
      supabase,
      "products",
      "id,name,sku,is_active,created_at,product_type,unit,stock_unit_code,production_area_kind,category_id",
      (query) => query.eq("is_active", true).order("name"),
    ),
    fetchAll(
      supabase,
      "product_categories",
      "id,name,is_active",
      (query) => query.order("name"),
    ),
    fetchAll(
      supabase,
      "product_uom_profiles",
      "id,product_id,label,input_unit_code,qty_in_input_unit,qty_in_stock_unit,is_default,is_active,source,usage_context",
      (query) => query.eq("is_active", true).order("label"),
    ),
    fetchAll(
      supabase,
      "sites",
      "id,code,name,type,site_type,site_kind,is_active",
      (query) => query.eq("is_active", true).order("name"),
    ),
    fetchAll(
      supabase,
      "areas",
      "id,site_id,code,name,kind,is_active",
      (query) => query.eq("is_active", true).order("name"),
    ),
    fetchAll(
      supabase,
      "inventory_locations",
      "id,site_id,area_id,parent_location_id,code,zone,aisle,level,description,is_active,location_type",
      (query) => query.eq("is_active", true).order("code"),
    ),
  ]);

const categoryById = new Map(categories.map((row) => [row.id, row]));
const siteById = new Map(sites.map((row) => [row.id, row]));
const areaById = new Map(areas.map((row) => [row.id, row]));
const profilesByProduct = new Map();
for (const profile of profiles) {
  const current = profilesByProduct.get(profile.product_id) ?? [];
  current.push(profile);
  profilesByProduct.set(profile.product_id, current);
}

const catalogos = products.map((product) => {
  const productProfiles = (profilesByProduct.get(product.id) ?? []).sort(
    (a, b) =>
      presentationRank(a) - presentationRank(b) ||
      a.label.localeCompare(b.label, "es"),
  );
  const profile = productProfiles[0] ?? null;
  const inputQty = Number(profile?.qty_in_input_unit ?? 0);
  const stockQty = Number(profile?.qty_in_stock_unit ?? 0);
  const conversion =
    profile && inputQty !== 0 ? Number((stockQty / inputQty).toFixed(6)) : "";
  const category = categoryById.get(product.category_id);
  const notes = [
    `tipo=${product.product_type}`,
    product.production_area_kind
      ? `área_producción=${product.production_area_kind}`
      : null,
    profile ? `uso_presentación=${profile.usage_context}` : null,
    profile ? `fuente_presentación=${profile.source}` : null,
    productProfiles.length > 1
      ? `${productProfiles.length - 1} presentación(es) adicional(es) en Supabase`
      : null,
    product.sku ? `sku=${product.sku}` : null,
  ]
    .filter(Boolean)
    .join("; ");

  return {
    producto_id: product.id,
    nombre_producto: product.name,
    categoria: category?.name ?? "",
    presentacion_id: profile?.id ?? "",
    presentacion: profile?.label ?? "",
    unidad_base: product.stock_unit_code ?? product.unit ?? "",
    unidad_operativa: profile?.input_unit_code ?? product.unit ?? "",
    factor_conversion: conversion,
    controla_lote: "",
    controla_vencimiento: "",
    controla_frio: "",
    temperatura_min_c: "",
    temperatura_max_c: "",
    es_retornable: "",
    proveedor_referencia: "",
    estado_registro: "ACTIVO",
    fecha_alta: product.created_at?.slice(0, 10) ?? "",
    responsable: "Sincronizado desde Supabase",
    observaciones: notes,
  };
});

const ubicaciones = locations.map((location) => {
  const site = siteById.get(location.site_id);
  const area = areaById.get(location.area_id);
  const point = [location.code, location.aisle, location.level]
    .filter(Boolean)
    .join(" · ");
  const notes = [
    location.description,
    site?.code ? `código_sede=${site.code}` : null,
    site?.site_kind ? `clase_sede=${site.site_kind}` : null,
    area?.code ? `código_área=${area.code}` : null,
  ]
    .filter(Boolean)
    .join("; ");

  return {
    ubicacion_id: location.id,
    sede: site?.name ?? "",
    area: area?.name ?? "",
    zona: location.zone ?? "",
    punto: point,
    tipo_ubicacion: location.location_type ?? area?.kind ?? "",
    permite_inventario: yesNo(true),
    requiere_frio: "",
    estado_registro: location.is_active === false ? "INACTIVO" : "ACTIVO",
    responsable: "Sincronizado desde Supabase",
    observaciones: notes,
  };
});

const operationalSites = [
  ...new Set(ubicaciones.map((location) => location.sede).filter(Boolean)),
].sort((a, b) => a.localeCompare(b, "es"));

if (catalogos.length === 0) throw new Error("Supabase no devolvió productos activos");
if (ubicaciones.length === 0)
  throw new Error("Supabase no devolvió ubicaciones activas");
if (new Set(catalogos.map((row) => row.producto_id)).size !== catalogos.length) {
  throw new Error("El catálogo exportado contiene producto_id duplicados");
}

const payload = {
  metadata: {
    schema_version: 1,
    source_project: "vento-os-dev",
    source_project_id: "clzdpinthhtknkmefsxx",
    exported_at: new Date().toISOString(),
    read_only: true,
    selection:
      "Productos activos, una presentación operativa priorizada por producto, sedes/áreas/ubicaciones activas",
    products: catalogos.length,
    active_uom_profiles_reviewed: profiles.length,
    active_sites_reviewed: sites.length,
    sites_with_inventory_locations: operationalSites.length,
    locations: ubicaciones.length,
  },
  catalogos,
  ubicaciones,
  sedes: operationalSites,
};

const temporaryPath = `${outputPath}.tmp`;
fs.writeFileSync(temporaryPath, `${JSON.stringify(payload, null, 2)}\n`, "utf8");
fs.renameSync(temporaryPath, outputPath);
console.log(
  JSON.stringify({
    output: outputPath,
    products: catalogos.length,
    locations: ubicaciones.length,
    sites: sites.length,
  }),
);
