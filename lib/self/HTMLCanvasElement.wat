
    (func $HTMLCanvasElement<>ext
        (result <HTMLCanvasElement>)
        
        (call $Document:createElement<ext>ext 
            (text "canvas")
        )
    )

    (func $HTMLCanvasElement:width<ext.i32>
        (param $element <HTMLCanvasElement>)
        (param $value                   i32)
        
        (reflect $apply<ext.ext.ext>
            (ref.extern $HTMLCanvasElement:width[set])
            (this) 
            (array $of<i32>ext (lget $value))
        )
    )

    (func $HTMLCanvasElement:height<ext.i32>
        (param $element <HTMLCanvasElement>)
        (param $value                   i32)
        
        (reflect $apply<ext.ext.ext>
            (ref.extern $HTMLCanvasElement:height[set])
            (this) 
            (array $of<i32>ext (lget $value))
        )
    )

    (func $HTMLCanvasElement:width<ext>i32
        (param $element <HTMLCanvasElement>)
        (result                         i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $HTMLCanvasElement:width[get])
            (this) 
            (array)
        )
    )

    (func $HTMLCanvasElement:height<ext>i32
        (param $element <HTMLCanvasElement>)
        (result                         i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $HTMLCanvasElement:height[get])
            (this) 
            (array)
        )
    )

    (func $HTMLCanvasElement:getContext<ext.ext.ext>ext
        (param $element             <HTMLCanvasElement>)
        (param $contextType                    <String>)
        (param $contextAttributes              <Object>)
        (result                         <CanvasContext>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $HTMLCanvasElement:getContext)
            (this) 
            (array $of<ext.ext>ext
                (lget $contextType)
                (lget $contextAttributes)
            )
        )
    )

    (func $HTMLCanvasElement:ImageBitmapRenderingContext<ext>ext
        (param $element             <HTMLCanvasElement>)
        (result                         <CanvasContext>)

        (call $HTMLCanvasElement:getContext<ext.ext.ext>ext
            (this) (text "bitmaprenderer") (undefined) 
        )
    )

    (func $ImageBitmapRenderingContext:transferFromImageBitmap<ext.ext>
        (param $context   <ImageBitmapRenderingContext>)
        (param $bitmap                    <ImageBitmap>)

        (reflect $apply<ext.ext.ext>
            (ref.extern $ImageBitmapRenderingContext:transferFromImageBitmap)
            (this) 
            (array $of<ext>ext (lget $bitmap)) 
        )
    )

    (func $HTMLCanvasElement:CanvasRenderingContext2D<ext.ext>ext
        (param $element             <HTMLCanvasElement>)
        (param $attributes                     <Object>)
        (result                         <CanvasContext>)

        (call $HTMLCanvasElement:getContext<ext.ext.ext>ext
            (this) (text "2d") (lget $attributes) 
        )
    )

    (func $HTMLCanvasElement:CanvasRenderingContext2D<ext>ext
        (param $element             <HTMLCanvasElement>)
        (result              <CanvasRenderingContext2D>)

        (call $$HTMLCanvasElement:CanvasRenderingContext2D<ext.ext>ext
            (this) (undefined) 
        )
    )

    (func $HTMLCanvasElement:WebGLRenderingContext<ext.ext>ext
        (param $element             <HTMLCanvasElement>)
        (param $attributes                     <Object>)
        (result                 <WebGLRenderingContext>)

        (call $HTMLCanvasElement:getContext<ext.ext.ext>ext
            (this) (text "webgl2") (lget $attributes) 
        )
    )

    (func $HTMLCanvasElement:WebGLRenderingContext<ext>ext
        (param $element             <HTMLCanvasElement>)
        (result                 <WebGLRenderingContext>)

        (call $$HTMLCanvasElement:WebGLRenderingContext<ext.ext>ext
            (this) (undefined) 
        )
    )

    (func $HTMLCanvasElement:GPUCanvasContext<ext.ext>ext
        (param $element             <HTMLCanvasElement>)
        (param $attributes                     <Object>)
        (result                      <GPUCanvasContext>)

        (call $HTMLCanvasElement:getContext<ext.ext.ext>ext
            (this) (text "webgpu") (lget $attributes) 
        )
    )

    (func $HTMLCanvasElement:GPUCanvasContext<ext>ext
        (param $element             <HTMLCanvasElement>)
        (result                      <GPUCanvasContext>)

        (call $$HTMLCanvasElement:GPUCanvasContext<ext.ext>ext
            (this) (undefined) 
        )
    )

