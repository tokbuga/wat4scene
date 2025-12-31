
    (func $Element:append<ext.ext>
        (param $parent      <Element>)
        (param $child       <Element>)
        (apply
            (self $Element:append)
            (this)
            (array $of<ext>ext (lget $child))
        )
    )

    (func $Element:removeAttribute<ext.ext>
        (param $element <Element>)
        (param $attribute <String>)
        (apply 
            (self $Element:removeAttribute) 
            (this) 
            (array $of<ext>ext (lget $attribute))
        )
    )

    (func $Element:remove<ext>
        (param $element <Element>)
        (apply 
            (self $Element:remove) 
            (this) 
            (array)
        )
    )
