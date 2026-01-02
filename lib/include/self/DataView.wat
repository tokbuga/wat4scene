
    (func $DataView<ext.i32.i32>ext
        (param $buffer      <SharedArrayBuffer|ArrayBuffer>)
        (param $byteOffset                              i32)
        (param $byteLength                              i32)
        (result                                  <DataView>)

        (reflect $construct<ext.ext>ext
            (ref.extern $DataView)
            (array $of<ext.i32.i32>ext
                (lget $buffer)
                (lget $byteOffset)
                (lget $byteLength)
            )
        )
    )

    (func $DataView<ext.i32>ext
        (param $buffer      <SharedArrayBuffer|ArrayBuffer>)
        (param $byteOffset                              i32)
        (result                                  <DataView>)

        (reflect $construct<ext.ext>ext
            (ref.extern $DataView)
            (array $of<ext.i32>ext
                (lget $buffer)
                (lget $byteOffset)
            )
        )
    )

    (func $DataView<ext>ext
        (param $buffer      <SharedArrayBuffer|ArrayBuffer>)
        (result                                  <DataView>)

        (reflect $construct<ext.ext>ext
            (ref.extern $DataView)
            (array $of<ext>ext (lget $buffer))
        )
    )

    (func $DataView:setUint32<ext.i32.i32.i32>
        (param $this                             <DataView>)
        (param $byteOffset                              i32)
        (param $value                                   i32)
        (param $isLittleEndian                          i32)

        (reflect $apply<ext.ext.ext>
            (ref.extern $DataView:setUint32)
            (this)
            (array $of<i32.i32.i32>ext 
                (lget $byteOffset)
                (lget $value)
                (lget $isLittleEndian)
            )
        )
    )
