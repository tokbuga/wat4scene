
    (func $WebAssembly.instantiate<ext.ext>ext
        (param $source      <Buffer>)
        (param $imports     <Object>)
        (result            <Promise>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $WebAssembly.instantiate)
            (ref.extern $WebAssembly)
            (array $of<ext.ext>ext 
                (lget $source)
                (lget $imports)
            )
        )
    )

    (func $WebAssembly.MemoryDescriptor<i32.i32.i32>ext
        (param $initial   i32)
        (param $maximum   i32)
        (param $shared    i32)
        (result      <Object>)
        (local $desc <Object>)        

        (ltee $desc  (call $Object<>ext))

        (reflect $set<ext.ext.i32> (lget $desc) (text "initial") (lget $initial))
        (reflect $set<ext.ext.i32> (lget $desc) (text "maximum") (lget $maximum))
        (reflect $set<ext.ext.i32> (lget $desc) (text "shared")  (lget $shared))
    )

    (func $WebAssembly.Memory<ext>ext
        (param $descriptor      <Object>)
        (result     <WebAssembly.Memory>)

        (reflect $construct<ext.ext>ext
            (ref.extern $WebAssembly.Memory)
            (array $of<ext>ext (this))
        )
    )
