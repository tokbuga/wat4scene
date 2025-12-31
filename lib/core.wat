(module
    (include "self/Object.wat")
    (include "self/WebAssembly.wat")

    (data $canvas.wasm "wasm://canvas.wat")

    (global $imports mut ext)

    (main $init
        (gset $imports (object))

        (reflect $set<ext.ext.ext> 
            (gget $imports) 
            (text "memory") 
            (call $WebAssembly.Memory<ext>ext
                (call $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
                    i32(1) i32(1) (true)
                )
            )
        )

        (call $self.console.log<ext> (gget $imports))

        (async
            (call $WebAssembly.instantiate<ext.ext>ext
                (data.view $canvas.wasm) 
                (call $Object.assign<ext.ext>ext
                    (self) (gget $imports)
                )
            )
            (then $oninstantiate
                (param $instantiate <Object>)
                (call $self.console.log<ext> (this))
            )
        )
    )
)