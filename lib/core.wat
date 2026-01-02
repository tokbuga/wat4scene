(module
    (include "self/Object.wat")
    (include "self/WebAssembly.wat")

    (data $memory.wasm "wasm://memory/module.wat")

    (main $init
        (call $assign_memory)
        (async
            (call $WebAssembly.compile<ext>ext (data.view $memory.wasm))
            (then $onmemorymodule
                (param $module   <WebAssembly.Module>)
                (result                     <Promise>)
                (call $WebAssembly.instantiate<ext>ext (this))
            )
            (then $onmemoryinstance
                (param $memory   <WebAssembly.Instance>)
                (local $exports                <Object>)

                (call $Object.assign<ext.ext>
                    (self)
                    (call $WebAssembly.Instance:exports<ext>ext (this))
                )

                (console $log<ext> (self))
                (console $log<ext> (this))
            )
        )
    )

    (func $assign_memory
        (local $descriptor    <MemoryDescriptor>)
        (local $memory      <WebAssembly.Memory>)
        (local $buffer       <SharedArrayBuffer>)

        (local $initial                      i32)
        (local $maximum                      i32)
        (local $shared                       i32)
        (local $length                       i32)

        (lset $initial  i32(1000))
        (lset $maximum  i32(1000))
        (lset $shared   (true))

        (lset $descriptor
            (call $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
                (lget $initial) (lget $maximum) (lget $shared)
            )
        )

        (lset $memory (call $WebAssembly.Memory<ext>ext (lget $descriptor)))
        (lset $buffer (call $WebAssembly.Memory:buffer<ext>ext (lget $memory)))

        (reflect $set<ext.ext.ext> (self) (text "memory") (lget $memory))
        (reflect $set<ext.ext.ext> (self) (text "buffer") (lget $buffer))
    )
)