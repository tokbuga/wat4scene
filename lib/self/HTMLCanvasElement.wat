
    (func $HTMLCanvasElement<>ext
        (result <HTMLCanvasElement>)
        (call $Document:createElement<ext>ext 
            (text "canvas")
        )
    )

    (func $HTMLCanvasElement:width<ext.i32>
        (param $element <HTMLCanvasElement>)
        (param $value                   i32)
        (apply
            (self $HTMLCanvasElement:width[set])
            (this) 
            (array $of<i32>ext (lget $value))
        )
    )

    (func $HTMLCanvasElement:height<ext.i32>
        (param $element <HTMLCanvasElement>)
        (param $value                   i32)
        (apply
            (self $HTMLCanvasElement:height[set])
            (this) 
            (array $of<i32>ext (lget $value))
        )
    )

    (func $HTMLCanvasElement:height<ext>i32
        (param $element <HTMLCanvasElement>)
        (result                         i32)
        (apply.i32
            (self $HTMLCanvasElement:height[get])
            (this) 
            (array)
        )
    )