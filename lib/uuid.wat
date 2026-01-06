(module
    (memory $base 1 65535 shared)

    (global $replace<RegExp> mut ext)
    (global $match<RegExp> mut ext)

    (global $OFFSET_LAST_UUID_INDEX  i32 i32(4))

    (global $OFFSET_SIZE_LENGTH         i32 i32(12))
    (global $OFFSET_USABLE_LENGTH       i32 i32(16))
    (global $OFFSET_MAX_UUID_COUNT      i32 i32(20))
    (global $OFFSET_INERT_UUID_COUNT    i32 i32(24))
    (global $OFFSET_USABLE_UUID_COUNT   i32 i32(28))
    (global $OFFSET_USABLE_BLOCK_COUNT  i32 i32(32))

    (global $OFFSET_I8A_BLOCKS_LENGTH   i32 i32(36))
    (global $OFFSET_I16_BLOCKS_LENGTH   i32 i32(40))
    (global $OFFSET_I32_BLOCKS_LENGTH   i32 i32(44))
    (global $OFFSET_I64_BLOCKS_LENGTH   i32 i32(48))
    (global $OFFSET_I8B_BLOCKS_LENGTH   i32 i32(52))

    (global $OFFSET_I8A_BLOCKS_BEGIN    i32 i32(56))
    (global $OFFSET_I16_BLOCKS_BEGIN    i32 i32(60))
    (global $OFFSET_I32_BLOCKS_BEGIN    i32 i32(64))
    (global $OFFSET_I64_BLOCKS_BEGIN    i32 i32(68))
    (global $OFFSET_I8B_BLOCKS_BEGIN    i32 i32(72))
    
    (global $OFFSET_BLOCKS_END          i32 i32(76))
    (global $OFFSET_USED_UUID_COUNT     i32 i32(80))
    (global $OFFSET_USED_BLOCK_COUNT    i32 i32(84))
    (global $OFFSET_NEXT_MEMORY_LENGTH  i32 i32(88))

    (global $OFFSET_BLOCKS_OFFSET       i32 i32(92))
    (global $OFFSET_I8A_BLOCKS_OFFSET   i32 i32(92))
    (global $OFFSET_I16_BLOCKS_OFFSET   i32 i32(96))
    (global $OFFSET_I32_BLOCKS_OFFSET   i32 i32(100))
    (global $OFFSET_I64_BLOCKS_OFFSET   i32 i32(104))
    (global $OFFSET_I8B_BLOCKS_OFFSET   i32 i32(108))

    (global $HEADERS_LENGTH             i32 i32(128))
    (global $BYTES_PER_UUID             i32 i32(16))
    (global $UUID_PER_BLOCK             i32 i32(16))
    (global $BYTES_PER_PAGE             i32 i32(65536))

    (global $BYTES_PER_I8A_ELEMENT      i32 i32(1))
    (global $BYTES_PER_I16_ELEMENT      i32 i32(2))
    (global $BYTES_PER_I32_ELEMENT      i32 i32(4))
    (global $BYTES_PER_I64_ELEMENT      i32 i32(8))
    (global $BYTES_PER_I8B_ELEMENT      i32 i32(1))

    (func $lastUUIDIndex (result i32) (i32.load (gget $OFFSET_LAST_UUID_INDEX)))
    (func $nextUUIDIndex (result i32) (i32.atomic.rmw.add (gget $OFFSET_LAST_UUID_INDEX) i32(1)))

    (global $ITERATOR_VECTOR_A (mut v128) (v128.const i64x2 0 0))
    (global $ITERATOR_VECTOR_B (mut v128) (v128.const i64x2 0 0))

    (func $align_blocks
        (local $memoryLength i32)
        (local $usableLength i32)
        (local $maxUUIDCount i32)
        (local $inertUUIDCount i32)
        (local $usableUUIDCount i32)
        (local $usableBlockCount i32)

        (local $length/i8a i32)
        (local $length/i16 i32)
        (local $length/i32 i32)
        (local $length/i64 i32)
        (local $length/i8b i32)

        (local $offset i32)
        (local $offset/i8a i32)
        (local $offset/i16 i32)
        (local $offset/i32 i32)
        (local $offset/i64 i32)
        (local $offset/i8b i32)

        (lset $memoryLength     (i32.mul   (memory.size)           (gget $BYTES_PER_PAGE)))
        (lset $usableLength     (i32.sub   (lget $memoryLength)    (gget $HEADERS_LENGTH)))
        (lset $maxUUIDCount     (i32.div_u (lget $usableLength)    (gget $BYTES_PER_UUID)))
        (lset $inertUUIDCount   (i32.rem_u (lget $maxUUIDCount)    (gget $UUID_PER_BLOCK)))
        (lset $usableUUIDCount  (i32.sub   (lget $maxUUIDCount)    (lget $inertUUIDCount)))
        (lset $usableBlockCount (i32.div_u (lget $usableUUIDCount) (gget $UUID_PER_BLOCK)))

        (call $set_size_length<i32>         (lget $memoryLength))
        (call $set_usable_length<i32>       (lget $usableLength))
        (call $set_max_uuid_count<i32>      (lget $maxUUIDCount))
        (call $set_inert_uuid_count<i32>    (lget $inertUUIDCount))
        (call $set_usable_uuid_count<i32>   (lget $usableUUIDCount))
        (call $set_usable_block_count<i32>  (lget $usableBlockCount))

        (lset $length/i8a (i32.mul (gget $BYTES_PER_I8A_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i16 (i32.mul (gget $BYTES_PER_I16_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i32 (i32.mul (gget $BYTES_PER_I32_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i64 (i32.mul (gget $BYTES_PER_I64_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i8b (i32.mul (gget $BYTES_PER_I8B_ELEMENT) (lget $usableUUIDCount)))

        (call $set_i8a_blocks_length<i32> (lget $length/i8a))
        (call $set_i16_blocks_length<i32> (lget $length/i16))
        (call $set_i32_blocks_length<i32> (lget $length/i32))
        (call $set_i64_blocks_length<i32> (lget $length/i64))
        (call $set_i8b_blocks_length<i32> (lget $length/i8b))

        (lset $offset (gget $HEADERS_LENGTH))
        (lset $offset (i32.add (lget $length/i8a) (ltee $offset/i8a (lget $offset))))
        (lset $offset (i32.add (lget $length/i16) (ltee $offset/i16 (lget $offset))))
        (lset $offset (i32.add (lget $length/i32) (ltee $offset/i32 (lget $offset))))
        (lset $offset (i32.add (lget $length/i64) (ltee $offset/i64 (lget $offset))))
        (lset $offset (i32.add (lget $length/i8b) (ltee $offset/i8b (lget $offset))))

        (call $set_i8a_blocks_begin<i32> (lget $offset/i8a))    
        (call $set_i16_blocks_begin<i32> (lget $offset/i16))    
        (call $set_i32_blocks_begin<i32> (lget $offset/i32))    
        (call $set_i64_blocks_begin<i32> (lget $offset/i64))    
        (call $set_i8b_blocks_begin<i32> (lget $offset/i8b))    
     
        (call $set_i8a_blocks_offset<i32> (call $get_i8a_blocks_begin<>i32))    
        (call $set_i16_blocks_offset<i32> (call $get_i16_blocks_begin<>i32))    
        (call $set_i32_blocks_offset<i32> (call $get_i32_blocks_begin<>i32))    
        (call $set_i64_blocks_offset<i32> (call $get_i64_blocks_begin<>i32))    
        (call $set_i8b_blocks_offset<i32> (call $get_i8b_blocks_begin<>i32))    
     
        (call $set_blocks_end<i32> (lget $offset))    
        (call $set_used_uuid_count<>i32 i32(0))
        (call $set_used_block_count<>i32 i32(1))
        (call $set_next_memory_length<>i32 (i32.mul (lget $memoryLength) i32(10)))

        (gset $ITERATOR_VECTOR_A (v128.const i32x4 1 0 0 1))
        (gset $ITERATOR_VECTOR_B (v128.const i32x4 2 4 8 1))
    )

    (func $dump_headers
        (console $log<ext.i32> (text "size_length")         (call $get_size_length<>i32))
        (console $log<ext.i32> (text "usable_length")       (call $get_usable_length<>i32))
        (console $log<ext.i32> (text "max_uuid_count")      (call $get_max_uuid_count<>i32))
        (console $log<ext.i32> (text "inert_uuid_count")    (call $get_inert_uuid_count<>i32))
        (console $log<ext.i32> (text "usable_uuid_count")   (call $get_usable_uuid_count<>i32))
        (console $log<ext.i32> (text "usable_block_count")  (call $get_usable_block_count<>i32))

        (console $log<ext.i32> (text "i8a_blocks_length")   (call $get_i8a_blocks_length<>i32))
        (console $log<ext.i32> (text "i16_blocks_length")   (call $get_i16_blocks_length<>i32))
        (console $log<ext.i32> (text "i32_blocks_length")   (call $get_i32_blocks_length<>i32))
        (console $log<ext.i32> (text "i64_blocks_length")   (call $get_i64_blocks_length<>i32))
        (console $log<ext.i32> (text "i8b_blocks_length")   (call $get_i8b_blocks_length<>i32))

        (console $log<ext.i32> (text "i8a_blocks_begin")    (call $get_i8a_blocks_begin<>i32))
        (console $log<ext.i32> (text "i16_blocks_begin")    (call $get_i16_blocks_begin<>i32))
        (console $log<ext.i32> (text "i32_blocks_begin")    (call $get_i32_blocks_begin<>i32))
        (console $log<ext.i32> (text "i64_blocks_begin")    (call $get_i64_blocks_begin<>i32))
        (console $log<ext.i32> (text "i8b_blocks_begin")    (call $get_i8b_blocks_begin<>i32))

        (console $log<ext.i32> (text "blocks_end")          (call $get_blocks_end<>i32))
        (console $log<ext.i32> (text "used_uuid_count")     (call $get_used_uuid_count<>i32))
        (console $log<ext.i32> (text "used_block_count")    (call $get_used_block_count<>i32))
        (console $log<ext.i32> (text "next_memory_length")  (call $get_next_memory_length<>i32))
    )

    (func $set_size_length<i32>         (param i32) (i32.store (gget $OFFSET_SIZE_LENGTH) (arg0)))
    (func $set_usable_length<i32>       (param i32) (i32.store (gget $OFFSET_USABLE_LENGTH) (arg0)))
    (func $set_max_uuid_count<i32>      (param i32) (i32.store (gget $OFFSET_MAX_UUID_COUNT) (arg0)))
    (func $set_inert_uuid_count<i32>    (param i32) (i32.store (gget $OFFSET_INERT_UUID_COUNT) (arg0)))
    (func $set_usable_uuid_count<i32>   (param i32) (i32.store (gget $OFFSET_USABLE_UUID_COUNT) (arg0)))
    (func $set_usable_block_count<i32>  (param i32) (i32.store (gget $OFFSET_USABLE_BLOCK_COUNT) (arg0)))

    (func $set_i8a_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I8A_BLOCKS_LENGTH) (arg0)))
    (func $set_i16_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I16_BLOCKS_LENGTH) (arg0)))
    (func $set_i32_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I32_BLOCKS_LENGTH) (arg0)))
    (func $set_i64_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I64_BLOCKS_LENGTH) (arg0)))
    (func $set_i8b_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I8B_BLOCKS_LENGTH) (arg0)))

    (func $set_i8a_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I8A_BLOCKS_BEGIN) (arg0)))
    (func $set_i16_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I16_BLOCKS_BEGIN) (arg0)))
    (func $set_i32_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I32_BLOCKS_BEGIN) (arg0)))
    (func $set_i64_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I64_BLOCKS_BEGIN) (arg0)))
    (func $set_i8b_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I8B_BLOCKS_BEGIN) (arg0)))

    (func $set_blocks_offsets<v128>     (param v128) (v128.store (gget $OFFSET_BLOCKS_OFFSET) (arg0)))
    (func $set_i8a_blocks_offset<i32>   (param i32) (i32.store (gget $OFFSET_I8A_BLOCKS_OFFSET) (arg0)))
    (func $set_i16_blocks_offset<i32>   (param i32) (i32.store (gget $OFFSET_I16_BLOCKS_OFFSET) (arg0)))
    (func $set_i32_blocks_offset<i32>   (param i32) (i32.store (gget $OFFSET_I32_BLOCKS_OFFSET) (arg0)))
    (func $set_i64_blocks_offset<i32>   (param i32) (i32.store (gget $OFFSET_I64_BLOCKS_OFFSET) (arg0)))
    (func $set_i8b_blocks_offset<i32>   (param i32) (i32.store (gget $OFFSET_I8B_BLOCKS_OFFSET) (arg0)))

    (func $set_blocks_end<i32>          (param i32) (i32.store (gget $OFFSET_BLOCKS_END) (arg0)))
    (func $set_used_uuid_count<>i32     (param i32) (i32.store (gget $OFFSET_USED_UUID_COUNT) (arg0)))
    (func $set_used_block_count<>i32    (param i32) (i32.store (gget $OFFSET_USED_BLOCK_COUNT) (arg0)))
    (func $set_next_memory_length<>i32  (param i32) (i32.store (gget $OFFSET_NEXT_MEMORY_LENGTH) (arg0)))

    (func $get_size_length<>i32         (result i32) (i32.load (gget $OFFSET_SIZE_LENGTH)))
    (func $get_usable_length<>i32       (result i32) (i32.load (gget $OFFSET_USABLE_LENGTH)))
    (func $get_max_uuid_count<>i32      (result i32) (i32.load (gget $OFFSET_MAX_UUID_COUNT)))
    (func $get_inert_uuid_count<>i32    (result i32) (i32.load (gget $OFFSET_INERT_UUID_COUNT)))
    (func $get_usable_uuid_count<>i32   (result i32) (i32.load (gget $OFFSET_USABLE_UUID_COUNT)))
    (func $get_usable_block_count<>i32  (result i32) (i32.load (gget $OFFSET_USABLE_BLOCK_COUNT)))

    (func $get_i8a_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I8A_BLOCKS_LENGTH)))
    (func $get_i16_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I16_BLOCKS_LENGTH)))
    (func $get_i32_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I32_BLOCKS_LENGTH)))
    (func $get_i64_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I64_BLOCKS_LENGTH)))
    (func $get_i8b_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I8B_BLOCKS_LENGTH)))

    (func $get_i8a_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I8A_BLOCKS_BEGIN)))
    (func $get_i16_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I16_BLOCKS_BEGIN)))
    (func $get_i32_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I32_BLOCKS_BEGIN)))
    (func $get_i64_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I64_BLOCKS_BEGIN)))
    (func $get_i8b_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I8B_BLOCKS_BEGIN)))

    (func $get_blocks_offsets<>v128     (result v128) (v128.load (gget $OFFSET_BLOCKS_OFFSET)))
    (func $get_i8a_blocks_offset<>i32   (result i32) (i32.load (gget $OFFSET_I8A_BLOCKS_OFFSET)))
    (func $get_i16_blocks_offset<>i32   (result i32) (i32.load (gget $OFFSET_I16_BLOCKS_OFFSET)))
    (func $get_i32_blocks_offset<>i32   (result i32) (i32.load (gget $OFFSET_I32_BLOCKS_OFFSET)))
    (func $get_i64_blocks_offset<>i32   (result i32) (i32.load (gget $OFFSET_I64_BLOCKS_OFFSET)))
    (func $get_i8b_blocks_offset<>i32   (result i32) (i32.load (gget $OFFSET_I8B_BLOCKS_OFFSET)))

    (func $get_blocks_end<>i32          (result i32) (i32.load (gget $OFFSET_BLOCKS_END)))
    (func $get_used_uuid_count<>i32     (result i32) (i32.load (gget $OFFSET_USED_UUID_COUNT)))
    (func $get_used_block_count<>i32    (result i32) (i32.load (gget $OFFSET_USED_BLOCK_COUNT)))
    (func $get_next_memory_length<>i32  (result i32) (i32.load (gget $OFFSET_NEXT_MEMORY_LENGTH)))

    (main $init
        (call $align_blocks)
        (call $dump_headers)

        (gset $replace<RegExp> 
            (reflect $construct<ext.ext>ext
                (ref.extern $RegExp)
                (array $of<ext.ext>ext
                    (text "[^a-f0-9]") (text "gi")
                )
            )
        )

        (gset $match<RegExp> 
            (reflect $construct<ext.ext>ext
                (ref.extern $RegExp)
                (array $of<ext.ext>ext
                    (text "..") (text "g")
                )
            )
        )
    )

    (func $toHEXString<ext>ext
        (param $string <String>)
        (result <String>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $String:replace)
            (this)
            (array $of<ext.ext>ext 
                (gget $replace<RegExp>) (text "")
            )
        )
    )

    (func $matchAllByte<ext>ext
        (param $string <String>)
        (result <Array>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $String:match)
            (this)
            (array $of<ext>ext (gget $match<RegExp>))
        )
    )

    (func $toDecimalInt<ext>ext
        (param $array <Array>)
        (result <Array>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Array:map)
            (this)
            (array $of<fun>ext 
                (ref.func $parseInt<ext>i32)
            )
        )
    )

    (func $toDataView<ext>ext
        (param $buffer <ArrayBuffer>)
        (result           <DataView>)

        (reflect $construct<ext.ext>ext
            (ref.extern $DataView)
            (array $of<ext>ext (this))
        )
    )

    (func $toArrayBuffer<ext>ext
        (param $array    <Array>)
        (result    <ArrayBuffer>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Uint8Array.__proto__:buffer[get])
            (reflect $construct<ext.ext>ext
                (ref.extern $Uint8Array)
                (array $of<ext>ext (this))
            )
            (array)
        )
    )

    (func $parseInt<ext>i32
        (param $hex <String>)
        (result i32)

        (call $self.parseInt<ext.i32>i32 (this) i32(16))
    )

    (global $offset/i8a i32 i32(0))
    (global $offset/i16 i32 i32(1))
    (global $offset/i32 i32 i32(3))
    (global $offset/i64 i32 i32(7))
    (global $offset/i8b i32 i32(15))

    (func $i8a<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint8) (this) (array $of<i32.i32>ext (gget $offset/i8a) (true)))
    )

    (func $i16<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint16) (this) (array $of<i32.i32>ext (gget $offset/i16) (true)))
    )

    (func $i32<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint32) (this) (array $of<i32.i32>ext (gget $offset/i32) (true)))
    )

    (func $i64<ext>i64
        (param $dataView <DataView>)
        (result i64)
        (reflect $apply<ext.ext.ext>i64 (ref.extern $DataView:getBigUint64) (this) (array $of<i32.i32>ext (gget $offset/i64) (true)))
    )

    (func $i8b<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint8) (this) (array $of<i32.i32>ext (gget $offset/i8b) (true)))
    )

    (func $add
        (export "add")
        (param $uuid <BigVec128>)

        (local $i8a     i32)
        (local $i16     i32)
        (local $i32     i32)
        (local $i64     i64)
        (local $i8b     i32)
        (local $offsets     v128)

        (console $warn<ext> (this))
        (console $warn<ext> (call $self.String<ext>ext (this)))

        (this)
        (ltee $uuid (call $self.String<ext>ext))
        (ltee $uuid (call $toHEXString<ext>ext))
        (ltee $uuid (call $matchAllByte<ext>ext))
        (ltee $uuid (call $toDecimalInt<ext>ext))
        (ltee $uuid (call $toArrayBuffer<ext>ext))
        (lset $uuid (call $toDataView<ext>ext))

        (lset $i8a (call $i8a<ext>i32 (this)))
        (lset $i16 (call $i16<ext>i32 (this)))
        (lset $i32 (call $i32<ext>i32 (this)))
        (lset $i64 (call $i64<ext>i64 (this)))
        (lset $i8b (call $i8b<ext>i32 (this)))

        (console $warn<i32> (lget $i8a))
        (console $warn<i32> (lget $i16))
        (console $warn<i32> (lget $i32))
        (console $warn<i64> (lget $i64))
        (console $warn<i32> (lget $i8b))

        (call $set_blocks_offsets<v128> 
            (ltee $offsets 
                (i32x4.add 
                    (v128.const i32x4 1 2 4 8) 
                    (call $get_blocks_offsets<>v128)
                )
            )
        )

        (i32.store8  (i32x4.extract_lane 0 (lget $offsets)) (lget $i8a))
        (i32.store16 (i32x4.extract_lane 1 (lget $offsets)) (lget $i16))
        (i32.store   (i32x4.extract_lane 2 (lget $offsets)) (lget $i32))
        (i64.store   (i32x4.extract_lane 3 (lget $offsets)) (lget $i64))
    )

)