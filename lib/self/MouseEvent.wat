
    (func $MouseEvent:clientX<ext>f32
        (param $event <MouseEvent>)
        (result f32)
        (apply.f32 (self $MouseEvent:clientX[get]) (this) (self))
    )

    (func $MouseEvent:clientY<ext>f32
        (param $event <MouseEvent>)
        (result f32)
        (apply.f32 (self $MouseEvent:clientY[get]) (this) (self))
    )
