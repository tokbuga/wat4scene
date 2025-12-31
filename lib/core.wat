(module
    (data $canvas.wasm "wasm://canvas.wat")

    (main $init
        (text "hello world")
        (console $log<ext>)

        (apply
            (self $WebAssembly.instantiate)
            (self $WebAssembly)
            (array $of<ext.ext>ext 
                (data.view $canvas.wasm)
                (self)
            )
        )
    )
)