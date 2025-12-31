
    (func $EventTarget:addEventListener<ext.ext.fun>
        (param $target <EventTarget>)
        (param $type        <String>)
        (param $handler      funcref)

        (reflect $apply<ext.ext.ext>
            (ref.extern $self.EventTarget:addEventListener)
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

        (reflect $apply<ext.ext.ext>
            (ref.extern $self.EventTarget:removeEventListener)
            (this)
            (array $of<ext.fun>ext 
                (lget $type)
                (lget $handler)
            )
        )
    )
