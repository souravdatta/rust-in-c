extern crate libc;

#[no_mangle]
pub extern "C" fn add(v1: i32, v2: i32) -> i32 {
    v1 + v2
}
