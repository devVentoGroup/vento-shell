import fs from "node:fs";
import path from "node:path";
import zlib from "node:zlib";

const root=process.cwd();
const read=(p)=>fs.readFileSync(path.resolve(root,p),"utf8");
const write=(p,s)=>{ const f=path.resolve(root,p); fs.mkdirSync(path.dirname(f),{recursive:true}); fs.writeFileSync(f,s.endsWith("\n")?s:s+"\n","utf8"); };
const gun=(s)=>zlib.gunzipSync(Buffer.from(s,"base64")).toString("utf8");
const gap8=gun(fs.readFileSync(".agent/payload/gap8.b64","utf8"));
let gate=gun(fs.readFileSync(".agent/payload/gate.b64","utf8"))
  .replace(/^\*\*PROPUESTA PARA APROBACIÓN\*\*\n\n/u,"")
  .replace(/^### 🟡 E1-GATE-001/mu,"### [ ] E1-GATE-001")
  .replace(/\*\*Estado:\*\* PROPUESTA PARA APROBACIÓN/u,"**Estado:** NO INICIADA")
  .replace(/```text\nPROPUESTA PARA APROBACIÓN\n```/u,"```text\nNO INICIADA\n```");

const oldPath="docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md";
let src=read(oldPath).replace(/\r\n?/g,"\n");
const ids=["GAP-CTRL-001","GAP-CTRL-002","GAP-CTRL-003","GAP-CTRL-004","GAP-CTRL-005","GAP-CTRL-006","GAP-CTRL-007","GAP-CTRL-008"];
const starts=ids.map(id=>src.search(new RegExp(`^### .*${id}\b`,"mu")));
if(starts.some(x=>x<0)) throw new Error("No se encontraron todas las tareas GAP-CTRL-001..008");
const pre=src.slice(0,starts[0]);
const blocks={};
for(let i=0;i<ids.length;i++) blocks[ids[i]]=src.slice(starts[i], i+1<ids.length?starts[i+1]:src.length);
for(const id of ids.slice(1,7)){
  let b=blocks[id];
  b=b.replace(/^\*\*PROPUESTA PARA APROBACIÓN\*\*\n+/mu,"")
     .replace(new RegExp(`^### 🟡 ${id}`,"mu"),`### ✅ ${id}`)
     .replace(/\*\*Estado:\*\* PROPUESTA PARA APROBACIÓN/g,"**Estado:** APROBADA")
     .replace(/\*\*PROPUESTA PARA APROBACIÓN\*\*/g,"**APROBADA**")
     .replace(/^.*permanece en propuesta hasta aprobación explícita.*\n?/gmi,"")
     .replace(/^.*no debe marcarse como aprobada ni integrarse.*\n?/gmi,"")
     .replace(/^No se inicia `GAP-CTRL-00[3-8]` dentro de esta propuesta\.\n?/gmi,"");
  blocks[id]=b;
}
if(!blocks["GAP-CTRL-007"].includes("**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS")){
 blocks["GAP-CTRL-007"]=blocks["GAP-CTRL-007"].replace("#### 15. Requisitos de prueba derivados","#### 15. Requisitos de prueba derivados\n\n**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS");
}
const outBase="docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/";
write(outBase+"07A_CONSOLIDACION_DEDUPLICACION_CLASIFICACION.md",pre+blocks["GAP-CTRL-001"]+blocks["GAP-CTRL-002"]+blocks["GAP-CTRL-003"]);
write(outBase+"07B_PROPIEDAD_CAPACIDAD_PROCESO.md",blocks["GAP-CTRL-004"]+blocks["GAP-CTRL-005"]);
write(outBase+"07C_TAREAS_Y_PAQUETES.md",blocks["GAP-CTRL-006"]);
write(outBase+"07D_CRITERIOS_Y_PUERTA_DE_FASE.md",blocks["GAP-CTRL-007"]+gap8+"\n"+gate);
fs.rmSync(path.resolve(root,oldPath));

let manifest=JSON.parse(read("docs/plan-canonico/modular/manifest.json"));
const oldRel="bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md";
const idx=manifest.files.indexOf(oldRel); if(idx<0) throw new Error("manifest sin 07 original");
manifest.files.splice(idx,1,
 "bloques/E1_DESCUBRIMIENTO_OPERATIVO/07A_CONSOLIDACION_DEDUPLICACION_CLASIFICACION.md",
 "bloques/E1_DESCUBRIMIENTO_OPERATIVO/07B_PROPIEDAD_CAPACIDAD_PROCESO.md",
 "bloques/E1_DESCUBRIMIENTO_OPERATIVO/07C_TAREAS_Y_PAQUETES.md",
 "bloques/E1_DESCUBRIMIENTO_OPERATIVO/07D_CRITERIOS_Y_PUERTA_DE_FASE.md");
write("docs/plan-canonico/modular/manifest.json",JSON.stringify(manifest,null,2));

let seq=JSON.parse(read("docs/plan-canonico/modular/active-sequence.json"));
if(!seq.segments.some(s=>s.prefix==="E1-GATE")) seq.segments.push({prefix:"E1-GATE",from:1,to:1});
write("docs/plan-canonico/modular/active-sequence.json",JSON.stringify(seq,null,2));

let order=read("docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md");
order=order.replace("→ `GAP-CTRL-001` a `GAP-CTRL-008`.","→ `GAP-CTRL-001` a `GAP-CTRL-008`\n   → `E1-GATE-001`.")
 .replace("7. Aprobar línea base de capacidades, registro de brechas y matriz de cobertura por repositorio","7. Ejecutar y aprobar `E1-GATE-001` para cerrar la línea base de capacidades, brechas y cobertura");
write("docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md",order);

let protocol=read("docs/plan-canonico/modular/01_PROTOCOLO.md");
const dup="Una tarea no podrá aprobarse cuando contenga un pendiente sin destino\no cuando cite una tarea que no exista formalmente en el roadmap.\n\nUna tarea no podrá aprobarse cuando contenga un pendiente sin destino\no cuando cite una tarea que no exista formalmente en el roadmap.";
protocol=protocol.replace(dup,"Una tarea no podrá aprobarse cuando contenga un pendiente sin destino\no cuando cite una tarea que no exista formalmente en el roadmap.");
write("docs/plan-canonico/modular/01_PROTOCOLO.md",protocol);

let map=read(outBase+"03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md");
const p15=map.indexOf("### ✅ CAP-MAP-015"); if(p15>=0){ const tail=map.slice(p15).replace("PROPUESTA PARA APROBACIÓN","APROBADA"); map=map.slice(0,p15)+tail; }
write(outBase+"03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md",map);

let treq=read(outBase+"04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md");
treq=treq.replace("- `UX`.","- `UX`;\n- `GAP`.")
 .replace("| Requisitos vigentes               |         **146** |","| Requisitos vigentes               |         **147** |")
 .replace("| Dominios con requisitos           |          **17** |","| Dominios con requisitos           |          **18** |")
 .replace("| Filas con catorce columnas        |  **146 de 146** |","| Filas con catorce columnas        |  **147 de 147** |")
 .replace("| Última tarea incorporada          | `CAP-SCOPE-018` |","| Última tarea incorporada          | `GAP-CTRL-008` |")
 .replace("| `UX`          | `TREQ-UX-001` a `TREQ-UX-007`                   |        7 |","| `UX`          | `TREQ-UX-001` a `TREQ-UX-007`                   |        7 |\n| `GAP`         | `TREQ-GAP-001`                                  |        1 |");
if(!treq.includes("#### GAP")) treq += `\n#### GAP\n\n| ID | Dominio | Regla protegida | Origen | Riesgo / prioridad | Tipo / modalidad | Tarea responsable | Paquete | Repositorio / ambiente | Estado | Artefacto | Último resultado | Evidencia | Relación |\n| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |\n| \`TREQ-GAP-001\` | \`GAP\` | La puerta de fase deberá producir de forma determinista un estado permitido y nunca aprobar una fase cuando una brecha crítica carezca de propietario válido, enrutamiento completo, evidencia de cierre válida o arrastre vigente; los conteos deberán reconciliar con la misma versión del registro canónico. | \`GAP-CTRL-008\` | Cierre falso de fase, omisión de brechas críticas o pérdida de trazabilidad / crítica | contractual + integridad documental + regresión / manual controlada y automatizable | \`E1-GATE-001\`; \`SHELL-CI-018\` | \`GAP-PKG-185\` | \`vento-shell\` / CI y revisión documental | \`IDENTIFICADO\` | Manifiesto \`E1-GATE-MANIFEST-001\` | Pendiente | Pendiente | Ejecución manual en \`E1-GATE-001\`; automatización antes del primer cutover |\n`;
write(outBase+"04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md",treq);

let salida=read(outBase+"08_SALIDA_OBLIGATORIA.md");
if(!salida.includes("E1-GATE-MANIFEST-001")) salida += "\nEl cierre documental de BLOQUE E1 exige además `E1-GATE-MANIFEST-001`, emitido y aprobado mediante `E1-GATE-001`.\n";
write(outBase+"08_SALIDA_OBLIGATORIA.md",salida);

for(const f of [".github/workflows/agent-close-e1.yml","scripts/docs/agent-close-e1.mjs",".agent"]){ const p=path.resolve(root,f); if(fs.existsSync(p)) fs.rmSync(p); }
console.log("OK: fuentes de E1 consolidadas");
