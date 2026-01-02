
    (func $Document:createElement<ext>ext
        (param $tagName         <String>)
        (result                <Element>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Document:createElement)
            (ref.extern $document)
            (array $of<ext>ext (this))
        )
    )
