
    (func $Object.assign<ext.ext>ext
        (param $target     <Object>)
        (param $object     <Object>)
        (result            <Object>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $self.Object.assign)
            (ref.extern $self.Object)
            (array $of<ext.ext>ext 
                (lget $target) 
                (call $self.Object<ext>ext (lget $object))
            )
        )
    )
