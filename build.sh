set -e

# build #[wasm_bindgen] JS imports as basic JavaScript module
wasm-pack build -t web -d "../lib-js/wbg" lib_ffi/

# run diplomat-tool for #[diplomat::bridge] modules
diplomat-tool -e lib_ffi/src/lib.rs js "lib-js/api"

# fix diplomat generated code
cp lib-js/diplomat-wasm.mjs.template lib-js/api/diplomat-wasm.mjs

# fix wasm-bindgen generated code
# fix .gitignore
cp lib-js/wbg/.gitignore.template lib-js/wbg/.gitignore
file="lib-js/wbg/lib_ffi.js"

# Remove the line: import * as __wbg_star0 from 'env';
sed -i "/^import \* as __wbg_star0 from 'env';$/d" "$file"

# Change "function __wbg_get_imports()" back to "export function __wbg_get_imports()"
sed -i "s/^function __wbg_get_imports()/export function __wbg_get_imports()/" "$file"

# Remove the line: imports['env'] = __wbg_star0;
sed -i "/imports\['env'\] = __wbg_star0;/d" "$file"

# Change "async function __wbg_init(module_or_path)" back to "async function __wbg_init(imports, module_or_path)"
sed -i "s/^async function __wbg_init(module_or_path)/async function __wbg_init(imports, module_or_path)/" "$file"
sed -i "s/^function initSync(module) {/function initSync(imports, module) {/" "$file"

# Remove the line: const imports = __wbg_get_imports();
sed -i "/^    const imports = __wbg_get_imports();$/d" "$file"