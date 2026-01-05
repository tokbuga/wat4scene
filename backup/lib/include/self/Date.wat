
    (func $Date.now<>i32
        (result                           i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $Date.now)
            (ref.extern $Date)
            (array)
        )
    )

    (func $Date.now<>i64
        (result                           i64)

        (reflect $apply<ext.ext.ext>i64
            (ref.extern $Date.now)
            (ref.extern $Date)
            (array)
        )
    )

    (func $Date.now<>f32
        (result                           f32)

        (reflect $apply<ext.ext.ext>f32
            (ref.extern $Date.now)
            (ref.extern $Date)
            (array)
        )
    )

    (func $Date.now<>f64
        (result                           f64)

        (reflect $apply<ext.ext.ext>f64
            (ref.extern $Date.now)
            (ref.extern $Date)
            (array)
        )
    )