
    (func $Performance:timeOrigin<ext>i32
        (param $performance     <Performance>)
        (result                           i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $Performance:timeOrigin[get])
            (this)
            (array)
        )
    )

    (func $Performance:timeOrigin<ext>i64
        (param $performance     <Performance>)
        (result                           i64)

        (reflect $apply<ext.ext.ext>i64
            (ref.extern $Performance:timeOrigin[get])
            (this)
            (array)
        )
    )

    (func $Performance:timeOrigin<ext>f32
        (param $performance     <Performance>)
        (result                           f32)

        (reflect $apply<ext.ext.ext>f32
            (ref.extern $Performance:timeOrigin[get])
            (this)
            (array)
        )
    )

    (func $Performance:timeOrigin<ext>f64
        (param $performance     <Performance>)
        (result                           f64)

        (reflect $apply<ext.ext.ext>f64
            (ref.extern $Performance:timeOrigin[get])
            (this)
            (array)
        )
    )