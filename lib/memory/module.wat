(module 
    (import "self" "memory" (include "memory/definition.wat"))

    (main $align
        (i32.store (i32.const 0) (i32.const 0))
        (i32.store (i32.const 4) (i32.const 16))
    )

    (elem funcref (ref.func $malloc<i32>i32))

    (func $malloc<i32>i32 
        (param $byteLength i32)
        (result i32)

        (i32.atomic.rmw.add (i32.const 4) (local.get 0))
    )

    (export "malloc" (func $malloc<i32>i32))
)