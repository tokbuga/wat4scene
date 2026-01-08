(module
    (memory $base 1 1 shared)
    (memory $i8a  1 65535 shared)
    (memory $i16  2 65535 shared)
    (memory $i32  4 65535 shared)
    (memory $i64  8 65535 shared)
    (memory $i8b  1 65535 shared)
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

    (export "add"           (func $add))
    (export "find"          (func $find))

    (global $OFFSET_UUID_COUNT i32 (i32.const 4))
    (global $OFFSET_BLOCK_COUNT i32 (i32.const 8))

    (global $ARGUMENTS_REGEXP_CLEAR_STR mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I8A mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I8B mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I16 mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I32 mut ext)
    (global $ARGUMENTS_REGEXP_MATCH_I64 mut ext)

    (func $setUint8     (param i32) (param i32)  (i32.store8   $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setUint16    (param i32) (param i32)  (i32.store16  $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setUint32    (param i32) (param i32)  (i32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setBigUint64 (param i32) (param i64)  (i64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setInt8      (param i32) (param i32)  (i32.store8   $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setInt16     (param i32) (param i32)  (i32.store16  $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setInt32     (param i32) (param i32)  (i32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setBigInt64  (param i32) (param i64)  (i64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setFloat32   (param i32) (param f32)  (f32.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))
    (func $setFloat64   (param i32) (param f64)  (f64.store    $val (i32.mul (i32.const 16) (local.get 0)) (local.get 1)))

    (func $getUint8     (param i32) (result i32) (i32.load8_u  $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getUint16    (param i32) (result i32) (i32.load16_u $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getUint32    (param i32) (result i32) (i32.load     $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getBigUint64 (param i32) (result i64) (i64.load     $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getInt8      (param i32) (result i32) (i32.load8_s  $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getInt16     (param i32) (result i32) (i32.load16_s $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getInt32     (param i32) (result i32) (i32.load     $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getBigInt64  (param i32) (result i64) (i64.load     $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getFloat32   (param i32) (result f32) (f32.load     $val (i32.mul (i32.const 16) (local.get 0))))
    (func $getFloat64   (param i32) (result f64) (f64.load     $val (i32.mul (i32.const 16) (local.get 0))))

    (func $add
        (param $string externref)
        (result i32)
        (local $index i32)

        (call $set_vector 
            (call $parse_vector (local.get $string)) 
            (local.tee $index (call $next_index))
        )

        (local.get $index)
    )

    (func $find
        (param $string externref)
        (result i32)
        (call $find_vector (call $parse_vector (local.get $string)))
    )

    (func $main
        (i32.atomic.store (global.get $OFFSET_UUID_COUNT) (i32.const 1))
        (i32.atomic.store (global.get $OFFSET_BLOCK_COUNT) (i32.const 1))

        (global.set $ARGUMENTS_REGEXP_CLEAR_STR (call $regexp_args (text "[^a-f0-9]") (string)))
        (global.set $ARGUMENTS_REGEXP_MATCH_I8A (call $regexp_args (text "(?:[a-f0-9]{0})([a-f0-9]{2})(?:[a-f0-9]{30})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I8B (call $regexp_args (text "(?:[a-f0-9]{2})([a-f0-9]{2})(?:[a-f0-9]{28})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I16 (call $regexp_args (text "(?:[a-f0-9]{4})([a-f0-9]{4})(?:[a-f0-9]{24})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I32 (call $regexp_args (text "(?:[a-f0-9]{8})([a-f0-9]{8})(?:[a-f0-9]{16})") (text "0x$1")))
        (global.set $ARGUMENTS_REGEXP_MATCH_I64 (call $regexp_args (text "(?:[a-f0-9]{16})([a-f0-9]{16})([a-f0-9]{0}?)") (text "0x$1")))
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
        
        (if (i32.rem_u (local.get $uuid.index) (i32.const 16)) 
            (then (i32.atomic.rmw.add (global.get $OFFSET_BLOCK_COUNT) (i32.const 1)) 
            (drop))
        )
    )

    (func $set_vector
        (param $vector v128)
        (param $index i32)
    
        (local $offset.i8x16  i32)
        (local $offset.i16x8  i32)
        (local $offset.i32x4  i32)
        (local $offset.i64x2  i32)

        (local.set $offset.i8x16 (i32.mul (local.get $index) (i32.const 1)))
        (local.set $offset.i16x8 (i32.mul (local.get $index) (i32.const 2)))
        (local.set $offset.i32x4 (i32.mul (local.get $index) (i32.const 4)))
        (local.set $offset.i64x2 (i32.mul (local.get $index) (i32.const 8)))

        (i32.store8  $i8a (local.get $offset.i8x16) (i8x16.extract_lane_u 1 (local.get 0))) 
        (i32.store16 $i16 (local.get $offset.i16x8) (i16x8.extract_lane_u 1 (local.get 0))) 
        (i32.store   $i32 (local.get $offset.i32x4) (i32x4.extract_lane   1 (local.get 0))) 
        (i64.store   $i64 (local.get $offset.i64x2) (i64x2.extract_lane   1 (local.get 0))) 
        (i32.store8  $i8b (local.get $offset.i8x16) (i8x16.extract_lane_u 0 (local.get 0))) 
    )

    (func $find_vector
        (param $vector v128)
        (result i32)

        (local $i8a.splat    v128)
        (local $i16.splat    v128)
        (local $i32.splat    v128)
        (local $i64.splat    v128)
        (local $i8b.value     i32)

        (local $offset.i8x16  i32)
        (local $offset.i16x8  i32)
        (local $offset.i32x4  i32)
        (local $offset.i64x2  i32)
        
        (local $blocks.index  i32)
        (local $blocks.count  i32)

        (local.set $i8a.splat (i8x16.splat (i8x16.extract_lane_u 1 (local.get 0))))
        (local.set $i16.splat (i16x8.splat (i16x8.extract_lane_u 1 (local.get 0))))
        (local.set $i32.splat (i32x4.splat (i32x4.extract_lane   1 (local.get 0))))
        (local.set $i64.splat (i64x2.splat (i64x2.extract_lane   1 (local.get 0))))
        (local.set $i8b.value (i8x16.extract_lane_u 0 (local.get 0)))

        (local.set $blocks.count (i32.const 1))

        (loop $blocks
            (if (local.get $blocks.count)
                (then
                
                    (local.set $offset.i8x16 (i32.mul (local.get $blocks.index) (i32.const  16)))
                    (local.set $offset.i16x8 (i32.mul (local.get $blocks.index) (i32.const  32)))
                    (local.set $offset.i32x4 (i32.mul (local.get $blocks.index) (i32.const  64)))
                    (local.set $offset.i64x2 (i32.mul (local.get $blocks.index) (i32.const 128)))
                    (local.set $blocks.index (i32.add (local.get $blocks.index) (i32.const   1)))
                    (local.set $blocks.count (i32.sub (local.get $blocks.index) (i32.const   1)))
                
                    (br_if $blocks (v128.any_true (i8x16.ne (local.get $i8a.splat) (v128.load $i8a offset=0 (local.get $offset.i8x16)))))

                    (if (v128.any_true (i16x8.eq (local.get $i16.splat) (v128.load $i16 offset=0 (local.get $offset.i16x8))))
                        (then
                            (if (v128.any_true (i32x4.eq (local.get $i32.splat) (v128.load $i32 offset=0 (local.get $offset.i32x4))))
                                (then
                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=0 (local.get $offset.i64x2))))
                                        (then
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=0 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 0))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=1 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 1))))
                                            )
                                        )
                                    )
                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=16 (local.get $offset.i64x2))))
                                        (then
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=2 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 2))))
                                            )
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=3 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 3))))
                                            )
                                        )
                                    )
                                )
                            )
                            (if (v128.any_true (i32x4.eq (local.get $i32.splat) (v128.load $i32 offset=16 (local.get $offset.i32x4))))
                                (then
                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=32 (local.get $offset.i64x2))))
                                        (then
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=4 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 4))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=5 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 5))))
                                            )
                                        )
                                    )
                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=48 (local.get $offset.i64x2))))
                                        (then
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=6 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 6))))
                                            )
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=7 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 7))))
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )

                    (if (v128.any_true (i16x8.eq (local.get $i16.splat) (v128.load $i16 offset=16 (local.get $offset.i16x8))))
                        (then
                        
                            (if (v128.any_true (i32x4.eq (local.get $i32.splat) (v128.load $i32 offset=32 (local.get $offset.i32x4))))
                                (then

                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=64 (local.get $offset.i64x2))))
                                        (then

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=8 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 8))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=9 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 9))))
                                            )

                                        )
                                    )

                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=80 (local.get $offset.i64x2))))
                                        (then
                                            
                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=10 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 10))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=11 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 11))))
                                            )

                                        )
                                    )
                                )
                            )

                            (if (v128.any_true (i32x4.eq (local.get $i32.splat) (v128.load $i32 offset=48 (local.get $offset.i32x4))))
                                (then

                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=96 (local.get $offset.i64x2))))
                                        (then

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=12 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 12))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=13 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 13))))
                                            )
                                        )
                                    )

                                    (if (v128.any_true (i64x2.eq (local.get $i64.splat) (v128.load $i64 offset=112 (local.get $offset.i64x2))))
                                        (then

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=14 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 14))))
                                            )

                                            (if (i32.eq (local.get $i8b.value) (i32.load8_u $i8b offset=15 (local.get $offset.i8x16)))
                                                (then (return (i32.add (local.get $offset.i8x16) (i32.const 15))))
                                            )

                                        )
                                    )
                                )
                            )
                        )
                    )

                    (br $blocks)
                )
            )
        )

        (i32.const 0)
    )

    (start $main)
)