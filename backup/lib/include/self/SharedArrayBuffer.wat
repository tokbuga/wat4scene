
    (func $SharedArrayBuffer:byteLength<ext>i32
        (param $buffer             <SharedArrayBuffer>)
        (result                                    i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $SharedArrayBuffer:byteLength[get]) 
            (this) 
            (array)
        )
    )
