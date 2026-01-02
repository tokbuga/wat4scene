
    (global $INITIAL_ALLOC_LENGTH i32 i32(16))
    (global $OFFSET_ALLOC_LENGTH i32 i32(4))
    (global $OFFSET_MEMORY_LENGTH i32 i32(8))

    (func $create_memory<i32>ext
        (param $pageSize                     i32)
        (result             <WebAssembly.Memory>)

        (local $descriptor    <MemoryDescriptor>)
        (local $memory      <WebAssembly.Memory>)
        (local $buffer       <SharedArrayBuffer>)
        (local $initial                      i32)
        (local $maximum                      i32)
        (local $shared                       i32)
        (local $length                       i32)

        (lset $initial (lget $pageSize))
        (lset $maximum (lget $pageSize))
        (lset $shared  (true))

        (lset $descriptor
            (call $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
                (lget $initial) (lget $maximum) (lget $shared)
            )
        )

        (lset $memory (call $WebAssembly.Memory<ext>ext (lget $descriptor)))
        (lset $buffer (call $WebAssembly.Memory:buffer<ext>ext (lget $memory)))
        (lset $length (call $SharedArrayBuffer:byteLength<ext>i32 (lget $buffer)))

        (call $Buffer:writeUint32LE<ext.i32.i32> 
            (lget $buffer) (gget $INITIAL_ALLOC_LENGTH) (gget $OFFSET_ALLOC_LENGTH)
        )

        (call $Buffer:writeUint32LE<ext.i32.i32> 
            (lget $buffer) (lget $length) (gget $OFFSET_MEMORY_LENGTH)
        )

        (lget $memory)
    )
