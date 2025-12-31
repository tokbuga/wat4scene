
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

    (func $HTMLCanvasElement:height<ext>i32
        (param $element <HTMLCanvasElement>)
        (result                         i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $HTMLCanvasElement:height[get])
            (this) 
            (array)
        )
    )