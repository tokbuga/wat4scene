(module
    (import "self" "memory" (memory $shared 100 100 shared))
    (import "memory" "buffer" (global $buffer externref))

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
    (include "self/ImageData.wat")
    (include "self/Uint8ClampedArray.wat")
    (include "self/CanvasRenderingContext2D.wat")

    (global $ptr*               mut i32)
    (global $canvas             mut ext)
    (global $context            mut ext)
    (global $renderFrame        mut ext)

    (global $canvas.dataView    mut ext)
    (global $memory.dataView    mut ext)

    (global $dataViewOffset     i32 i32(28))

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

    (main $init
        (call $init_document)
        (call $create_canvas)
        (call $listen_events)
        (call $render)

        (call $self.Reflect.set<ext.ext.ext>
            (global.get $canvas)
            (string "style")
            (string "box-shadow: inset 0 0 0 1px red")
        )
    )

    (func $listen_events
        (call $window.onresize<fun> (ref.func $handle_resize))
        (call $window.onpointermove<fun> (ref.func $handle_pointer))
    )
   
    (func $handle_pointer
        (param $event <PointerEvent>)
        (local $offset i32)

        (call $i32.store.clientX (call $MouseEvent:clientX<ext>i32 (this)))
        (call $i32.store.clientY (call $MouseEvent:clientY<ext>i32 (this)))

        (local.set $offset 
            (call $calc_offset<i32.i32>i32
                (call $i32.load.clientX) 
                (call $i32.load.clientY) 
            )
        )

        (i32.store8 offset=0 (lget $offset) i32(55))
        (i32.store8 offset=1 (lget $offset) i32(124))
        (i32.store8 offset=2 (lget $offset) i32(22))
        (i32.store8 offset=3 (lget $offset) i32(255))

        (call $render)
    )

    (func $calc_offset<i32.i32>i32
        (param $clientX        i32)
        (param $clientY        i32)
        (result                i32)

        (i32.add 
            (;
                burada bir hata var.. (yok yok :d)
                28 degeri, aslında dataview offset..
                sanki Uint8ClampedArray:set icindeki ilk deger olan
                memory.dataView hic offseti yokmus gibi davraniyor

                hmmm dogru dogru boyle olacak
                veya 
                --> i32.store8 offset=1 (lget $offset) i32(55)
                yerine
                --> i32.store8 offset=1+28 (lget $offset) i32(55)
            ;)
            (gget $dataViewOffset)
            (i32.add 
                (i32.mul 
                    (call $i32.load.innerWidth)
                    (i32.mul (lget $clientY) (i32.const 4))
                )
                (i32.mul (lget $clientX) (i32.const 4))
            )
        )
    )

    (func $calc_offset<f32.f32>i32
        (param $clientX        f32)
        (param $clientY        f32)
        (result                i32)

        (call $i32.calc.offset<i32.i32>i32
            (i32.trunc_f32_s (lget $clientX)) 
            (i32.trunc_f32_s (lget $clientY)) 
        )
    )

    (func $handle_resize
        (call $store_window)
        (call $resize_canvas)
        (call $resize_dataviews)

        (call $render)
    )

    (func $render
        (call $update_canvas_data)
        (call $update_canvas_view)
    )

    (func $init_document
        (call $CSSStyleDeclaration:margin<ext.i32>
            (call $HTMLElement:style<ext>ext (ref.extern $document.body))
            (i32.const 0)
        )

        (call $Element:removeAttribute<ext.ext>
            (ref.extern $document.body)
            (text "onload")
        )

        (call $Element:remove<ext>
            (ref.extern $document.head)
        )
    )

    (func $create_canvas
        (if (gget $canvas != null)
            (then
                (call $Node:removeChild<ext.ext>
                    (ref.extern $document.body)
                    (gget $canvas)
                )
            )
        )

        (gset $canvas (call $HTMLCanvasElement<>ext))        

        (call $store_window)
        (call $resize_canvas)
        (call $append_canvas)
        
        (gset $context 
            (call $HTMLCanvasElement:CanvasRenderingContext2D<ext>ext 
                (gget $canvas)
            )
        )

        (call $resize_dataviews)
    )

    (func $update_canvas_view
        (call $CanvasRenderingContext2D:putImageData<ext.ext>  
            (gget $context) 
            (gget $renderFrame)
        )
    )

    (func $create_canvas_data
        (gset $canvas.dataView  
            (call $ImageData:data<ext>ext 
                (gget $renderFrame)
            )
        )
    )

    (func $create_memory_data
        (gset $memory.dataView  
            (call $Uint8ClampedArray<ext.i32.i32>ext
                (gget $buffer)
                (gget $dataViewOffset)
                (call $i32.load.dataView.length)
            )
        )
    )

    (func $update_memory_view
        (call $Uint8ClampedArray:set<ext.ext>
            (gget $memory.dataView)
            (gget $canvas.dataView)
        )
    )

    (func $update_canvas_data
        (call $Uint8ClampedArray:set<ext.ext>
            (gget $canvas.dataView)
            (gget $memory.dataView)
        )
    )

    (func $store_window
        (call $i32.store.innerWidth 
            (call $window.innerWidth<>i32)
        )

        (call $i32.store.innerHeight 
            (call $window.innerHeight<>i32)
        )
    )

    (func $append_canvas
        (call $Element:append<ext.ext> 
            (ref.extern $document.body) 
            (gget $canvas)
        )    
    )

    (func $resize_canvas
        (call $HTMLCanvasElement:width<ext.i32>
            (gget $canvas) (call $i32.load.innerWidth)
        )

        (call $HTMLCanvasElement:height<ext.i32>
            (gget $canvas) (call $i32.load.innerHeight)
        )
    )

    (func $resize_dataviews
        (gset $renderFrame 
            (call $CanvasRenderingContext2D:createImageData<ext.i32.i32>ext 
                (gget $context)
                (call $i32.load.innerWidth)
                (call $i32.load.innerHeight)
            )
        )

        (call $create_canvas_data)
        (call $create_memory_data)    
        (call $update_memory_view)    
    )

    (func $i32.load.dataView.length
        (result i32)
        (i32.mul
            (i32.const 4)
            (i32.mul
                (call $i32.load.innerWidth)
                (call $i32.load.innerHeight)
            )
        )
    )
)