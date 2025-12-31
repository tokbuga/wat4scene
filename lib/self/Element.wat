
    (func $Element:append<ext.ext>
        (param $parent      <Element>)
        (param $child       <Element>)
        (reflect $apply<ext.ext.ext>
            (ref.extern $self.Element:append)
            (this)
            (array $of<ext>ext (lget $child))
        )
    )

    (func $Element:removeAttribute<ext.ext>
        (param $element <Element>)
        (param $attribute <String>)
        (reflect $apply<ext.ext.ext> 
            (ref.extern $self.Element:removeAttribute) 
            (this) 
            (array $of<ext>ext (lget $attribute))
        )
    )

    (func $Element:remove<ext>
        (param $element <Element>)
        (reflect $apply<ext.ext.ext> 
            (ref.extern $self.Element:remove) 
            (this) 
            (array)
        )
    )
