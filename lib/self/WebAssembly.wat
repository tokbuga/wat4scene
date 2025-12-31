
    (func $WebAssembly.instantiate<ext.ext>ext
        (param $source      <Buffer>)
        (param $imports     <Object>)
        (result            <Promise>)

        (apply.ext
            (self $WebAssembly.instantiate)
            (self $WebAssembly)
            (array $of<ext.ext>ext 
                (lget $source)
                (lget $imports)
            )
        )
    )

    (func $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
        (param $initial i32)
        (param $maximum i32)
        (param $shared  i32)
        (result    <Object>)
        (local $desciptor <Object>)

        (lset $desciptor (object))
        (reflect $set<ext.ext.i32> (lget $desciptor) (text "initial") (lget $initial))
        (reflect $set<ext.ext.i32> (lget $desciptor) (text "maximum") (lget $maximum))
        (reflect $set<ext.ext.i32> (lget $desciptor) (text "shared")  (lget $shared))
        (lget $desciptor)
    )

    (func $WebAssembly.Memory<ext>ext
        (param $descriptor      <Object>)
        (result     <WebAssembly.Memory>)

        (reflect $construct<ext.ext>ext
            (self $WebAssembly.Memory)
            (array $of<ext>ext (this))
        )
    )
