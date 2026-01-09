(module
    (memory $base 1 1 shared)
    (memory $i8a  1 65535 shared)
    (memory $i8b  1 65535 shared)
    (memory $i16  2 65535 shared)
    (memory $i32  4 65535 shared)
    (memory $i64  8 65535 shared)
    (memory $idx  4 65535 shared)
    (memory $val 16 65535 shared)

    (export "setUint8"      (func $setUint8))
    (export "setUint16"     (func $setUint16))
    (export "setUint32"     (func $setUint32))
    (export "setBigUint64"  (func $setBigUint64))
    (export "setInt8"       (func $setInt8))
    (export "setInt16"      (func $setInt16))
    (export "setInt32"      (func $setInt32))
    (export "setBigInt64"   (func $setBigInt64))
    (export "setFloat32"    (func $setFloat32))
    (export "setFloat64"    (func $setFloat64))

    (export "getUint8"      (func $getUint8))
    (export "getUint16"     (func $getUint16))
    (export "getUint32"     (func $getUint32))
    (export "getBigUint64"  (func $getBigUint64))
    (export "getInt8"       (func $getInt8))
    (export "getInt16"      (func $getInt16))
    (export "getInt32"      (func $getInt32))
    (export "getBigInt64"   (func $getBigInt64))
    (export "getFloat32"    (func $getFloat32))
    (export "getFloat64"    (func $getFloat64))

    (export "newUint8"      (func $newUint8))
    (export "newUint16"     (func $newUint16))
    (export "newUint32"     (func $newUint32))
    (export "newBigUint64"  (func $newBigUint64))
    (export "newInt8"       (func $newInt8))
    (export "newInt16"      (func $newInt16))
    (export "newInt32"      (func $newInt32))
    (export "newBigInt64"   (func $newBigInt64))
    (export "newFloat32"    (func $newFloat32))
    (export "newFloat64"    (func $newFloat64))

    (export "indexOf"       (func $indexOf))
    (export "toString"      (func $toString))
    (export "count"         (func $count))

    (global $OFFSET_UUID_COUNT   i32 (i32.const 36))
    (global $OFFSET_BLOCK_COUNT  i32 (i32.const 44))
    (global $OFFSET_SEARCH_VALUE i32 (i32.const 48))
    (global $OFFSET_RANDOM_UUID  i32 (i32.const 64))

    (global $ARGUMENTS_REGEXP_CLEAR_STR mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I8A mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I8B mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I16 mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I32 mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I64 mut ext)
    (global $ARGUMENTS_REGEXP_TO_STRING mut ext)

    (func $setUint8     (param i32) (param i32)  (if (local.get 0) (then (return (i32.store8   $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setUint16    (param i32) (param i32)  (if (local.get 0) (then (return (i32.store16  $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setUint32    (param i32) (param i32)  (if (local.get 0) (then (return (i32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setBigUint64 (param i32) (param i64)  (if (local.get 0) (then (return (i64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setInt8      (param i32) (param i32)  (if (local.get 0) (then (return (i32.store8   $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setInt16     (param i32) (param i32)  (if (local.get 0) (then (return (i32.store16  $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setInt32     (param i32) (param i32)  (if (local.get 0) (then (return (i32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setBigInt64  (param i32) (param i64)  (if (local.get 0) (then (return (i64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setFloat32   (param i32) (param f32)  (if (local.get 0) (then (return (f32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))
    (func $setFloat64   (param i32) (param f64)  (if (local.get 0) (then (return (f64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1))))) (unreachable))

    (func $getUint8     (param i32) (result i32) (if (local.get 0) (then (return (i32.load8_u  $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getUint16    (param i32) (result i32) (if (local.get 0) (then (return (i32.load16_u $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getUint32    (param i32) (result i32) (if (local.get 0) (then (return (i32.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getBigUint64 (param i32) (result i64) (if (local.get 0) (then (return (i64.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (i64.const 0))
    (func $getInt8      (param i32) (result i32) (if (local.get 0) (then (return (i32.load8_s  $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getInt16     (param i32) (result i32) (if (local.get 0) (then (return (i32.load16_s $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getInt32     (param i32) (result i32) (if (local.get 0) (then (return (i32.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (i32.const 0))
    (func $getBigInt64  (param i32) (result i64) (if (local.get 0) (then (return (i64.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (i64.const 0))
    (func $getFloat32   (param i32) (result f32) (if (local.get 0) (then (return (f32.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (f32.const nan))
    (func $getFloat64   (param i32) (result f64) (if (local.get 0) (then (return (f64.load     $val (i32.mul (i32.const 16) (local.get 0)))))) (f64.const nan))

    (func $newUint8     (param i32) (result i32) (local i32) (i32.store8   $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newUint16    (param i32) (result i32) (local i32) (i32.store16  $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newUint32    (param i32) (result i32) (local i32) (i32.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newBigUint64 (param i64) (result i32) (local i32) (i64.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newInt8      (param i32) (result i32) (local i32) (i32.store8   $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newInt16     (param i32) (result i32) (local i32) (i32.store16  $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newInt32     (param i32) (result i32) (local i32) (i32.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newBigInt64  (param i64) (result i32) (local i32) (i64.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newFloat32   (param f32) (result i32) (local i32) (f32.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))
    (func $newFloat64   (param f64) (result i32) (local i32) (f64.store    $val (i32.mul (i32.const 16) (local.tee 1 (call $new_random_index))) (local.get 0)) (local.get 1))

    (func $randomUUID
        (result v128)
        (f64.store $base offset=0 (global.get $OFFSET_RANDOM_UUID) (call $self.Math.random<>f64))
        (f64.store $base offset=8 (global.get $OFFSET_RANDOM_UUID) (call $self.Math.random<>f64))
        (v128.load $base offset=0 (global.get $OFFSET_RANDOM_UUID))
    )

    (func $get_vector_index
        (param $vector v128)
        (result i32)

        (i32.store8  $base offset=0 (global.get $OFFSET_SEARCH_VALUE) (i8x16.extract_lane_u 0 (local.get $vector)))
        (i32.store8  $base offset=1 (global.get $OFFSET_SEARCH_VALUE) (i8x16.extract_lane_u 1 (local.get $vector)))
        (i32.store16 $base offset=2 (global.get $OFFSET_SEARCH_VALUE) (i16x8.extract_lane_u 1 (local.get $vector)))
        (i32.store   $base offset=4 (global.get $OFFSET_SEARCH_VALUE) (i32x4.extract_lane   1 (local.get $vector)))
        (i64.store   $base offset=8 (global.get $OFFSET_SEARCH_VALUE) (i64x2.extract_lane   1 (local.get $vector)))

        (call $find)
    )

    (func $new_random_index
        (result i32)
        (call $new_vector_index (call $randomUUID))
    )

    (func $new_vector_index
        (param $vector v128)
        (result i32)
        (local $index i32)
        (call $set_vector_index (local.get $vector) (local.tee $index (call $next_index)))
        (local.get $index)
    )

    (func $set_vector_index
        (param $vector v128)
        (param $index   i32)
    
        (local $offset.i8x16 i32)
        (local $offset.i16x8 i32)
        (local $offset.i32x4 i32)
        (local $offset.i64x2 i32)

        (local.set $offset.i8x16 (local.get $index))
        (local.set $offset.i16x8 (i32.mul (local.get $index) (i32.const 2)))
        (local.set $offset.i32x4 (i32.mul (local.get $index) (i32.const 4)))
        (local.set $offset.i64x2 (i32.mul (local.get $index) (i32.const 8)))

        (i32.store8  $i8a (local.get $offset.i8x16) (i8x16.extract_lane_u 0 (local.get 0))) 
        (i32.store8  $i8b (local.get $offset.i8x16) (i8x16.extract_lane_u 1 (local.get 0))) 
        (i32.store16 $i16 (local.get $offset.i16x8) (i16x8.extract_lane_u 1 (local.get 0))) 
        (i32.store   $i32 (local.get $offset.i32x4) (i32x4.extract_lane   1 (local.get 0))) 
        (i64.store   $i64 (local.get $offset.i64x2) (i64x2.extract_lane   1 (local.get 0))) 
    )

    (func $count
        (result i32)
        (i32.sub (i32.load (global.get $OFFSET_UUID_COUNT)) (i32.const 1))
    )

    (func $indexOf
        (param $string externref)
        (result i32)
        (call $get_vector_index (call $parse_vector (local.get $string)))
    )

    (func $toString
        (param $index i32)
        (result externref)
        (local $offsets v128)
        
        (local.set $offsets 
            (i32x4.mul 
                (v128.const i32x4 1 2 4 8) 
                (i32x4.splat (local.get $index))
            )
        )

        (call $apply_regexp
            (call $join_array<ext>ext
                (array $of<ext.ext.ext.ext.ext>ext
                    (call $to_string<i32.i32>ext (i32.load8_u  $i8a (i32x4.extract_lane 0 (local.get $offsets))) (i32.const 2))
                    (call $to_string<i32.i32>ext (i32.load8_u  $i8b (i32x4.extract_lane 0 (local.get $offsets))) (i32.const 2))
                    (call $to_string<i32.i32>ext (i32.load16_u $i16 (i32x4.extract_lane 1 (local.get $offsets))) (i32.const 4))
                    (call $to_string<i32.i32>ext (i32.load     $i32 (i32x4.extract_lane 2 (local.get $offsets))) (i32.const 8))
                    (call $to_string<i32.i64>ext (i64.load     $i64 (i32x4.extract_lane 3 (local.get $offsets))) (i32.const 16))
                )
            )
            (global.get $ARGUMENTS_REGEXP_TO_STRING)
        )
    )

    (func $pad_start<ext.i32>ext
        (param $string externref)
        (param $padding i32)
        (result externref)
        
        (reflect $apply<ext.ext.ext>ext 
            (ref.extern $String:padStart) 
            (local.get $string) 
            (array $of<i32.i32>ext 
                (local.get $padding) 
                (i32.const 0)
            )
        )
    )

    (func $join_array<ext>ext
        (param $array externref)
        (result externref)
        (reflect $apply<ext.ext.ext>ext 
            (ref.extern $Array:join) 
            (local.get $array) 
            (array $of<ext>ext (string))
        )
    )

    (func $to_string<i32.i32>ext
        (param $number i32)
        (param $padding i32)
        (result externref)
        (call $pad_start<ext.i32>ext (reflect $apply<ext.i32.ext>ext (ref.extern $Number:toString) (local.get 0) (array $of<i32>ext (i32.const 16))) (local.get 1))
    )

    (func $to_string<i32.i64>ext
        (param $bigint i64)
        (param $padding i32)
        (result externref)
        (call $pad_start<ext.i32>ext (reflect $apply<ext.i64.ext>ext (ref.extern $BigInt:toString) (local.get 0) (array $of<i32>ext (i32.const 16))) (local.get 1))
    )

    (func $main
        (i32.store (global.get $OFFSET_UUID_COUNT) (i32.const 1))
        (i32.store (global.get $OFFSET_BLOCK_COUNT) (i32.const 1))

        (global.set $ARGUMENTS_REGEXP_CLEAR_STR (call $regexp_args (text "[^a-f0-9]") (string)))
        (global.set $ARGUMENTS_REGEXP_MATCH_I8A (call $regexp_args (text "(?:[a-f0-9]{0})([a-f0-9]{2})(?:[a-f0-9]{30})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I8B (call $regexp_args (text "(?:[a-f0-9]{2})([a-f0-9]{2})(?:[a-f0-9]{28})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I16 (call $regexp_args (text "(?:[a-f0-9]{4})([a-f0-9]{4})(?:[a-f0-9]{24})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I32 (call $regexp_args (text "(?:[a-f0-9]{8})([a-f0-9]{8})(?:[a-f0-9]{16})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I64 (call $regexp_args (text "(?:[a-f0-9]{16})([a-f0-9]{16})([a-f0-9]{0}?)") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_TO_STRING (call $regexp_args (text "^([a-f0-9]{8})([a-f0-9]{4})([a-f0-9]{4})([a-f0-9]{4})([a-f0-9]{12})$") (text "$1-$2-$3-$4-$5")))
    )

    (func $regexp_args
        (param $expression externref)
        (param $replaceWith externref)
        (result externref)
        (array $of<ext.ext>ext 
            (reflect $construct<ext.ext>ext 
                (ref.extern $RegExp) 
                (array $of<ext.ext>ext 
                    (local.get $expression) 
                    (text "gi")
                )
            )
            (local.get $replaceWith)
        )
    )

    (func $apply_regexp
        (param $string externref)
        (param $expargs externref)
        (result externref)
        (reflect $apply<ext.ext.ext>ext 
            (ref.extern $String:replace) 
            (local.get $string) 
            (local.get $expargs)
        )
    )

    (func $parse_bigint
        (param $string externref)
        (param $expargs externref)
        (result i64)
        (call $self.BigInt<ext>i64 (call $apply_regexp (local.get $string) (local.get $expargs)))
    )

    (func $parse_number
        (param $string externref)
        (param $expargs externref)
        (result i32)
        (call $self.Number<ext>i32 (call $apply_regexp (local.get $string) (local.get $expargs)))
    )

    (func $parse_vector
        (param $string externref)
        (result v128)
        (local $vector v128)

        (local.set $string (call $apply_regexp (local.get $string) (global.get $ARGUMENTS_REGEXP_CLEAR_STR)))
        
        (local.get $vector)
        (local.tee $vector (i8x16.replace_lane 0 (call $parse_number (local.get $string) (global.get $ARGUMENTS_REGEXP_MATCH_I8A))))
        (local.tee $vector (i8x16.replace_lane 1 (call $parse_number (local.get $string) (global.get $ARGUMENTS_REGEXP_MATCH_I8B))))
        (local.tee $vector (i16x8.replace_lane 1 (call $parse_number (local.get $string) (global.get $ARGUMENTS_REGEXP_MATCH_I16))))
        (local.tee $vector (i32x4.replace_lane 1 (call $parse_number (local.get $string) (global.get $ARGUMENTS_REGEXP_MATCH_I32))))
        (local.tee $vector (i64x2.replace_lane 1 (call $parse_bigint (local.get $string) (global.get $ARGUMENTS_REGEXP_MATCH_I64))))
    )

    (func $next_index
        (result i32)
        (local $uuid.index i32)
        (local.tee $uuid.index (i32.atomic.rmw.add (global.get $OFFSET_UUID_COUNT) (i32.const 1)))
        
        (if (i32.eqz (i32.rem_u (local.get $uuid.index) (i32.const 16)))
            (then (i32.atomic.rmw.add (global.get $OFFSET_BLOCK_COUNT) (i32.const 1)) 
            (drop))
        )
    )

    (func $find
        (result i32)

        (local $i8a.value     i32)
        (local $i8b.splat    v128)
        (local $i16.splat    v128)
        (local $i32.splat    v128)
        (local $i64.splat    v128)

        (local $offset.i8x16  i32)
        (local $offset.i16x8  i32)
        (local $offset.i32x4  i32)
        (local $offset.i64x2  i32)
        
        (local $blocks.index  i32)
        (local $blocks.count  i32)

        (local.set $i8a.value (i32.load8_u       $base offset=0 (global.get $OFFSET_SEARCH_VALUE)))
        (local.set $i8b.splat (v128.load8_splat  $base offset=1 (global.get $OFFSET_SEARCH_VALUE)))
        (local.set $i16.splat (v128.load16_splat $base offset=2 (global.get $OFFSET_SEARCH_VALUE)))
        (local.set $i32.splat (v128.load32_splat $base offset=4 (global.get $OFFSET_SEARCH_VALUE)))
        (local.set $i64.splat (v128.load64_splat $base offset=8 (global.get $OFFSET_SEARCH_VALUE)))

        (local.set $blocks.index (i32.const 0))
        (local.set $blocks.count (i32.load $base (global.get $OFFSET_BLOCK_COUNT)))

        (loop $blocks
            (if (local.get $blocks.count)
                (then
                    (local.set $offset.i8x16 (i32.mul (local.get $blocks.index) (i32.const  16)))
                    (local.set $offset.i16x8 (i32.mul (local.get $blocks.index) (i32.const  32)))
                    (local.set $offset.i32x4 (i32.mul (local.get $blocks.index) (i32.const  64)))
                    (local.set $offset.i64x2 (i32.mul (local.get $blocks.index) (i32.const 128)))

                    (local.set $blocks.index (i32.add (local.get $blocks.index) (i32.const 1))) 
                    (local.set $blocks.count (i32.sub (local.get $blocks.count) (i32.const 1)))
                
                    (br_if $blocks (i8x16.all_true (i8x16.ne (local.get $i8b.splat) (v128.load $i8b offset=0 (local.get $offset.i8x16)))))

                    (if (v128.any_true (v128.xor (local.get $i16.splat) (v128.load $i16 offset=0 (local.get $offset.i16x8))))(then
                    (if (v128.any_true (v128.xor (local.get $i32.splat) (v128.load $i32 offset=0 (local.get $offset.i32x4))))(then
                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=0 (local.get $offset.i64x2))))(then
                        (if (i32.eq (i32.load8_u $i8a offset=0 (local.get $offset.i8x16)) (local.get $i8a.value))(then 
                            (return (i32.add (local.get $offset.i8x16) (i32.const 0)))))
                        (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=1 (local.get $offset.i8x16)))(then 
                            (return (i32.add (local.get $offset.i8x16) (i32.const 1)))))))

                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=16 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=2 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 2)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=3 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 3)))))))))

                    (if (v128.any_true (v128.xor (local.get $i32.splat) (v128.load $i32 offset=16 (local.get $offset.i32x4))))(then
                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=32 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=4 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 4)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=5 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 5)))))))

                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=48 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=6 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 6)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=7 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 7)))))))))))

                    (if (v128.any_true (v128.xor (local.get $i16.splat) (v128.load $i16 offset=16 (local.get $offset.i16x8))))(then
                    (if (v128.any_true (v128.xor (local.get $i32.splat) (v128.load $i32 offset=32 (local.get $offset.i32x4))))(then
                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=64 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=8 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 8)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=9 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 9)))))))

                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=80 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=10 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 10)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=11 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 11)))))))))

                    (if (v128.any_true (v128.xor (local.get $i32.splat) (v128.load $i32 offset=48 (local.get $offset.i32x4))))(then
                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=96 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=12 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 12)))))
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=13 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 13)))))))

                    (if (v128.any_true (v128.xor (local.get $i64.splat) (v128.load $i64 offset=112 (local.get $offset.i64x2))))(then
                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=14 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 14)))))

                            (if (i32.eq (local.get $i8a.value) (i32.load8_u $i8a offset=15 (local.get $offset.i8x16)))(then 
                                (return (i32.add (local.get $offset.i8x16) (i32.const 15)))))))))))

                    (br $blocks)
                )
            )
        )

        (i32.const 0)
    )

    (start $main)
)