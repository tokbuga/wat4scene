(module
    (include "self/Object.wat")
    (include "self/WebAssembly.wat")

    (data $canvas.wasm "wasm://canvas.wat")

    (main $init
        (local $memory      <WebAssembly.Memory>)
        (local $descriptor    <MemoryDescriptor>)
        (local $imports                 <Object>)

        (lset $descriptor
            (call $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
                i32(100) i32(100) (true)
            )
        )

        (lset $memory
            (call $WebAssembly.Memory<ext>ext
                (lget $descriptor)   
            )
        )

        (lset $imports 
            (call $Object.fromEntry<ext.ext>ext
                (text "memory") (lget $memory)
            )
        )

        (console $log<ext> (lget $imports))

        (async
            (call $WebAssembly.instantiate<ext.ext>ext
                (data.view $canvas.wasm) 
                (call $Object.assign<ext.ext>ext
                    (self) (lget $imports)
                )
            )
            (then $oninstantiate
                (param $instantiate <Object>)
                (console $log<ext>    (this))
            )
        )
    )
)