(module
  (import "self" "self"                        (global $self                                            externref))
  (import "self" "Array"                       (func $self.Array<>ext                                   (param) (result externref)))
  (import "String" "fromCharCode"              (global $self.String.fromCharCode                        externref))
  (import "Array" "of"                         (func $self.Array.of<i32>ext                             (param i32) (result externref)))
  (import "Array" "of"                         (func $self.Array.of<ext>ext                             (param externref) (result externref)))
  (import "Reflect" "set"                      (func $self.Reflect.set<ext.i32.i32>                     (param externref i32 i32) (result)))
  (import "Array" "of"                         (func $self.Array.of<ext.fun>ext                         (param externref funcref) (result externref)))
  (import "Reflect" "set"                      (func $self.Reflect.set<ext.i32.ext>                     (param externref i32 externref) (result)))
  (import "Array" "of"                         (func $self.Array.of<ext.ext>ext                         (param externref externref) (result externref)))
  (import "Reflect" "get"                      (func $self.Reflect.get<ext.ext>ext                      (param externref externref) (result externref)))
  (import "Reflect" "apply"                    (func $self.Reflect.apply<ext.ext.ext>                   (param externref externref externref) (result)))
  (import "Reflect" "apply"                    (func $self.Reflect.apply<ext.ext.ext>f32                (param externref externref externref) (result f32)))
  (import "Reflect" "apply"                    (func $self.Reflect.apply<ext.ext.ext>i32                (param externref externref externref) (result i32)))
  (import "Reflect" "construct"                (func $self.Reflect.construct<ext.ext>ext                (param externref externref) (result externref)))
  (import "Reflect" "apply"                    (func $self.Reflect.apply<ext.ext.ext>ext                (param externref externref externref) (result externref)))
  (import "Reflect" "getOwnPropertyDescriptor" (func $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext (param externref externref) (result externref)))


  (func $window.innerWidth<>i32
    (result i32)
    (call $self.Reflect.apply<ext.ext.ext>i32  (table.get $wat4wasm (i32.const 35)) ;; $self.innerWidth/get
      (global.get $self) (call $self.Array<>ext))
  )

  (func $window.innerHeight<>i32
    (result i32)
    (call $self.Reflect.apply<ext.ext.ext>i32  (table.get $wat4wasm (i32.const 34)) ;; $self.innerHeight/get
      (global.get $self) (call $self.Array<>ext))
  )

  (global $window.onresize      (mut funcref) (ref.null func))
  (global $window.onpointermove (mut funcref) (ref.null func))

  (func $window.onresize<fun>
    (param $onresize funcref)
    (if (local.get $onresize) (ref.is_null) (i32.eqz)
      (then
        (global.set $window.onresize (local.get $onresize))
        (call $EventTarget:addEventListener<ext.ext.fun>
          (global.get $self) (table.get $wat4wasm (i32.const 15));; resize
          (global.get $window.onresize)
        )
      )
      (else
        (call $EventTarget:removeEventListener<ext.ext.fun>
          (global.get $self) (table.get $wat4wasm (i32.const 15));; resize
          (global.get $window.onresize)
        )
        (global.set $window.onresize (local.get $onresize))
      )
    )
  )

  (func $window.onpointermove<fun>
    (param $onpointermove funcref)

    (if (local.get $onpointermove) (ref.is_null) (i32.eqz)
      (then
        (global.set $window.onpointermove (local.get $onpointermove))
        (call $EventTarget:addEventListener<ext.ext.fun>
          (global.get $self) (table.get $wat4wasm (i32.const 13));; pointermove
          (global.get $window.onpointermove)
        )
      )
      (else
        (call $EventTarget:removeEventListener<ext.ext.fun>
          (global.get $self) (table.get $wat4wasm (i32.const 13));; pointermove
          (global.get $window.onpointermove)
        )
        (global.set $window.onpointermove (local.get $onpointermove))
      )
    )
  )


  (func $CSS.px<i32>ext
    (param $value i32)
    (result externref)
    (call $self.Reflect.apply<ext.ext.ext>ext
      (table.get $wat4wasm (i32.const 33)) ;; $self.CSS.px<ext>

      (ref.null extern)
      (call $self.Array.of<i32>ext (local.get 0))
    )
  )


  (func $Node:removeChild<ext.ext>
    (param $element externref)
    (param $child externref)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 32)) ;; $self.Node.prototype.removeChild<ext>

      (local.get 0)
      (call $self.Array.of<ext>ext (local.get $child))
    )
  )


  (func $Element:append<ext.ext>
    (param $parent      externref)
    (param $child       externref)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 31)) ;; $self.Element.prototype.append<ext>

      (local.get 0)
      (call $self.Array.of<ext>ext (local.get $child))
    )
  )

  (func $Element:removeAttribute<ext.ext>
    (param $element externref)
    (param $attribute externref)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 30)) ;; $self.Element.prototype.removeAttribute<ext>

      (local.get 0)
      (call $self.Array.of<ext>ext (local.get $attribute))
    )
  )

  (func $Element:remove<ext>
    (param $element externref)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 29)) ;; $self.Element.prototype.remove<ext>

      (local.get 0)
      (call $self.Array<>ext)
    )
  )


  (func $HTMLElement:style<ext>ext
    (param $element externref)
    (result externref)
    (call $self.Reflect.apply<ext.ext.ext>ext
      (table.get $wat4wasm (i32.const 28)) ;; $self.HTMLElement.prototype.style/get

      (local.get 0)
      (call $self.Array<>ext)
    )
  )

  (func $HTMLCanvasElement<>ext
    (result externref)
    (call $Document:createElement<ext>ext
      (table.get $wat4wasm (i32.const 12));; canvas

    )
  )

  (func $HTMLCanvasElement:width<ext.i32>
    (param $element externref)
    (param $value                   i32)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 27)) ;; $self.HTMLCanvasElement.prototype.width/set

      (local.get 0)
      (call $self.Array.of<i32>ext (local.get $value))
    )
  )

  (func $HTMLCanvasElement:height<ext.i32>
    (param $element externref)
    (param $value                   i32)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 26)) ;; $self.HTMLCanvasElement.prototype.height/set

      (local.get 0)
      (call $self.Array.of<i32>ext (local.get $value))
    )
  )

  (func $HTMLCanvasElement:height<ext>i32
    (param $element externref)
    (result                         i32)
    (call $self.Reflect.apply<ext.ext.ext>i32
      (table.get $wat4wasm (i32.const 25)) ;; $self.HTMLCanvasElement.prototype.height/get

      (local.get 0)
      (call $self.Array<>ext)
    )
  )

  (func $CSSStyleDeclaration:setProperty<ext.ext.ext>
    (param $style   externref)
    (param $property             externref)
    (param $definition          externref)
    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 24)) ;; $self.CSSStyleDeclaration.prototype.setProperty<ext>

      (local.get 0)
      (call $self.Array.of<ext.ext>ext
        (local.get $property)
        (local.get $definition)
      )
    )
  )

  (func $CSSStyleDeclaration:width<ext.i32>
    (param $style   externref)
    (param $value                     i32)
    (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
      (local.get 0)
      (table.get $wat4wasm (i32.const 11));; width

      (call $CSS.px<i32>ext (local.get $value))
    )
  )

  (func $CSSStyleDeclaration:height<ext.i32>
    (param $style   externref)
    (param $value                     i32)
    (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
      (local.get 0)
      (table.get $wat4wasm (i32.const 10));; height

      (call $CSS.px<i32>ext (local.get $value))
    )
  )

  (func $CSSStyleDeclaration:margin<ext.i32>
    (param $style   externref)
    (param $value                     i32)
    (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
      (local.get 0)
      (table.get $wat4wasm (i32.const 9));; margin

      (call $CSS.px<i32>ext (local.get $value))
    )
  )

  (func $CSSStyleDeclaration:position<ext.ext>
    (param $style   externref)
    (param $value                externref)
    (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
      (local.get 0)
      (table.get $wat4wasm (i32.const 8));; position

      (local.get $value)
    )
  )

  (func $CSSStyleDeclaration:getPropertyValue<ext.ext>ext
    (param $style   externref)
    (param $property             externref)
    (result                     externref)
    (call $self.Reflect.apply<ext.ext.ext>ext
      (table.get $wat4wasm (i32.const 23)) ;; $self.CSSStyleDeclaration.prototype.getPropertyValue<ext>

      (local.get 0)
      (call $self.Array.of<ext>ext (local.get $property))
    )
  )

  (func $Document:createElement<ext>ext
    (param $tagName externref)
    (result externref)
    (call $self.Reflect.apply<ext.ext.ext>ext
      (table.get $wat4wasm (i32.const 22)) ;; $self.Document.prototype.createElement<ext>

      (table.get $wat4wasm (i32.const 21)) ;; $self.document<ext>

      (call $self.Array.of<ext>ext (local.get 0))
    )
  )


  (func $EventTarget:addEventListener<ext.ext.fun>
    (param $target externref)
    (param $type        externref)
    (param $handler      funcref)

    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 20)) ;; $self.EventTarget.prototype.addEventListener<ext>

      (local.get 0)
      (call $self.Array.of<ext.fun>ext
        (local.get $type)
        (local.get $handler)
      )
    )
  )

  (func $EventTarget:removeEventListener<ext.ext.fun>
    (param $target externref)
    (param $type        externref)
    (param $handler      funcref)

    (call $self.Reflect.apply<ext.ext.ext>
      (table.get $wat4wasm (i32.const 19)) ;; $self.EventTarget.prototype.removeEventListener<ext>

      (local.get 0)
      (call $self.Array.of<ext.fun>ext
        (local.get $type)
        (local.get $handler)
      )
    )
  )


  (func $MouseEvent:clientX<ext>f32
    (param $event externref)
    (result f32)
    (call $self.Reflect.apply<ext.ext.ext>f32  (table.get $wat4wasm (i32.const 18)) ;; $self.MouseEvent.prototype.clientX/get
      (local.get 0) (global.get $self))
  )

  (func $MouseEvent:clientY<ext>f32
    (param $event externref)
    (result f32)
    (call $self.Reflect.apply<ext.ext.ext>f32  (table.get $wat4wasm (i32.const 17)) ;; $self.MouseEvent.prototype.clientY/get
      (local.get 0) (global.get $self))
  )


  (global $canvas*              (mut i32) (i32.const 0))
  (global $canvas               (mut externref) (ref.null extern))
  (global $canvas.style         (mut externref) (ref.null extern))

  (func $i32.load.innerWidth   (result i32) (i32.load offset=12 (global.get $canvas*)))
  (func $i32.load.innerHeight  (result i32) (i32.load offset=16 (global.get $canvas*)))
  (func $i32.load.clientX      (result f32) (f32.load offset=20 (global.get $canvas*)))
  (func $i32.load.clientY      (result f32) (f32.load offset=24 (global.get $canvas*)))

  (func $i32.store.innerWidth  (param i32) (i32.store offset=12 (global.get $canvas*) (local.get 0)))
  (func $i32.store.innerHeight (param i32) (i32.store offset=16 (global.get $canvas*) (local.get 0)))
  (func $f32.store.clientX     (param f32) (f32.store offset=20 (global.get $canvas*) (local.get 0)))
  (func $f32.store.clientY     (param f32) (f32.store offset=24 (global.get $canvas*) (local.get 0)))



  (func $init
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
    (param $event externref)

    (call $f32.store.clientX (call $MouseEvent:clientX<ext>f32 (local.get 0)))
    (call $f32.store.clientY (call $MouseEvent:clientY<ext>f32 (local.get 0)))
  )

  (func $handle_resize
    (call $store_window)
    (call $resize_canvas)
  )

  (func $init_document
    (call $CSSStyleDeclaration:margin<ext.i32>
      (call $HTMLElement:style<ext>ext (table.get $wat4wasm (i32.const 2)) ;; $self.document.body<ext>
      )
      (i32.const 0)
    )

    (call $Element:removeAttribute<ext.ext>
      (table.get $wat4wasm (i32.const 2)) ;; $self.document.body<ext>

      (table.get $wat4wasm (i32.const 1));; onload

    )

    (call $Element:remove<ext>
      (table.get $wat4wasm (i32.const 3)) ;; $self.document.head<ext>

    )
  )

  (func $create_canvas
    (if (global.get $canvas) (ref.is_null) (i32.eqz)
      (then
        (call $Node:removeChild<ext.ext>
          (table.get $wat4wasm (i32.const 2)) ;; $self.document.body<ext>

          (global.get $canvas)
        )
      )
    )

    (global.set $canvas       (call $HTMLCanvasElement<>ext))
    (global.set $canvas.style (call $HTMLElement:style<ext>ext (global.get $canvas)))

    (call $Element:append<ext.ext>
      (table.get $wat4wasm (i32.const 2)) ;; $self.document.body<ext>

      (global.get $canvas)
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
      (global.get $canvas) (call $i32.load.innerWidth)
    )

    (call $HTMLCanvasElement:height<ext.i32>
      (global.get $canvas) (call $i32.load.innerHeight)
    )

    (call $CSSStyleDeclaration:width<ext.i32>
      (global.get $canvas.style)
      (call $i32.load.innerWidth)
    )

    (call $CSSStyleDeclaration:height<ext.i32>
      (global.get $canvas.style)
      (call $i32.load.innerHeight)
    )
  )

  (global $wat4wasm             (mut externref) (ref.null extern))

  (table $wat4wasm 94 externref)

  (elem $wat4wasm declare func $handle_pointer $handle_resize)


  (func $wat4wasm
    (local $textDecoder externref)
    (local $textDecoder.decode externref)
    (local $Uint8Array externref)
    (local $arguments externref)
    (local $arrayBufferView externref)
    (local $viewAt i32)
    (local $offset i32)
    (local $length i32)
    (block $prepare
      (local.set $textDecoder
        (call $self.Reflect.construct<ext.ext>ext
          (call $self.Reflect.get<ext.ext>ext
            (global.get $self)

            (block (; "TextDecoder" ;)
              (result externref)
              (global.set $wat4wasm (call $self.Array<>ext))

              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 0) (i32.const 84))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 1) (i32.const 101))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 2) (i32.const 120))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 3) (i32.const 116))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 4) (i32.const 68))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 5) (i32.const 101))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 6) (i32.const 99))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 7) (i32.const 111))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 8) (i32.const 100))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 9) (i32.const 101))
              (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 10) (i32.const 114))

              (call $self.Reflect.apply<ext.ext.ext>ext
                (global.get $self.String.fromCharCode)
                (ref.null extern)
                (global.get $wat4wasm)
              )
              ;; stacked

              (global.set $wat4wasm (ref.null extern))
              ;; cleared
            )

          )
          (global.get $self)
        )
      )
      (local.set $textDecoder.decode
        (call $self.Reflect.get<ext.ext>ext
          (local.get $textDecoder)

          (block (; "decode" ;)
            (result externref)
            (global.set $wat4wasm (call $self.Array<>ext))

            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 0) (i32.const 100))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 1) (i32.const 101))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 2) (i32.const 99))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 3) (i32.const 111))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 4) (i32.const 100))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 5) (i32.const 101))

            (call $self.Reflect.apply<ext.ext.ext>ext
              (global.get $self.String.fromCharCode)
              (ref.null extern)
              (global.get $wat4wasm)
            )
            ;; stacked

            (global.set $wat4wasm (ref.null extern))
            ;; cleared
          )

        )
      )
      (local.set $Uint8Array
        (call $self.Reflect.get<ext.ext>ext
          (global.get $self)

          (block (; "Uint8Array" ;)
            (result externref)
            (global.set $wat4wasm (call $self.Array<>ext))

            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 0) (i32.const 85))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 1) (i32.const 105))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 2) (i32.const 110))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 3) (i32.const 116))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 4) (i32.const 56))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 5) (i32.const 65))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 6) (i32.const 114))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 7) (i32.const 114))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 8) (i32.const 97))
            (call $self.Reflect.set<ext.i32.i32> (global.get $wat4wasm) (i32.const 9) (i32.const 121))

            (call $self.Reflect.apply<ext.ext.ext>ext
              (global.get $self.String.fromCharCode)
              (ref.null extern)
              (global.get $wat4wasm)
            )
            ;; stacked

            (global.set $wat4wasm (ref.null extern))
            ;; cleared
          )

        )
      )
    )
    ;;secure zero heap for memory.init
    (i32.const 0)
    (i32.load (i32.const 0))
    ;; offset and value stacked now
    (block $oninit
      (block $decodeText/4:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 4))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 1)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; onload
        ))
      )

      (block $decodeText/10:4
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 10))
        (local.set $length (i32.const 4))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 4)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; head
        ))
      )
      (block $decodeText/14:8
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 14))
        (local.set $length (i32.const 8))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 5)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; document
        ))
      )
      (block $decodeText/22:4
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 22))
        (local.set $length (i32.const 4))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 6)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; body
        ))
      )
      (block $decodeText/14:8
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 14))
        (local.set $length (i32.const 8))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 7)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; document
        ))
      )
      (block $decodeText/26:8
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 26))
        (local.set $length (i32.const 8))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 8)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; position
        ))
      )
      (block $decodeText/34:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 34))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 9)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; margin
        ))
      )
      (block $decodeText/40:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 40))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 10)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; height
        ))
      )
      (block $decodeText/46:5
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 46))
        (local.set $length (i32.const 5))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 11)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; width
        ))
      )
      (block $decodeText/51:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 51))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 12)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; canvas
        ))
      )
      (block $decodeText/57:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 57))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 13)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; pointermove
        ))
      )
      (block $decodeText/57:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 57))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 14)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; pointermove
        ))
      )
      (block $decodeText/68:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 68))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 15)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; resize
        ))
      )
      (block $decodeText/68:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 68))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 16)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; resize
        ))
      )

      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 36)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/77:10
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 77))
        (local.set $length (i32.const 10))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 37)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; innerWidth
        ))
      )
      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 38)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/87:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 87))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 39)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; innerHeight
        ))
      )
      (block $decodeText/98:2
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 98))
        (local.set $length (i32.const 2))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 40)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; px
        ))
      )
      (block $decodeText/100:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 100))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 41)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; CSS
        ))
      )
      (block $decodeText/103:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 103))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 42)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; removeChild
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 43)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/123:4
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 123))
        (local.set $length (i32.const 4))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 44)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; Node
        ))
      )
      (block $decodeText/127:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 127))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 45)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; append
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 46)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/133:7
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 133))
        (local.set $length (i32.const 7))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 47)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; Element
        ))
      )
      (block $decodeText/140:15
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 140))
        (local.set $length (i32.const 15))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 48)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; remov ... ibute
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 49)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/133:7
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 133))
        (local.set $length (i32.const 7))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 50)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; Element
        ))
      )
      (block $decodeText/103:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 103))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 51)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; remove
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 52)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/133:7
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 133))
        (local.set $length (i32.const 7))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 53)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; Element
        ))
      )
      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 54)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/155:5
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 155))
        (local.set $length (i32.const 5))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 55)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; style
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 56)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/160:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 160))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 57)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; HTMLElement
        ))
      )
      (block $decodeText/171:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 171))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 58)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; set
        ))
      )
      (block $decodeText/46:5
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 46))
        (local.set $length (i32.const 5))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 59)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; width
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 60)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/174:17
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 174))
        (local.set $length (i32.const 17))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 61)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; HTMLC ... ement
        ))
      )
      (block $decodeText/171:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 171))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 62)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; set
        ))
      )
      (block $decodeText/40:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 40))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 63)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; height
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 64)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/174:17
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 174))
        (local.set $length (i32.const 17))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 65)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; HTMLC ... ement
        ))
      )
      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 66)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/40:6
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 40))
        (local.set $length (i32.const 6))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 67)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; height
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 68)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/174:17
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 174))
        (local.set $length (i32.const 17))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 69)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; HTMLC ... ement
        ))
      )
      (block $decodeText/191:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 191))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 70)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; setProperty
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 71)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/202:19
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 202))
        (local.set $length (i32.const 19))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 72)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; CSSSt ... ation
        ))
      )
      (block $decodeText/221:16
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 221))
        (local.set $length (i32.const 16))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 73)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; getPr ... Value
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 74)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/202:19
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 202))
        (local.set $length (i32.const 19))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 75)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; CSSSt ... ation
        ))
      )
      (block $decodeText/237:13
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 237))
        (local.set $length (i32.const 13))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 76)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; createElement
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 77)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/250:8
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 250))
        (local.set $length (i32.const 8))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 78)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; Document
        ))
      )
      (block $decodeText/14:8
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 14))
        (local.set $length (i32.const 8))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 79)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; document
        ))
      )
      (block $decodeText/258:16
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 258))
        (local.set $length (i32.const 16))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 80)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; addEv ... tener
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 81)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/274:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 274))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 82)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; EventTarget
        ))
      )
      (block $decodeText/285:19
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 285))
        (local.set $length (i32.const 19))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 83)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; remov ... tener
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 84)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/274:11
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 274))
        (local.set $length (i32.const 11))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 85)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; EventTarget
        ))
      )
      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 86)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/304:7
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 304))
        (local.set $length (i32.const 7))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 87)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; clientX
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 88)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/311:10
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 311))
        (local.set $length (i32.const 10))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 89)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; MouseEvent
        ))
      )
      (block $decodeText/74:3
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 74))
        (local.set $length (i32.const 3))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 90)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; get
        ))
      )
      (block $decodeText/321:7
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 321))
        (local.set $length (i32.const 7))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 91)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; clientY
        ))
      )
      (block $decodeText/114:9
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 114))
        (local.set $length (i32.const 9))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 92)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; prototype
        ))
      )
      (block $decodeText/311:10
        (local.set $viewAt (i32.const 0))
        (local.set $offset (i32.const 311))
        (local.set $length (i32.const 10))
        (local.set $arguments (call $self.Array<>ext))

        (call $self.Reflect.set<ext.i32.i32>
          (local.get $arguments) (i32.const 0) (local.get $length)
        )
        (local.set $arrayBufferView
          (call $self.Reflect.construct<ext.ext>ext
            (local.get $Uint8Array)
            (local.get $arguments)
          )
        )
        (loop $length--
          (if (local.get $length)
            (then
              (memory.init $wat4wasm
                (i32.const 0)
                (local.get $offset)
                (i32.const 1)
              )
              (call $self.Reflect.set<ext.i32.i32>
                (local.get $arrayBufferView)
                (local.get $viewAt)
                (i32.load8_u (i32.const 0))
              )
              (local.set $viewAt (i32.add (local.get $viewAt) (i32.const 1)))
              (local.set $offset (i32.add (local.get $offset) (i32.const 1)))
              (local.set $length (i32.sub (local.get $length) (i32.const 1)))
              (br $length--)
            )
          )
        )
        (local.set $arguments (call $self.Array<>ext))
        (call $self.Reflect.set<ext.i32.ext>
          (local.get $arguments)
          (i32.const 0)
          (local.get $arrayBufferView)
        )
        (table.set $wat4wasm (i32.const 93)
          (call $self.Reflect.apply<ext.ext.ext>ext
            (local.get $textDecoder.decode)
            (local.get $textDecoder)
            (local.get $arguments) ;; MouseEvent
        ))
      )
    )
    (block $ontextready


      (block $self.document.body<ext>
        (table.set $wat4wasm (i32.const 2)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (global.get $self)
              (table.get $wat4wasm (i32.const 5));; document
              ;; document
            )
            (table.get $wat4wasm (i32.const 6));; body
            ;; body
          )
      ))


      (block $self.document.head<ext>
        (table.set $wat4wasm (i32.const 3)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (global.get $self)
              (table.get $wat4wasm (i32.const 5));; document
              ;; document
            )
            (table.get $wat4wasm (i32.const 4));; head
            ;; head
          )
      ))




      (block $self.MouseEvent.prototype.clientY/get
        (table.set $wat4wasm (i32.const 17)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 89));; MouseEvent
                  ;; MouseEvent
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 91));; clientY
              ;; clientY
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))


      (block $self.MouseEvent.prototype.clientX/get
        (table.set $wat4wasm (i32.const 18)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 89));; MouseEvent
                  ;; MouseEvent
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 87));; clientX
              ;; clientX
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))


      (block $self.EventTarget.prototype.removeEventListener<ext>
        (table.set $wat4wasm (i32.const 19)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 82));; EventTarget
                ;; EventTarget
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 83));; remov ... tener
            ;; removeEventListener
          )
      ))


      (block $self.EventTarget.prototype.addEventListener<ext>
        (table.set $wat4wasm (i32.const 20)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 82));; EventTarget
                ;; EventTarget
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 80));; addEv ... tener
            ;; addEventListener
          )
      ))


      (block $self.document<ext>
        (table.set $wat4wasm (i32.const 21)
          (call $self.Reflect.get<ext.ext>ext
            (global.get $self)
            (table.get $wat4wasm (i32.const 79));; document
            ;; document
          )
      ))


      (block $self.Document.prototype.createElement<ext>
        (table.set $wat4wasm (i32.const 22)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 78));; Document
                ;; Document
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 76));; createElement
            ;; createElement
          )
      ))


      (block $self.CSSStyleDeclaration.prototype.getPropertyValue<ext>
        (table.set $wat4wasm (i32.const 23)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 72));; CSSSt ... ation
                ;; CSSStyleDeclaration
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 73));; getPr ... Value
            ;; getPropertyValue
          )
      ))


      (block $self.CSSStyleDeclaration.prototype.setProperty<ext>
        (table.set $wat4wasm (i32.const 24)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 72));; CSSSt ... ation
                ;; CSSStyleDeclaration
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 70));; setProperty
            ;; setProperty
          )
      ))


      (block $self.HTMLCanvasElement.prototype.height/get
        (table.set $wat4wasm (i32.const 25)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 61));; HTMLC ... ement
                  ;; HTMLCanvasElement
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 63));; height
              ;; height
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))


      (block $self.HTMLCanvasElement.prototype.height/set
        (table.set $wat4wasm (i32.const 26)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 61));; HTMLC ... ement
                  ;; HTMLCanvasElement
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 63));; height
              ;; height
            )
            (table.get $wat4wasm (i32.const 58));; set
            ;; set
          )
      ))


      (block $self.HTMLCanvasElement.prototype.width/set
        (table.set $wat4wasm (i32.const 27)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 61));; HTMLC ... ement
                  ;; HTMLCanvasElement
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 59));; width
              ;; width
            )
            (table.get $wat4wasm (i32.const 58));; set
            ;; set
          )
      ))


      (block $self.HTMLElement.prototype.style/get
        (table.set $wat4wasm (i32.const 28)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (call $self.Reflect.get<ext.ext>ext
                  (global.get $self)
                  (table.get $wat4wasm (i32.const 57));; HTMLElement
                  ;; HTMLElement
                )
                (table.get $wat4wasm (i32.const 43));; prototype
                ;; prototype
              )
              (table.get $wat4wasm (i32.const 55));; style
              ;; style
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))


      (block $self.Element.prototype.remove<ext>
        (table.set $wat4wasm (i32.const 29)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 47));; Element
                ;; Element
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 51));; remove
            ;; remove
          )
      ))


      (block $self.Element.prototype.removeAttribute<ext>
        (table.set $wat4wasm (i32.const 30)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 47));; Element
                ;; Element
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 48));; remov ... ibute
            ;; removeAttribute
          )
      ))


      (block $self.Element.prototype.append<ext>
        (table.set $wat4wasm (i32.const 31)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 47));; Element
                ;; Element
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 45));; append
            ;; append
          )
      ))


      (block $self.Node.prototype.removeChild<ext>
        (table.set $wat4wasm (i32.const 32)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (call $self.Reflect.get<ext.ext>ext
                (global.get $self)
                (table.get $wat4wasm (i32.const 44));; Node
                ;; Node
              )
              (table.get $wat4wasm (i32.const 43));; prototype
              ;; prototype
            )
            (table.get $wat4wasm (i32.const 42));; removeChild
            ;; removeChild
          )
      ))


      (block $self.CSS.px<ext>
        (table.set $wat4wasm (i32.const 33)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.get<ext.ext>ext
              (global.get $self)
              (table.get $wat4wasm (i32.const 41));; CSS
              ;; CSS
            )
            (table.get $wat4wasm (i32.const 40));; px
            ;; px
          )
      ))


      (block $self.innerHeight/get
        (table.set $wat4wasm (i32.const 34)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (global.get $self)
              (table.get $wat4wasm (i32.const 39));; innerHeight
              ;; innerHeight
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))


      (block $self.innerWidth/get
        (table.set $wat4wasm (i32.const 35)
          (call $self.Reflect.get<ext.ext>ext
            (call $self.Reflect.getOwnPropertyDescriptor<ext.ext>ext
              (global.get $self)
              (table.get $wat4wasm (i32.const 37));; innerWidth
              ;; innerWidth
            )
            (table.get $wat4wasm (i32.const 36));; get
            ;; get
          )
      ))

    )


    ;; restore zero heap value
    (i32.store (; stack stack ;))
    (nop)

    (call $init)
  )


  (data $wat4wasm "\48\01\00\00\6f\6e\6c\6f\61\64\68\65\61\64\64\6f\63\75\6d\65\6e\74\62\6f\64\79\70\6f\73\69\74\69\6f\6e\6d\61\72\67\69\6e\68\65\69\67\68\74\77\69\64\74\68\63\61\6e\76\61\73\70\6f\69\6e\74\65\72\6d\6f\76\65\72\65\73\69\7a\65\67\65\74\69\6e\6e\65\72\57\69\64\74\68\69\6e\6e\65\72\48\65\69\67\68\74\70\78\43\53\53\72\65\6d\6f\76\65\43\68\69\6c\64\70\72\6f\74\6f\74\79\70\65\4e\6f\64\65\61\70\70\65\6e\64\45\6c\65\6d\65\6e\74\72\65\6d\6f\76\65\41\74\74\72\69\62\75\74\65\73\74\79\6c\65\48\54\4d\4c\45\6c\65\6d\65\6e\74\73\65\74\48\54\4d\4c\43\61\6e\76\61\73\45\6c\65\6d\65\6e\74\73\65\74\50\72\6f\70\65\72\74\79\43\53\53\53\74\79\6c\65\44\65\63\6c\61\72\61\74\69\6f\6e\67\65\74\50\72\6f\70\65\72\74\79\56\61\6c\75\65\63\72\65\61\74\65\45\6c\65\6d\65\6e\74\44\6f\63\75\6d\65\6e\74\61\64\64\45\76\65\6e\74\4c\69\73\74\65\6e\65\72\45\76\65\6e\74\54\61\72\67\65\74\72\65\6d\6f\76\65\45\76\65\6e\74\4c\69\73\74\65\6e\65\72\63\6c\69\65\6e\74\58\4d\6f\75\73\65\45\76\65\6e\74\63\6c\69\65\6e\74\59")



  (start $wat4wasm)
)