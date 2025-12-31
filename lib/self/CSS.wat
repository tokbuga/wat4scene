
    (func $CSS.px<i32>ext
        (param $value i32)
        (result <CSSUnitValue>)
        (apply.ext 
            (self $CSS.px)
            (null)
            (array $of<i32>ext (this))
        )
    )
