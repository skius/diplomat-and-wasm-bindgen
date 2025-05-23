/* tslint:disable */
/* eslint-disable */
export const memory: WebAssembly.Memory;
export const Runner_create: () => number;
export const Runner_run: (a: number) => void;
export const Runner_destroy: (a: number) => void;
export const diplomat_init: () => void;
export const diplomat_simple_write: (a: number, b: number, c: number) => void;
export const diplomat_buffer_write_create: (a: number) => number;
export const diplomat_buffer_write_get_bytes: (a: number) => number;
export const diplomat_buffer_write_len: (a: number) => number;
export const diplomat_buffer_write_destroy: (a: number) => void;
export const diplomat_alloc: (a: number, b: number) => number;
export const diplomat_free: (a: number, b: number, c: number) => void;
export const diplomat_is_str: (a: number, b: number) => number;
export const __wbindgen_malloc: (a: number, b: number) => number;
export const __wbindgen_realloc: (a: number, b: number, c: number, d: number) => number;
export const __wbindgen_export_2: WebAssembly.Table;
export const __wbindgen_start: () => void;
