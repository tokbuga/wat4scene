
    (func $CSSStyleDeclaration:setProperty<ext.ext.ext>
        (param $style   <CSSStyleDeclaration>)
        (param $property             <String>)
        (param $definition          externref)

        (reflect $apply<ext.ext.ext>
            (ref.extern $CSSStyleDeclaration:setProperty) 
            (this)
            (array $of<ext.ext>ext
                (lget $property) 
                (lget $definition)
            )
        )
    )

    (func $CSSStyleDeclaration:width<ext.i32>
        (param $style   <CSSStyleDeclaration>)
        (param $value                     i32)

        (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
            (this)
            (text "width") 
            (call $CSS.px<i32>ext (lget $value))
        )
    )

    (func $CSSStyleDeclaration:height<ext.i32>
        (param $style   <CSSStyleDeclaration>)
        (param $value                     i32)

        (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
            (this)
            (text "height") 
            (call $CSS.px<i32>ext (lget $value))
        )
    )

    (func $CSSStyleDeclaration:margin<ext.i32>
        (param $style   <CSSStyleDeclaration>)
        (param $value                     i32)

        (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
            (this)
            (text "margin") 
            (call $CSS.px<i32>ext (lget $value))
        )
    )

    (func $CSSStyleDeclaration:position<ext.ext>
        (param $style   <CSSStyleDeclaration>)
        (param $value                <String>)

        (call $CSSStyleDeclaration:setProperty<ext.ext.ext>
            (this)
            (text "position") 
            (lget $value)
        )
    )

    (func $CSSStyleDeclaration:getPropertyValue<ext.ext>ext
        (param $style   <CSSStyleDeclaration>)
        (param $property             <String>)
        (result                     externref)
        
        (reflect $apply<ext.ext.ext>ext
            (ref.extern $CSSStyleDeclaration:getPropertyValue) 
            (this)
            (array $of<ext>ext (lget $property))
        )
    )