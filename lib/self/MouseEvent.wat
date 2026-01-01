
    (func $MouseEvent:clientX<ext>f32
        (param $event <MouseEvent>)
        (result                f32)

        (reflect $apply<ext.ext.ext>f32 
            (ref.extern $MouseEvent:clientX[get]) 
            (this) 
            (self)
        )
    )

    (func $MouseEvent:clientY<ext>f32
        (param $event <MouseEvent>)
        (result                f32)
        
        (reflect $apply<ext.ext.ext>f32 
            (ref.extern $MouseEvent:clientY[get]) 
            (this) 
            (self)
        )
    )

    (func $MouseEvent:clientX<ext>i32
        (param $event <MouseEvent>)
        (result                i32)

        (reflect $apply<ext.ext.ext>i32 
            (ref.extern $MouseEvent:clientX[get]) 
            (this) 
            (self)
        )
    )

    (func $MouseEvent:clientY<ext>i32
        (param $event <MouseEvent>)
        (result                i32)
        
        (reflect $apply<ext.ext.ext>i32 
            (ref.extern $MouseEvent:clientY[get]) 
            (this) 
            (self)
        )
    )
