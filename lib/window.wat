
    (func $window.innerWidth<>i32
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $self.innerWidth[get]) (self) (array))
    )

    (func $window.innerHeight<>i32
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $self.innerHeight[get]) (self) (array))
    )

    (global $window.onresize mut fun)
    (global $window.onpointermove mut fun)

    (func $window.onresize<fun>
        (param $onresize fun)
        (if (lget $onresize != null)
            (then 
                (gset $window.onresize (lget $onresize))
                (call $EventTarget:addEventListener<ext.ext.fun>
                    (self) (text "resize") (gget $window.onresize)
                )
            )
            (else
                (call $EventTarget:removeEventListener<ext.ext.fun>
                    (self) (text "resize") (gget $window.onresize)
                )
                (gset $window.onresize (lget $onresize))
            )
        )
    )

    (func $window.onpointermove<fun>
        (param $onpointermove fun)

        (if (lget $onpointermove != null)
            (then 
                (gset $window.onpointermove (lget $onpointermove))
                (call $EventTarget:addEventListener<ext.ext.fun>
                    (self) (text "pointermove") (gget $window.onpointermove)
                )
            )
            (else
                (call $EventTarget:removeEventListener<ext.ext.fun>
                    (self) (text "pointermove") (gget $window.onpointermove)
                )
                (gset $window.onpointermove (lget $onpointermove))
            )
        )
    )
