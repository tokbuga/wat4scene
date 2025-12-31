
    (func $Object.assign<ext.ext>ext
        (param $target     <Object>)
        (param $object     <Object>)
        (result            <Object>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Object.assign)
            (ref.extern $Object)
            (array $of<ext.ext>ext 
                (lget $target) 
                (call $self.Object<ext>ext (lget $object))
            )
        )
    )

    (func $Object<>ext
        (result           <Object>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Object)
            (self)
            (self)
        )
    )

    (func $Object.fromEntry<ext.ext>ext
        (param $key       <String>)
        (param $value    externref)
        (result           <Object>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Object.fromEntries)
            (ref.extern $Object)
            (array $of<ext>ext
                (array $of<ext>ext
                    (array $of<ext.ext>ext
                        (lget $key) 
                        (lget $value)
                    )
                )
            )
        )
    )