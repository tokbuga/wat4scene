
    (func $Node:removeChild<ext.ext>
        (param $element   <Element>)
        (param $child     <Element>)
        
        (reflect $apply<ext.ext.ext> 
            (ref.extern $Node:removeChild) 
            (this) 
            (array $of<ext>ext (lget $child))
        )
    )
