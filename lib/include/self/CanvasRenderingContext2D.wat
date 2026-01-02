
    (func $CanvasRenderingContext2D:getImageData<ext.i32.i32.i32.i32>ext
        (param $context      <CanvasRenderingContext2D>)
        (param $left                                i32)
        (param $top                                 i32)
        (param $width                               i32)
        (param $height                              i32)
        (result                             <ImageData>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $CanvasRenderingContext2D:getImageData)
            (this) 
            (array $of<i32.i32.i32.i32>ext 
                (lget $left) 
                (lget $top) 
                (lget $width) 
                (lget $height)
            ) 
        )
    )

    (func $CanvasRenderingContext2D:canvas<ext>ext
        (param $context      <CanvasRenderingContext2D>)
        (result                     <HTMLCanvasElement>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $CanvasRenderingContext2D:canvas[get])
            (this) 
            (array) 
        )
    )

    (func $CanvasRenderingContext2D:getImageData<ext>ext
        (param $context      <CanvasRenderingContext2D>)
        (result                             <ImageData>)
        (local $canvas              <HTMLCanvasElement>)
        (local $left                                i32)
        (local $top                                 i32)
        (local $width                               i32)
        (local $height                              i32)

        (lset $canvas (call $CanvasRenderingContext2D:canvas<ext>ext (this)))
        (lset $height (call $HTMLCanvasElement:height<ext>i32 (lget $canvas)))
        (lset $width  (call $HTMLCanvasElement:width<ext>i32 (lget $canvas)))

        (call $CanvasRenderingContext2D:getImageData<ext.i32.i32.i32.i32>ext
            (lget $context) (lget $left) (lget $top) (lget $width) (lget $height)
        )
    )

    (func $CanvasRenderingContext2D:putImageData<ext.ext.i32.i32>
        (param $context      <CanvasRenderingContext2D>)
        (param $imageData                   <ImageData>)
        (param $left                                i32)
        (param $top                                 i32)

        (reflect $apply<ext.ext.ext>
            (ref.extern $CanvasRenderingContext2D:putImageData)
            (this)
            (array $of<ext.i32.i32>ext
                (lget $imageData) (lget $left) (lget $top)
            )
        )
    )

    (func $CanvasRenderingContext2D:createImageData<ext.i32.i32>ext
        (param $context      <CanvasRenderingContext2D>)
        (param $width                               i32)
        (param $height                              i32)
        (result                             <ImageData>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $CanvasRenderingContext2D:createImageData)
            (this)
            (array $of<i32.i32>ext
                (lget $width) (lget $height)
            )
        )
    )

    (func $CanvasRenderingContext2D:putImageData<ext.ext>
        (param $context      <CanvasRenderingContext2D>)
        (param $imageData                   <ImageData>)

        (call $CanvasRenderingContext2D:putImageData<ext.ext.i32.i32>
            (this) (lget $imageData) i32(0) i32(0)
        )
    )
