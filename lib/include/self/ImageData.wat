
    (func $ImageData:data<ext>ext
        (param $element                 <ImageData>)
        (result                 <Uint8ClampedArray>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $ImageData:data[get])
            (this) 
            (array)
        )
    )
