(module
    (import "self" "memory" (include "memory/definition.wat"))
    (import "memory" "buffer" (global $buffer externref))

    (include "self/MouseEvent.wat")
    (include "self/EventTarget.wat")

    (global $ptr* mut i32)

    (func $i32.load.innerWidth   (result i32) (i32.load offset=12 (gget $ptr*)))
    (func $i32.load.innerHeight  (result i32) (i32.load offset=16 (gget $ptr*)))
    (func $i32.load.clientX      (result i32) (i32.load offset=20 (gget $ptr*)))
    (func $i32.load.clientY      (result i32) (i32.load offset=24 (gget $ptr*)))
    (func $f32.load.clientX      (result f32) (f32.load offset=20 (gget $ptr*)))
    (func $f32.load.clientY      (result f32) (f32.load offset=24 (gget $ptr*)))

    (func $i32.store.innerWidth  (param i32) (i32.store offset=12 (gget $ptr*) (local.get 0)))
    (func $i32.store.innerHeight (param i32) (i32.store offset=16 (gget $ptr*) (local.get 0)))
    (func $i32.store.clientX     (param i32) (i32.store offset=20 (gget $ptr*) (local.get 0)))
    (func $i32.store.clientY     (param i32) (i32.store offset=24 (gget $ptr*) (local.get 0)))
    (func $f32.store.clientX     (param f32) (f32.store offset=20 (gget $ptr*) (local.get 0)))
    (func $f32.store.clientY     (param f32) (f32.store offset=24 (gget $ptr*) (local.get 0)))

    (main $listen_events
        (call $EventTarget:addEventListener<ext.ext.fun>
            (self) 
            (text "pointermove") 
            (ref.func $handle_pointer)
        )

        (call $EventTarget:addEventListener<ext.ext.fun>
            (self) 
            (text "resize") 
            (ref.func $handle_resize)
        )
    )

    (func $handle_resize
        (call $i32.store.innerWidth (reflect $apply<ext.ext.ext>i32 (ref.extern $innerWidth[get]) (self) (self)))
        (call $i32.store.innerHeight (reflect $apply<ext.ext.ext>i32 (ref.extern $innerHeight[get]) (self) (self)))
    )

    (func $handle_pointer
        (param $event <PointerEvent>)
        (local $offset i32)

        (call $i32.store.clientX (call $MouseEvent:clientX<ext>i32 (this)))
        (call $i32.store.clientY (call $MouseEvent:clientY<ext>i32 (this)))
    )
)