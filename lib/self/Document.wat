
    (func $Document:createElement<ext>ext
        (param $tagName <String>)
        (result <Element>)
        (apply.ext
            (self $Document:createElement)
            (self $document)
            (array $of<ext>ext (this))
        )
    )
