(module
    (include "include/self/Object.wat")
    (include "include/self/WebAssembly.wat")

    (data $memory.wasm "wasm://module/memory.wat")
    (data $window.wasm "wasm://module/window.wat")

    (global $memory<Module> mut ext)
    (global $window<Module> mut ext)

    (main $init
        (call $assign_memory)
        (async
            (call $WebAssembly.compile<ext>ext (data.view $memory.wasm))
            (then $onmemorymodule
                (param $module     <WebAssembly.Module>)
                (result                       <Promise>)
                
                (gset $memory<Module> (this))
                (call $WebAssembly.instantiate<ext>ext (this))
            )
            (then $onmemoryinstance
                (param $memory   <WebAssembly.Instance>)
                (local $exports                <Object>)

                (call $Object.assign<ext.ext>
                    (self)
                    (call $WebAssembly.Instance:exports<ext>ext (this))
                )
            )
            (then $onmemoryopsready
                (result                       <Promise>)
                (call $WebAssembly.compile<ext>ext (data.view $window.wasm))                
            )
            (then $onwindowmodule
                (param $module     <WebAssembly.Module>)
                (result                       <Promise>)
                
                (gset $window<Module> (this))
                (call $WebAssembly.instantiate<ext>ext (this))
            )
            (then $onwindowinstance
                (param $window   <WebAssembly.Instance>)
                (local $exports                <Object>)

                (console $log<ext> (this))

                (call $Object.assign<ext.ext>
                    (self)
                    (call $WebAssembly.Instance:exports<ext>ext (this))
                )            
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

        (lset $initial  (i32.const (include "include/constant/MEMORY_INITIAL_PAGESIZE.i32")))
        (lset $maximum  (i32.const (include "include/constant/MEMORY_MAXIMUM_PAGESIZE.i32")))
        (lset $shared   (i32.const (include "include/constant/MEMORY_SHARED_BOOLEAN.i32")))

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