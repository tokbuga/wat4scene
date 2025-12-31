
    (func $EventTarget:addEventListener<ext.ext.fun>
        (param $target <EventTarget>)
        (param $type        <String>)
        (param $handler      funcref)

        (apply
            (self $EventTarget:addEventListener)
            (this)
            (array $of<ext.fun>ext 
                (lget $type)
                (lget $handler)
            )
        )
    )

    (func $EventTarget:removeEventListener<ext.ext.fun>
        (param $target <EventTarget>)
        (param $type        <String>)
        (param $handler      funcref)

        (apply
            (self $EventTarget:removeEventListener)
            (this)
            (array $of<ext.fun>ext 
                (lget $type)
                (lget $handler)
            )
        )
    )
