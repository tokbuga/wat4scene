(module
    (include "imports/memory.wat")

    (main $hello
        (console $log<ext>
            (text "hello world")
        )
    )
)