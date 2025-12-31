
    (func $HTMLElement:style<ext>ext
        (param $element <HTMLElement>)
        (result <CSSStyleDeclaration>)
        (apply.ext 
            (self $HTMLElement:style[get]) 
            (this) 
            (array)
        )
    )