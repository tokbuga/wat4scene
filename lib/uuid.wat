(module
    (memory $base 1 65535 shared)

    (global $REGEXP_REPLACE_NON_WD      mut ext)
    (global $REGEXP_MATCH_AF09AF09      mut ext)

    (global $OFFSET_SIZE_LENGTH         i32 i32(12))
    (global $OFFSET_USABLE_LENGTH       i32 i32(16))
    (global $OFFSET_MAX_UUID_COUNT      i32 i32(20))
    (global $OFFSET_INERT_UUID_COUNT    i32 i32(24))
    (global $OFFSET_USABLE_UUID_COUNT   i32 i32(28))
    (global $OFFSET_USABLE_BLOCK_COUNT  i32 i32(32))

    (global $OFFSET_IDX_BLOCKS_LENGTH   i32 i32(36))
    (global $OFFSET_I8A_BLOCKS_LENGTH   i32 i32(40))
    (global $OFFSET_I16_BLOCKS_LENGTH   i32 i32(44))
    (global $OFFSET_I32_BLOCKS_LENGTH   i32 i32(48))
    (global $OFFSET_I64_BLOCKS_LENGTH   i32 i32(52))
    (global $OFFSET_I8B_BLOCKS_LENGTH   i32 i32(56))

    (global $OFFSET_IDX_BLOCKS_BEGIN    i32 i32(60))
    (global $OFFSET_I8A_BLOCKS_BEGIN    i32 i32(64))
    (global $OFFSET_I16_BLOCKS_BEGIN    i32 i32(68))
    (global $OFFSET_I32_BLOCKS_BEGIN    i32 i32(72))
    (global $OFFSET_I64_BLOCKS_BEGIN    i32 i32(76))
    (global $OFFSET_I8B_BLOCKS_BEGIN    i32 i32(80))
    
    (global $OFFSET_BLOCKS_END          i32 i32(84))
    (global $OFFSET_USED_UUID_COUNT     i32 i32(88))
    (global $OFFSET_USED_BLOCK_COUNT    i32 i32(92))
    (global $OFFSET_NEXT_MEMORY_LENGTH  i32 i32(96))

    (global $OFFSET_BLOCKS_OFFSET       i32 i32(100))
    (global $OFFSET_IDX_BLOCKS_OFFSET   i32 i32(100))
    (global $OFFSET_I8A_BLOCKS_OFFSET   i32 i32(104))
    (global $OFFSET_I16_BLOCKS_OFFSET   i32 i32(108))
    (global $OFFSET_I32_BLOCKS_OFFSET   i32 i32(112))
    (global $OFFSET_I64_BLOCKS_OFFSET   i32 i32(116))
    (global $OFFSET_I8B_BLOCKS_OFFSET   i32 i32(120))

    (global $HEADERS_LENGTH             i32 i32(128))
    (global $BYTES_PER_UUID             i32 i32(20))
    (global $LENGTH_OF_UUID             i32 i32(16))
    (global $UUID_PER_BLOCK             i32 i32(16))
    (global $BYTES_PER_PAGE             i32 i32(65536))

    (global $BYTES_PER_IDX_ELEMENT      i32 i32(4))
    (global $BYTES_PER_I8A_ELEMENT      i32 i32(1))
    (global $BYTES_PER_I16_ELEMENT      i32 i32(2))
    (global $BYTES_PER_I32_ELEMENT      i32 i32(4))
    (global $BYTES_PER_I64_ELEMENT      i32 i32(8))
    (global $BYTES_PER_I8B_ELEMENT      i32 i32(1))

    (global $offset.i8a                 i32 i32(0))
    (global $offset.i16                 i32 i32(1))
    (global $offset.i32                 i32 i32(3))
    (global $offset.i64                 i32 i32(7))
    (global $offset.i8b                 i32 i32(15))

    (func $set_size_length<i32>         (param i32) (i32.store (gget $OFFSET_SIZE_LENGTH) (arg0)))
    (func $set_usable_length<i32>       (param i32) (i32.store (gget $OFFSET_USABLE_LENGTH) (arg0)))
    (func $set_max_uuid_count<i32>      (param i32) (i32.store (gget $OFFSET_MAX_UUID_COUNT) (arg0)))
    (func $set_inert_uuid_count<i32>    (param i32) (i32.store (gget $OFFSET_INERT_UUID_COUNT) (arg0)))
    (func $set_usable_uuid_count<i32>   (param i32) (i32.store (gget $OFFSET_USABLE_UUID_COUNT) (arg0)))
    (func $set_usable_block_count<i32>  (param i32) (i32.store (gget $OFFSET_USABLE_BLOCK_COUNT) (arg0)))

    (func $set_idx_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_IDX_BLOCKS_LENGTH) (arg0)))
    (func $set_i8a_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I8A_BLOCKS_LENGTH) (arg0)))
    (func $set_i16_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I16_BLOCKS_LENGTH) (arg0)))
    (func $set_i32_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I32_BLOCKS_LENGTH) (arg0)))
    (func $set_i64_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I64_BLOCKS_LENGTH) (arg0)))
    (func $set_i8b_blocks_length<i32>   (param i32) (i32.store (gget $OFFSET_I8B_BLOCKS_LENGTH) (arg0)))

    (func $set_idx_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_IDX_BLOCKS_BEGIN) (arg0)))
    (func $set_i8a_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I8A_BLOCKS_BEGIN) (arg0)))
    (func $set_i16_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I16_BLOCKS_BEGIN) (arg0)))
    (func $set_i32_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I32_BLOCKS_BEGIN) (arg0)))
    (func $set_i64_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I64_BLOCKS_BEGIN) (arg0)))
    (func $set_i8b_blocks_begin<i32>    (param i32) (i32.store (gget $OFFSET_I8B_BLOCKS_BEGIN) (arg0)))

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

    (func $get_idx_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_IDX_BLOCKS_LENGTH)))
    (func $get_i8a_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I8A_BLOCKS_LENGTH)))
    (func $get_i16_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I16_BLOCKS_LENGTH)))
    (func $get_i32_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I32_BLOCKS_LENGTH)))
    (func $get_i64_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I64_BLOCKS_LENGTH)))
    (func $get_i8b_blocks_length<>i32   (result i32) (i32.load (gget $OFFSET_I8B_BLOCKS_LENGTH)))

    (func $get_idx_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_IDX_BLOCKS_BEGIN)))
    (func $get_i8a_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I8A_BLOCKS_BEGIN)))
    (func $get_i16_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I16_BLOCKS_BEGIN)))
    (func $get_i32_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I32_BLOCKS_BEGIN)))
    (func $get_i64_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I64_BLOCKS_BEGIN)))
    (func $get_i8b_blocks_begin<>i32    (result i32) (i32.load (gget $OFFSET_I8B_BLOCKS_BEGIN)))

    (func $get_blocks_end<>i32          (result i32) (i32.load (gget $OFFSET_BLOCKS_END)))
    (func $get_used_uuid_count<>i32     (result i32) (i32.load (gget $OFFSET_USED_UUID_COUNT)))
    (func $get_used_block_count<>i32    (result i32) (i32.load (gget $OFFSET_USED_BLOCK_COUNT)))
    (func $get_next_memory_length<>i32  (result i32) (i32.load (gget $OFFSET_NEXT_MEMORY_LENGTH)))
    (func $add_used_uuid_count_1<>i32   (result i32) (i32.atomic.rmw.add (gget $OFFSET_USED_UUID_COUNT) i32(1)))

    (func $random<>i32                  (result i32) (i32.reinterpret_f32 (call $self.Math.random<>f32)))
    (func $random<>i64                  (result i64) (i64.reinterpret_f64 (call $self.Math.random<>f64)))

    (func $get_idx_uuid_value<i32>i32   (param $offset i32) (result i32) (u32.load (lget $offset)))
    (func $get_i8a_uuid_value<i32>i32   (param $offset i32) (result i32) (u8.load  (lget $offset)))
    (func $get_i16_uuid_value<i32>i32   (param $offset i32) (result i32) (u16.load (lget $offset)))
    (func $get_i32_uuid_value<i32>i32   (param $offset i32) (result i32) (u32.load (lget $offset)))
    (func $get_i64_uuid_value<i32>i64   (param $offset i32) (result i64) (u64.load (lget $offset)))
    (func $get_i8b_uuid_value<i32>i32   (param $offset i32) (result i32) (u8.load  (lget $offset)))

    (func $set_idx_uuid_value<i32.i32>  (param $offset i32) (param $value i32) (u32.store (lget $offset) (lget $value)))
    (func $set_i8a_uuid_value<i32.i32>  (param $offset i32) (param $value i32) (u8.store  (lget $offset) (lget $value)))
    (func $set_i16_uuid_value<i32.i32>  (param $offset i32) (param $value i32) (u16.store (lget $offset) (lget $value)))
    (func $set_i32_uuid_value<i32.i32>  (param $offset i32) (param $value i32) (u32.store (lget $offset) (lget $value)))
    (func $set_i64_uuid_value<i32.i64>  (param $offset i32) (param $value i64) (u64.store (lget $offset) (lget $value)))
    (func $set_i8b_uuid_value<i32.i32>  (param $offset i32) (param $value i32) (u8.store  (lget $offset) (lget $value)))

    (func $calc_idx_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_IDX_ELEMENT)) (call $get_idx_blocks_begin<>i32)))
    (func $calc_i8a_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_I8A_ELEMENT)) (call $get_i8a_blocks_begin<>i32)))
    (func $calc_i16_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_I16_ELEMENT)) (call $get_i16_blocks_begin<>i32)))
    (func $calc_i32_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_I32_ELEMENT)) (call $get_i32_blocks_begin<>i32)))
    (func $calc_i64_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_I64_ELEMENT)) (call $get_i64_blocks_begin<>i32)))
    (func $calc_i8b_uuid_begin<i32>i32  (param $index i32) (result i32) (i32.add (i32.mul (lget $index) (gget $BYTES_PER_I8B_ELEMENT)) (call $get_i8b_blocks_begin<>i32)))

    (main $init
        (local $memoryLength i32)
        (local $usableLength i32)
        (local $maxUUIDCount i32)
        (local $inertUUIDCount i32)
        (local $usableUUIDCount i32)
        (local $usableBlockCount i32)

        (local $length/idx i32)
        (local $length/i8a i32)
        (local $length/i16 i32)
        (local $length/i32 i32)
        (local $length/i64 i32)
        (local $length/i8b i32)

        (local $offset i32)
        (local $offset.idx i32)
        (local $offset.i8a i32)
        (local $offset.i16 i32)
        (local $offset.i32 i32)
        (local $offset.i64 i32)
        (local $offset.i8b i32)

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

        (lset $length/idx (i32.mul (gget $BYTES_PER_IDX_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i8a (i32.mul (gget $BYTES_PER_I8A_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i16 (i32.mul (gget $BYTES_PER_I16_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i32 (i32.mul (gget $BYTES_PER_I32_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i64 (i32.mul (gget $BYTES_PER_I64_ELEMENT) (lget $usableUUIDCount)))
        (lset $length/i8b (i32.mul (gget $BYTES_PER_I8B_ELEMENT) (lget $usableUUIDCount)))

        (call $set_idx_blocks_length<i32> (lget $length/idx))
        (call $set_i8a_blocks_length<i32> (lget $length/i8a))
        (call $set_i16_blocks_length<i32> (lget $length/i16))
        (call $set_i32_blocks_length<i32> (lget $length/i32))
        (call $set_i64_blocks_length<i32> (lget $length/i64))
        (call $set_i8b_blocks_length<i32> (lget $length/i8b))

        (lset $offset (gget $HEADERS_LENGTH))
        (lset $offset (i32.add (lget $length/idx) (ltee $offset.idx (lget $offset))))
        (lset $offset (i32.add (lget $length/i8a) (ltee $offset.i8a (lget $offset))))
        (lset $offset (i32.add (lget $length/i16) (ltee $offset.i16 (lget $offset))))
        (lset $offset (i32.add (lget $length/i32) (ltee $offset.i32 (lget $offset))))
        (lset $offset (i32.add (lget $length/i64) (ltee $offset.i64 (lget $offset))))
        (lset $offset (i32.add (lget $length/i8b) (ltee $offset.i8b (lget $offset))))
        (call $set_blocks_end<i32> (lget $offset))    

        (call $set_idx_blocks_begin<i32> (lget $offset.idx))    
        (call $set_i8a_blocks_begin<i32> (lget $offset.i8a))    
        (call $set_i16_blocks_begin<i32> (lget $offset.i16))    
        (call $set_i32_blocks_begin<i32> (lget $offset.i32))    
        (call $set_i64_blocks_begin<i32> (lget $offset.i64))    
        (call $set_i8b_blocks_begin<i32> (lget $offset.i8b))    

        (call $set_used_uuid_count<>i32 i32(1))
        (call $set_used_block_count<>i32 i32(1))
        (call $set_next_memory_length<>i32 (i32.mul (lget $memoryLength) i32(10)))

        (gset $REGEXP_REPLACE_NON_WD 
            (reflect $construct<ext.ext>ext
                (ref.extern $RegExp)
                (array $of<ext.ext>ext
                    (text "[^a-f0-9]") (text "gi")
                )
            )
        )

        (gset $REGEXP_MATCH_AF09AF09 
            (reflect $construct<ext.ext>ext
                (ref.extern $RegExp)
                (array $of<ext.ext>ext
                    (text "..") (text "g")
                )
            )
        )
    )

    (func $push_with_splice<ext.i32.ext>
        (param $array        <Array>)
        (param $index            i32)
        (param $element        <Any>)

        (reflect $apply<ext.ext.ext> 
            (ref.extern $Array:splice) 
            (this) 
            (array $of<i32.i32.ext>ext 
                (lget $index) (false) (lget $element)
            )
        )
    )

    (func $str_uuid_of_ui8array<ext>ext
        (param $uInt8Array <Uint8Array>)
        (result <Array>)
        (local $array <Array>)

        (lset $array 
            (call $map_array_to_hex<ext>ext 
                (call $self.Array.from<ext>ext (this))
            )
        )

        (call $push_with_splice<ext.i32.ext> (lget $array) i32(10) (text "-"))
        (call $push_with_splice<ext.i32.ext> (lget $array)  i32(8) (text "-"))
        (call $push_with_splice<ext.i32.ext> (lget $array)  i32(6) (text "-"))
        (call $push_with_splice<ext.i32.ext> (lget $array)  i32(4) (text "-"))

        (call $join_array<ext.ext>ext (lget $array) (string))
    )

    (func $get_uuid_buffer<i32>ext
        (param $index                  i32)
        (result              <ArrayBuffer>)
        
        (local $begin.i8a              i32)
        (local $begin.i16              i32)
        (local $begin.i32              i32)
        (local $begin.i64              i32)
        (local $begin.i8b              i32)

        (local $value.i8a              i32)
        (local $value.i16              i32)
        (local $value.i32              i32)
        (local $value.i64              i64)
        (local $value.i8b              i32)

        (local $buffer       <ArrayBuffer>)
        (local $dataView        <DataView>)

        (lset $begin.i8a (call $calc_i8a_uuid_begin<i32>i32 (lget $index)))
        (lset $begin.i16 (call $calc_i16_uuid_begin<i32>i32 (lget $index)))
        (lset $begin.i32 (call $calc_i32_uuid_begin<i32>i32 (lget $index)))
        (lset $begin.i64 (call $calc_i64_uuid_begin<i32>i32 (lget $index)))
        (lset $begin.i8b (call $calc_i8b_uuid_begin<i32>i32 (lget $index)))
        
        (lset $value.i8a (call $get_i8a_uuid_value<i32>i32  (lget $begin.i8a)))
        (lset $value.i16 (call $get_i16_uuid_value<i32>i32  (lget $begin.i16)))
        (lset $value.i32 (call $get_i32_uuid_value<i32>i32  (lget $begin.i32)))
        (lset $value.i64 (call $get_i64_uuid_value<i32>i64  (lget $begin.i64)))
        (lset $value.i8b (call $get_i8b_uuid_value<i32>i32  (lget $begin.i8b)))

        (lset $buffer    (call $new_array_buffer<i32>ext    (gget $LENGTH_OF_UUID)))
        (lset $dataView  (call $new_data_view<ext>ext       (lget $buffer)))

        (call $set_i8a_uuid_value<ext.i32> (lget $dataView) (lget $value.i8a))
        (call $set_i16_uuid_value<ext.i32> (lget $dataView) (lget $value.i16))
        (call $set_i32_uuid_value<ext.i32> (lget $dataView) (lget $value.i32))
        (call $set_i64_uuid_value<ext.i64> (lget $dataView) (lget $value.i64))
        (call $set_i8b_uuid_value<ext.i32> (lget $dataView) (lget $value.i8b))

        (lget $buffer)
    )

    (func $new_array_buffer<i32>ext
        (param $length            i32)
        (result         <ArrayBuffer>)
        (reflect $construct<ext.ext>ext (ref.extern $ArrayBuffer) (array $of<i32>ext (arg0)))
    )

    (func $new_data_view<ext>ext
        (param $buffer  <ArrayBuffer>)
        (result            <DataView>)
        (reflect $construct<ext.ext>ext (ref.extern $DataView) (array $of<ext>ext (arg0)))
    )

    (func $new_uint8_array<ext>ext
        (param $buffer  <ArrayBuffer>)
        (result          <Uint8Array>)
        (reflect $construct<ext.ext>ext (ref.extern $Uint8Array) (array $of<ext>ext (arg0)))
    )

    (func $replace_for_clean_str<ext>ext
        (param $string <String>)
        (result <String>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $String:replace)
            (this)
            (array $of<ext.ext>ext 
                (gget $REGEXP_REPLACE_NON_WD) (text "")
            )
        )
    )

    (func $match_for_hex_array<ext>ext
        (param $string <String>)
        (result <Array>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $String:match)
            (this)
            (array $of<ext>ext (gget $REGEXP_MATCH_AF09AF09))
        )
    )

    (func $map_with_parse_int<ext>ext
        (param $array <Array>)
        (result <Array>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Array:map)
            (this)
            (array $of<fun>ext (ref.func $call_parse_int<ext>i32))
        )
    )

    (func $map_array_to_hex<ext>ext
        (param $array <Array>)
        (result <Array>)

        (lset $array
            (reflect $apply<ext.ext.ext>ext
                (ref.extern $Array:map)
                (this)
                (array $of<fun>ext (ref.func $call_to_string<i32>ext))
            )
        )

        (lset $array
            (reflect $apply<ext.ext.ext>ext
                (ref.extern $Array:map)
                (this)
                (array $of<fun>ext (ref.func $call_pad_start<ext>ext))
            )
        )

        (this)
    )

    (func $join_array<ext.ext>ext
        (param $array    <Array>)
        (param $joiner  <String>)
        (result         <String>)
        
        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Array:join)
            (this)
            (array $of<ext>ext (lget $joiner))
        )
    )

    (func $new_array_bufferFromIntArray<ext>ext
        (param $array    <Array>)
        (result    <ArrayBuffer>)

        (reflect $apply<ext.ext.ext>ext
            (ref.extern $Uint8Array.__proto__:buffer[get])
            (call $new_uint8_array<ext>ext (this))
            (array)
        )
    )

    (func $call_parse_int<ext>i32
        (param $hex      <String>)
        (result               i32)

        (reflect $apply<ext.ext.ext>i32
            (ref.extern $Number.parseInt)
            (null)
            (array $of<ext.i32>ext (this) i32(16))
        )
    )

    (func $call_to_string<i32>ext
        (param $number        i32)
        (result          <String>)
        (reflect $apply<ext.i32.ext>ext
            (ref.extern $Number:toString)
            (this)
            (array $of<i32>ext i32(16))
        )
    )

    (func $call_pad_start<ext>ext
        (param $string   <String>)
        (result          <String>)
        (reflect $apply<ext.ext.ext>ext
            (ref.extern $String:padStart)
            (this)
            (array $of<i32.i32>ext i32(2) i32(0))
        )
    )

    (func $get_i8a_uuid_value<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint8) (this) (array $of<i32.i32>ext (gget $offset.i8a) (true)))
    )

    (func $get_i16_uuid_value<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint16) (this) (array $of<i32.i32>ext (gget $offset.i16) (true)))
    )

    (func $get_i32_uuid_value<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint32) (this) (array $of<i32.i32>ext (gget $offset.i32) (true)))
    )

    (func $get_i64_uuid_value<ext>i64
        (param $dataView <DataView>)
        (result i64)
        (reflect $apply<ext.ext.ext>i64 (ref.extern $DataView:getBigUint64) (this) (array $of<i32.i32>ext (gget $offset.i64) (true)))
    )

    (func $get_i8b_uuid_value<ext>i32
        (param $dataView <DataView>)
        (result i32)
        (reflect $apply<ext.ext.ext>i32 (ref.extern $DataView:getUint8) (this) (array $of<i32.i32>ext (gget $offset.i8b) (true)))
    )

    (func $set_i8a_uuid_value<ext.i32>
        (param $dataView <DataView>)
        (param $value i32)
        (reflect $apply<ext.ext.ext> (ref.extern $DataView:setUint8) (this) (array $of<i32.i32.i32>ext (gget $offset.i8a) (lget $value) (true)))
    )

    (func $set_i16_uuid_value<ext.i32>
        (param $dataView <DataView>)
        (param $value i32)
        (reflect $apply<ext.ext.ext> (ref.extern $DataView:setUint16) (this) (array $of<i32.i32.i32>ext (gget $offset.i16) (lget $value) (true)))
    )

    (func $set_i32_uuid_value<ext.i32>
        (param $dataView <DataView>)
        (param $value i32)
        (reflect $apply<ext.ext.ext> (ref.extern $DataView:setUint32) (this) (array $of<i32.i32.i32>ext (gget $offset.i32) (lget $value) (true)))
    )

    (func $set_i64_uuid_value<ext.i64>
        (param $dataView <DataView>)
        (param $value i64)
        (reflect $apply<ext.ext.ext> (ref.extern $DataView:setBigUint64) (this) (array $of<i32.i64.i32>ext (gget $offset.i64) (lget $value) (true)))
    )

    (func $set_i8b_uuid_value<ext.i32>
        (param $dataView <DataView>)
        (param $value i32)
        (reflect $apply<ext.ext.ext> (ref.extern $DataView:setUint8) (this) (array $of<i32.i32.i32>ext (gget $offset.i8b) (lget $value) (true)))
    )

    (func $add
        (export "add")
        (param $UUIDv4 <String>)
        (result             i32)

        (local $value.idx   i32)
        (local $value.i8a   i32)
        (local $value.i16   i32)
        (local $value.i32   i32)
        (local $value.i64   i64)
        (local $value.i8b   i32)

        (local $begin.idx   i32)
        (local $begin.i8a   i32)
        (local $begin.i16   i32)
        (local $begin.i32   i32)
        (local $begin.i64   i32)
        (local $begin.i8b   i32)

        (lget $UUIDv4)
        (ltee $UUIDv4 (call $self.String<ext>ext))
        (ltee $UUIDv4 (call $replace_for_clean_str<ext>ext))
        (ltee $UUIDv4 (call $match_for_hex_array<ext>ext))
        (ltee $UUIDv4 (call $map_with_parse_int<ext>ext))
        (ltee $UUIDv4 (call $new_array_bufferFromIntArray<ext>ext))
        (lset $UUIDv4 (call $new_data_view<ext>ext))

        (lset $value.idx (call $add_used_uuid_count_1<>i32))
        (lset $value.i8a (call $get_i8a_uuid_value<ext>i32 (lget $UUIDv4)))
        (lset $value.i16 (call $get_i16_uuid_value<ext>i32 (lget $UUIDv4)))
        (lset $value.i32 (call $get_i32_uuid_value<ext>i32 (lget $UUIDv4)))
        (lset $value.i64 (call $get_i64_uuid_value<ext>i64 (lget $UUIDv4)))
        (lset $value.i8b (call $get_i8b_uuid_value<ext>i32 (lget $UUIDv4)))

        (lset $begin.idx (call $calc_idx_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i8a (call $calc_i8a_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i16 (call $calc_i16_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i32 (call $calc_i32_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i64 (call $calc_i64_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i8b (call $calc_i8b_uuid_begin<i32>i32 (lget $value.idx)))

        (call $set_idx_uuid_value<i32.i32> (lget $begin.idx) (lget $value.idx))
        (call $set_i8a_uuid_value<i32.i32> (lget $begin.i8a) (lget $value.i8a))
        (call $set_i16_uuid_value<i32.i32> (lget $begin.i16) (lget $value.i16))
        (call $set_i32_uuid_value<i32.i32> (lget $begin.i32) (lget $value.i32))
        (call $set_i64_uuid_value<i32.i64> (lget $begin.i64) (lget $value.i64))
        (call $set_i8b_uuid_value<i32.i32> (lget $begin.i8b) (lget $value.i8b))

        (lget $value.idx)
    )

    (func $new
        (export "new")
        (result i32)

        (local $value.idx   i32)
        (local $value.i8a   i32)
        (local $value.i16   i32)
        (local $value.i32   i32)
        (local $value.i64   i64)
        (local $value.i8b   i32)

        (local $begin.idx   i32)
        (local $begin.i8a   i32)
        (local $begin.i16   i32)
        (local $begin.i32   i32)
        (local $begin.i64   i32)
        (local $begin.i8b   i32)

        (lset $value.idx (call $add_used_uuid_count_1<>i32))
        (lset $value.i8a (call $random<>i32))
        (lset $value.i16 (call $random<>i32))
        (lset $value.i32 (call $random<>i32))
        (lset $value.i64 (call $random<>i64))
        (lset $value.i8b (call $random<>i32))

        (lset $begin.idx (call $calc_idx_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i8a (call $calc_i8a_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i16 (call $calc_i16_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i32 (call $calc_i32_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i64 (call $calc_i64_uuid_begin<i32>i32 (lget $value.idx)))
        (lset $begin.i8b (call $calc_i8b_uuid_begin<i32>i32 (lget $value.idx)))

        (call $set_idx_uuid_value<i32.i32> (lget $begin.idx) (lget $value.idx))
        (call $set_i8a_uuid_value<i32.i32> (lget $begin.i8a) (lget $value.i8a))
        (call $set_i16_uuid_value<i32.i32> (lget $begin.i16) (lget $value.i16))
        (call $set_i32_uuid_value<i32.i32> (lget $begin.i32) (lget $value.i32))
        (call $set_i64_uuid_value<i32.i64> (lget $begin.i64) (lget $value.i64))
        (call $set_i8b_uuid_value<i32.i32> (lget $begin.i8b) (lget $value.i8b))

        (lget $value.idx)
    )

    (func $get
        (export "get")
        (param $index i32)
        (result  <String>)

        (call $str_uuid_of_ui8array<ext>ext 
            (call $new_uint8_array<ext>ext 
                (call $get_uuid_buffer<i32>ext (this))
            )
        )
    )

    (func $log
        (export "log")
        (param $index                  i32)
        (local $buffer       <ArrayBuffer>)
        (local $dataView        <DataView>)
        (local $uInt8Array    <Uint8Array>)
        (local $strUUIDv4         <String>)

        (if (i32.eqz (lget $index))
            (then (call $log_base) return)
        )

        (lset $buffer       (call $get_uuid_buffer<i32>ext       (lget $index)))
        (lset $dataView     (call $new_data_view<ext>ext         (lget $buffer)))
        (lset $uInt8Array   (call $new_uint8_array<ext>ext       (lget $buffer)))
        (lset $strUUIDv4    (call $str_uuid_of_ui8array<ext>ext  (lget $uInt8Array)))

        (console $table<ext>
            (array $of<ext>ext
                (object $fromEntries<ext>ext
                    (array $of<ext.ext.ext.ext.ext.ext>ext
                        (array $of<ext.i32>ext (text "idx") (lget $index))
                        (array $of<ext.i32>ext (text "i8a") (call $get_i8a_uuid_value<ext>i32 (lget $dataView)))
                        (array $of<ext.i32>ext (text "i16") (call $get_i16_uuid_value<ext>i32 (lget $dataView)))
                        (array $of<ext.i32>ext (text "i32") (call $get_i32_uuid_value<ext>i32 (lget $dataView)))
                        (array $of<ext.i64>ext (text "i64") (call $get_i64_uuid_value<ext>i64 (lget $dataView)))
                        (array $of<ext.i32>ext (text "i8b") (call $get_i8b_uuid_value<ext>i32 (lget $dataView)))
                    )
                )
            )
        )

        (console $table<ext>
            (object $fromEntries<ext>ext
                (array $of<ext.ext.ext.ext>ext
                    (array $of<ext.ext>ext (text "buffer")     (array $of<ext>ext (lget $buffer)))
                    (array $of<ext.ext>ext (text "dataView")   (array $of<ext>ext (lget $dataView)))
                    (array $of<ext.ext>ext (text "uInt8Array") (array $of<ext>ext (lget $uInt8Array)))
                    (array $of<ext.ext>ext (text "string")     (array $of<ext>ext (lget $strUUIDv4)))
                )
            )
        )
    )

    (func $log_base
        (console $log<ext.i32> (text "size_length")         (call $get_size_length<>i32))
        (console $log<ext.i32> (text "usable_length")       (call $get_usable_length<>i32))
        (console $log<ext.i32> (text "max_uuid_count")      (call $get_max_uuid_count<>i32))
        (console $log<ext.i32> (text "inert_uuid_count")    (call $get_inert_uuid_count<>i32))
        (console $log<ext.i32> (text "usable_uuid_count")   (call $get_usable_uuid_count<>i32))
        (console $log<ext.i32> (text "usable_block_count")  (call $get_usable_block_count<>i32))

        (console $log<ext.i32> (text "idx_blocks_length")   (call $get_idx_blocks_length<>i32))
        (console $log<ext.i32> (text "i8a_blocks_length")   (call $get_i8a_blocks_length<>i32))
        (console $log<ext.i32> (text "i16_blocks_length")   (call $get_i16_blocks_length<>i32))
        (console $log<ext.i32> (text "i32_blocks_length")   (call $get_i32_blocks_length<>i32))
        (console $log<ext.i32> (text "i64_blocks_length")   (call $get_i64_blocks_length<>i32))
        (console $log<ext.i32> (text "i8b_blocks_length")   (call $get_i8b_blocks_length<>i32))

        (console $log<ext.i32> (text "idx_blocks_begin")    (call $get_idx_blocks_begin<>i32))
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
)