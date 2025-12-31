
    (func $Object.assign<ext.ext>ext
        (param $target     <Object>)
        (param $object     <Object>)
        (result            <Object>)

        (apply.ext
            (self $Object.assign)
            (self $Object)
            (array $of<ext.ext>ext 
                (lget $target) 
                (call $self.Object<ext>ext (lget $object))
            )
        )
    )
