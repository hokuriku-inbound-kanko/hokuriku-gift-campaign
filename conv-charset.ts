import { parseArgs } from "@std/cli/parse-args";
const { path, from } = parseArgs(Deno.args);

if (!path) {
  console.error("Convert target file path is REQUIRED.");
  Deno.exit(1);
}
if (!from) {
  console.error("Convert target file charset is REQUIRED.");
  Deno.exit(1);
}

const decoder = new TextDecoder(from);
const data = Deno.readFileSync(path);
Deno.writeTextFileSync(path, decoder.decode(data));
