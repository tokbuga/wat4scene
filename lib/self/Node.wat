
    (func $Node:removeChild<ext.ext>
        (param $element <Element>)
        (param $child <Element>)
        (apply 
            (self $Node:removeChild) 
            (this) 
            (array $of<ext>ext (lget $child))
        )
    )
