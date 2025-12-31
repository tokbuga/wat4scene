(module
    (memory 1 1 shared)

    (include "window.wat")
    (include "self/CSS.wat")
    (include "self/Node.wat")
    (include "self/Element.wat")
    (include "self/HTMLElement.wat")
    (include "self/HTMLCanvasElement.wat")
    (include "self/CSSStyleDeclaration.wat")
    (include "self/Document.wat")
    (include "self/EventTarget.wat")
    (include "self/MouseEvent.wat")

    (global $canvas* mut i32)
    (global $canvas mut ext)
    (global $canvas.style mut ext)

    (func $i32.load.innerWidth   (result i32) (i32.load offset=12 (gget $canvas*)))
    (func $i32.load.innerHeight  (result i32) (i32.load offset=16 (gget $canvas*)))
    (func $i32.load.clientX      (result f32) (f32.load offset=20 (gget $canvas*)))
    (func $i32.load.clientY      (result f32) (f32.load offset=24 (gget $canvas*)))

    (func $i32.store.innerWidth  (param i32) (i32.store offset=12 (gget $canvas*) (local.get 0)))
    (func $i32.store.innerHeight (param i32) (i32.store offset=16 (gget $canvas*) (local.get 0)))
    (func $f32.store.clientX     (param f32) (f32.store offset=20 (gget $canvas*) (local.get 0)))
    (func $f32.store.clientY     (param f32) (f32.store offset=24 (gget $canvas*) (local.get 0)))

    (main $init
        (call $init_document)
        (call $create_canvas)
        (call $listen_events)
        (call $handle_resize)
    )

    (func $listen_events
        (call $window.onresize<fun> (ref.func $handle_resize))
        (call $window.onpointermove<fun> (ref.func $handle_pointer))
    )
   
    (func $handle_pointer
        (param $event <PointerEvent>)

        (call $f32.store.clientX (call $MouseEvent:clientX<ext>f32 (this)))
        (call $f32.store.clientY (call $MouseEvent:clientY<ext>f32 (this)))
    )

    (func $handle_resize
        (call $store_window)
        (call $resize_canvas)
    )

    (func $init_document
        (call $CSSStyleDeclaration:margin<ext.i32>
            (call $HTMLElement:style<ext>ext (self $document.body))
            (false)
        )

        (call $Element:removeAttribute<ext.ext>
            (self $document.body)
            (text "onload")
        )

        (call $Element:remove<ext>
            (self $document.head)
        )
    )

    (func $create_canvas
        (if (gget $canvas != null)
            (then
                (call $Node:removeChild<ext.ext>
                    (self $document.body)
                    (gget $canvas)
                )
            )
        )

        (gset $canvas       (call $HTMLCanvasElement<>ext))
        (gset $canvas.style (call $HTMLElement:style<ext>ext (gget $canvas)))

        (call $Element:append<ext.ext> 
            (self $document.body) 
            (gget $canvas)
        )

        (call $resize_canvas)
    )

    (func $store_window
        (call $i32.store.innerWidth 
            (call $window.innerWidth<>i32)
        )

        (call $i32.store.innerHeight 
            (call $window.innerHeight<>i32)
        )
    )

    (func $resize_canvas
        (call $HTMLCanvasElement:width<ext.i32>
            (gget $canvas) (call $i32.load.innerWidth)
        )

        (call $HTMLCanvasElement:height<ext.i32>
            (gget $canvas) (call $i32.load.innerHeight)
        )

        (call $CSSStyleDeclaration:width<ext.i32>
            (gget $canvas.style)
            (call $i32.load.innerWidth)
        )

        (call $CSSStyleDeclaration:height<ext.i32>
            (gget $canvas.style)
            (call $i32.load.innerHeight)
        )
    )
)