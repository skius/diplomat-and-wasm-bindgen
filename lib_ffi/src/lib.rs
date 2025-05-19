use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
extern "C" {
    fn prompt(s: &str) -> String;
}

#[diplomat::bridge]
mod ffi {
    use crate::prompt;

    #[diplomat::opaque]
    pub struct Runner();

    impl Runner {
        pub fn create() -> Box<Runner> {
            Box::new(Runner())
        }
        
        pub fn run(&self) {
            let name = prompt("Enter your name:");
            let age = prompt("Enter your age:");
            let message = format!("Hello, {}! You are {} years old.", name, age);
            log::info!("{message}");
        }
    }


}