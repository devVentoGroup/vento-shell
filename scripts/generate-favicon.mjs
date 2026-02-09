/**
 * Genera src/app/favicon.ico desde public/vento-group.png (logo Vento Group).
 * Ejecutar: npm run generate-favicon
 * Requiere: npm i -D sharp png-to-ico
 */
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import sharp from "sharp";
import pngToIco from "png-to-ico";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.join(__dirname, "..");
const srcPath = path.join(root, "public", "vento-group.png");
const outPath = path.join(root, "src", "app", "favicon.ico");

async function main() {
  const sizes = [16, 32];
  const pngs = await Promise.all(
    sizes.map((size) =>
      sharp(srcPath)
        .resize(size, size)
        .png()
        .toBuffer()
    )
  );
  const ico = await pngToIco(pngs);
  if (fs.existsSync(outPath)) {
    const stat = fs.statSync(outPath);
    if (stat.isDirectory()) fs.rmSync(outPath, { recursive: true });
  }
  fs.writeFileSync(outPath, ico);
  console.log("OK: src/app/favicon.ico generado");
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
