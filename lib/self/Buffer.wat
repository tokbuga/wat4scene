
    (func $Buffer:writeUint32LE<ext.i32.i32>
        (param $buffer      <SharedArrayBuffer|ArrayBuffer>)
        (param $value                                   i32)
        (param $offset                                  i32)

        (call $DataView:setUint32<ext.i32.i32.i32>
            (call $DataView<ext>ext (lget $buffer))
            (lget $offset)
            (lget $value)
            (true)
        )
    )

    