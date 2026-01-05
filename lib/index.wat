(module
    (global $module* mut i32)

    (func $get_inner_width<>f32     (result f32) (f32.load offset=16 (gget $module*)))
    (func $get_inner_height<>f32    (result f32) (f32.load offset=20 (gget $module*)))
    (func $get_client_x<>f32        (result f32) (f32.load offset=24 (gget $module*)))
    (func $get_client_y<>f32        (result f32) (f32.load offset=28 (gget $module*)))
    (func $set_inner_width<f32>     (param f32) (f32.store offset=16 (gget $module*) (arg0)))
    (func $set_inner_height<f32>    (param f32) (f32.store offset=20 (gget $module*) (arg0)))
    (func $set_client_x<f32>        (param f32) (f32.store offset=24 (gget $module*) (arg0)))
    (func $set_client_y<f32>        (param f32) (f32.store offset=28 (gget $module*) (arg0)))

    (table $ref 16 externref)

    (global $INDEX_GPU          i32 i32(1))
    (global $INDEX_CANVAS       i32 i32(2))
    (global $INDEX_CONTEXT      i32 i32(3))
    (global $INDEX_ADAPTER      i32 i32(4))
    (global $INDEX_DEVICE       i32 i32(5))

    (global $INDEX_BUFFER_X     i32 i32(6))
    (global $INDEX_BUFFER_Y     i32 i32(7))
    (global $INDEX_BUFFER_Z     i32 i32(8))
    (global $INDEX_BUFFER_W     i32 i32(9))

    (global $INDEX_BUFFER_DESCRIPTOR_VERTEX_COPY_DST i32 i32(12))

    (main $canvas
        (call $prepareDocument)
        (call $setBodundingRect)

        (async 
            (call $preparegpu)
            (then $ongpu
                (param $gpu <GPU>)
                (result <Promise>)

                (tset $ref (gget $INDEX_GPU) (this))
                (call $requestAdapter)
            )
            (then $onadapter
                (param $adapter <GPUAdapter>)
                (result <Promise>)
                
                (tset $ref (gget $INDEX_ADAPTER) (this))
                (call $requestDevice)   
            )
            (then $ondevice
                (param $device <GPUDevice>)
                (result <Promise>)

                (tset $ref (gget $INDEX_DEVICE) (this))
                (call $createCanvas)
            )
            (then $oncanvas
                (param $canvas <HTMLCanvasElement>)
                (result <Promise>)

                (tset $ref (gget $INDEX_CANVAS) (this))
                (call $createContext)
            )
            (then $oncontext
                (param $context <GPUCanvasContext>)

                (tset $ref (gget $INDEX_CONTEXT) (this))
                (call $createDescriptors)
                (call $addEventListeners)
            )
        )
    )

    (func $preparegpu
        (result <Promise>)
        (reflect $apply<ext.ext.ext>ext
            (self $Promise.resolve)
            (self $Promise)
            (array $of<ext>ext
                (reflect $apply<ext.ext.ext>ext
                    (self $Navigator:gpu[get])
                    (self $navigator)
                    (args)
                )
            )
        )
    )

    (func $requestAdapter
        (result <Promise>)

        (reflect $apply<ext.ext.ext>ext
            (self $GPU:requestAdapter)
            (tget $ref (gget $INDEX_GPU))
            (args)
        )
    )

    (func $requestDevice
        (result <Promise>)

        (reflect $apply<ext.ext.ext>ext
            (self $GPUAdapter:requestDevice)
            (tget $ref (gget $INDEX_ADAPTER))
            (args)
        )
    )

    (func $setBodundingRect
        (local $boundingRect <DOMRect>)
        
        (local.set $boundingRect
            (reflect $apply<ext.ext.ext>ext
                (self $Element:getBoundingClientRect)
                (self $document.body)
                (args)
            )
        )

        (call $set_inner_width<f32>  
            (reflect $apply<ext.ext.ext>f32 
                (self $DOMRect:width[get]) (this) (args)
            )
        )
        
        (call $set_inner_height<f32> 
            (reflect $apply<ext.ext.ext>f32 
                (self $DOMRect:height[get]) (this) (args)
            )
        )
    )

    (func $prepareDocument
        (local $attribute <Attr>)

        (reflect $apply<ext.ext.ext> 
            (self $NamedNodeMap:removeNamedItem) 
            (self $document.body.attributes) 
            (array $of<ext>ext (text "onload"))
        )

        (local.set $attribute
            (reflect $apply<ext.ext.ext>ext 
                (self $Document:createAttribute) 
                (self $document) 
                (array $of<ext>ext (text "style"))
            )
        )

        (reflect $apply<ext.ext.ext> 
            (self $Attr:value[set]) 
            (local.get $attribute) 
            (array $of<ext>ext (text "margin: 0;"))
        )

        (reflect $apply<ext.ext.ext> 
            (self $NamedNodeMap:setNamedItem) 
            (self $document.body.attributes) 
            (array $of<ext>ext (local.get $attribute))
        )
    )

    (func $createCanvas
        (result        <HTMLCanvasElement>)
        (local $canvas <HTMLCanvasElement>)
        
        (local.set $canvas 
            (reflect $apply<ext.ext.ext>ext 
                (self $Document:createElement) 
                (self $document) 
                (array $of<ext>ext (text "canvas"))
            )
        )

        (reflect $apply<ext.ext.ext> 
            (self $HTMLCanvasElement:width[set]) 
            (local.get $canvas) 
            (array $of<f32>ext (call $get_inner_width<>f32))
        )

        (reflect $apply<ext.ext.ext> 
            (self $HTMLCanvasElement:height[set]) 
            (local.get $canvas) 
            (array $of<f32>ext (call $get_inner_height<>f32))
        )

        (reflect $apply<ext.ext.ext>
            (self $Node:appendChild)
            (self $document.body)
            (array $of<ext>ext (this))
        )

        (this)
    )

    (func $createContext
        (result         <GPUCanvasContext>)
        (local $context <GPUCanvasContext>)
        (local $descriptor <Configuration>)

        (local.set $context
            (reflect $apply<ext.ext.ext>ext
                (self $HTMLCanvasElement:getContext)
                (tget $ref (gget $INDEX_CANVAS))
                (array $of<ext>ext (text "webgpu"))
            )
        )

        (local.set $descriptor 
            (object $fromEntries<ext>ext
                (array $of<ext.ext.ext>ext
                    (array $of<ext.ext>ext (text "device") (tget $ref (gget $INDEX_DEVICE)))
                    (array $of<ext.ext>ext (text "format") (call $getPreferredCanvasFormat))
                    (array $of<ext.ext>ext (text "alphaMode") (text "premultiplied"))
                )
            )
        )

        (reflect $apply<ext.ext.ext>
            (self $GPUCanvasContext:configure)
            (this)
            (array $of<ext>ext (lget $descriptor))
        )

        (this)
    )

    (func $getPreferredCanvasFormat
        (result           <Format>)
        
        (reflect $apply<ext.ext.ext>ext
            (self $GPU:getPreferredCanvasFormat)    
            (tget $ref (gget $INDEX_GPU))
            (args)
        )
    )

    (func $createDescriptors
        (tset $ref 
            (gget $INDEX_BUFFER_DESCRIPTOR_VERTEX_COPY_DST)
            (object $fromEntries<ext>ext
                (array $of<ext.ext.ext>ext
                    (array $of<ext.i32>ext (text "size") (false))
                    (array $of<ext.ext>ext (text "label") (null))
                    (array $of<ext.i32>ext (text "usage") 
                        (i32.or
                            (reflect $get<ext.ext>i32 (self $GPUBufferUsage) (text "VERTEX"))
                            (reflect $get<ext.ext>i32 (self $GPUBufferUsage) (text "COPY_DST"))
                        )
                    )
                )
            )
        )
    )

    (func $new_Vertices<i32>
        (export "Vertices")
        (param $vertexCount i32)

        (call $createVertexBuffer<i32.i32.ext> (gget $INDEX_BUFFER_X) (lget $vertexCount) (text "X"))
        (call $createVertexBuffer<i32.i32.ext> (gget $INDEX_BUFFER_Y) (lget $vertexCount) (text "Y"))
        (call $createVertexBuffer<i32.i32.ext> (gget $INDEX_BUFFER_Z) (lget $vertexCount) (text "Z"))
        (call $createVertexBuffer<i32.i32.ext> (gget $INDEX_BUFFER_W) (lget $vertexCount) (text "W"))
    )

    (func $createVertexBuffer<i32.i32.ext>
        (param $index                   i32)
        (param $vertexCount             i32)
        (param $label              <String>)
        (local $descriptor         <Object>)
        (local $buffer          <GPUBuffer>)
        (local $size                    i32)

        (lset $size (i32.mul (lget $vertexCount) i32(4)))
        (lset $descriptor (tget $ref (gget $INDEX_BUFFER_DESCRIPTOR_VERTEX_COPY_DST)))

        (reflect $set<ext.ext.i32> (lget $descriptor) (text "size") (lget $size))
        (reflect $set<ext.ext.ext> (lget $descriptor) (text "label") (lget $label))

        (lset $buffer 
            (reflect $apply<ext.ext.ext>ext
                (self $GPUDevice:createBuffer)
                (tget $ref (gget $INDEX_DEVICE))
                (array $of<ext>ext (lget $descriptor))
            )
        )

        (tset $ref (lget $index) (lget $buffer))
    )

    (func $addEventListeners
        (reflect $apply<ext.ext.ext>
            (self $EventTarget:addEventListener)
            (self)
            (array $of<ext.fun>ext
                (text "pointermove")
                (ref.func $onpointermove<ext>)
            )
        )
    )

    (func $onpointermove<ext>
        (param $event <PointerEvent>)
        (call $onpointerevent<ext> (this))
    )

    (func $onpointerevent<ext>
        (param $event <PointerEvent>)
        (call $onmouseevent<ext> (this))
    )

    (func $onmouseevent<ext>
        (param $event <MouseEvent>)

        (call $set_client_x<f32> (reflect $apply<ext.ext.ext>f32 (self $MouseEvent:clientX[get]) (this) (args)))
        (call $set_client_y<f32> (reflect $apply<ext.ext.ext>f32 (self $MouseEvent:clientY[get]) (this) (args)))
    )

    (func $render

    )
)