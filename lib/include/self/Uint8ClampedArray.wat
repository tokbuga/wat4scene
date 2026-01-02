
    (func $Uint8ClampedArray<ext.i32.i32>ext
        (param $buffer                     <Buffer>)
        (param $byteOffset                      i32)
        (param $length                          i32)
        (result                 <Uint8ClampedArray>)

        (reflect $construct<ext.ext>ext 
            (ref.extern $Uint8ClampedArray) 
            (array $of<ext.i32.i32>ext
                (lget $buffer)  
                (lget $byteOffset)
                (lget $length)
            ) 
        )
    )

    (func $Uint8ClampedArray:set<ext.ext>
        (param $target          <Uint8ClampedArray>)
        (param $values                  <ArrayLike>)

        (reflect $apply<ext.ext.ext>
            (ref.extern $Uint8ClampedArray:set)
            (this)
            (array $of<ext>ext 
                (lget $values)
            )
        )
    )