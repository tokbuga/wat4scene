(module
    (import "self" "memory" (memory $base 10 65535 shared))

    (; 
        uuid                                label    begin    end     hex                   loader                      constant
        389e9dc1770e48e8b01a14031b5e3ec3            
        --                                  i8a      0        1       38                    load8_splat  offset=0       i8x16.splat 0x38
          ----                              i16      1        3       9e9d                  load16_splat offset=1       i16x8.splat 0x9e9d
              --------                      i32      3        7       c1770e48              load32_splat offset=3       i32x4.splat 0xc1770e48
                      ----------------      i64      7        15      e8b01a14031b5e3e      load64_splat offset=7       i64x2.splat 0xe8b01a14031b5e3e
                                      --    i8b      15       16      c3                    load8_u      offset=15      0xc3                                
    ;)

    (func $load_i8a_splat (param $begin i32) (v128.load8_splat  offset=0  (local.get 0)))
    (func $load_i16_splat (param $begin i32) (v128.load16_splat offset=1  (local.get 0)))
    (func $load_i32_splat (param $begin i32) (v128.load32_splat offset=3  (local.get 0)))
    (func $load_i64_splat (param $begin i32) (v128.load64_splat offset=7  (local.get 0)))
    (func $load_i8b       (param $begin i32) (i32.load8_u       offset=15 (local.get 0)))

    (func $find
        (export "find")
        (param $uuid_vector_begin_offset i32)
        (result              i32)

        (local $value.i8a    i32)
        (local $value.i16    i32)
        (local $value.i32    i32)
        (local $value.i64    i32)
        (local $value.i8b    i32)

        (local $count.blocks i32)

        (local $offset.splat i32)
        (local $offset.block i32)

        (local $i8a_blocks_begin i32)
        (local $i16_blocks_begin i32)
        (local $i32_blocks_begin i32)
        (local $i64_blocks_begin i32)
        (local $i8b_blocks_begin i32)

        (local $vector.splat8  v128)
        (local $vector.splat16 v128)
        (local $vector.splat32 v128)
        (local $vector.splat64 v128)
        (local $scalar.i8b i32)

        (local $vector.block8  v128)
        (local $vector.block16a v128)
        (local $vector.block16b v128)
        (local $vector.block32 v128)
        (local $vector.block64 v128)

        (local.set $count.blocks (call $get_used_block_count<>i32))
        (local.set $offset.block (i32.mul (local.get $count.blocks) (i32.const 16)))
        (local.set $offset.splat (local.get $uuid_vector_begin_offset))
        
        (local.set $i8a_blocks_begin (call $get_i8a_blocks_begin<>i32))
        (local.set $i16_blocks_begin (call $get_i16_blocks_begin<>i32))
        (local.set $i32_blocks_begin (call $get_i32_blocks_begin<>i32))
        (local.set $i64_blocks_begin (call $get_i64_blocks_begin<>i32))
        (local.set $i8b_blocks_begin (call $get_i8b_blocks_begin<>i32))

        (local.set $vector.splat8  (call $load_i8a_splat (local.get $uuid_vector_begin_offset)))
        (local.set $vector.splat16 (call $load_i16_splat (local.get $uuid_vector_begin_offset)))
        (local.set $vector.splat32 (call $load_i32_splat (local.get $uuid_vector_begin_offset)))
        (local.set $vector.splat64 (call $load_i64_splat (local.get $uuid_vector_begin_offset)))
        (local.set $scalar.i8b     (call $load_i8b (local.get $uuid_vector_begin_offset)))

        (if (local.get $count.blocks)
            (then
                (loop $blocks
                    (local.set $count.blocks (i32.sub (local.get $count.blocks) (i32.const 1)))
                    (local.set $offset.block (i32.sub (local.get $offset.block) (i32.const 16)))

                    (; check splatted vector and loaded vector has any equality ;)

                    ;; index8   = 0
                    ;; index16  = 0
                    ;; index32  = 0
                    ;; index64  = 0
                    ;;
                    ;; offset8  = 0
                    ;; offset16 = 0
                    ;; offset32 = 0
                    ;; offset64 = 0
                    ;; ---------
                    ;; offset   = 0
                    (if (v128.any_true (i8x16.eq (local.get $vector.splat8) (v128.load offset=0 (i32.add (local.get $offset.block) (local.get $i8a_blocks_begin)))))
                        (then
                            ;; index8   = 0-8
                            ;; index16  = 0-4
                            ;; index32  = 0-2
                            ;; index64  = 0-1
                            ;;
                            ;; offset8  = 0
                            ;; offset16 = 0
                            ;; offset32 = 0
                            ;; offset64 = 0
                            ;; ---------
                            ;; offset   = 0
                            (if (v128.any_true (i16x8.eq (local.get $vector.splat16) (v128.load offset=0 (i32.add (local.get $offset.block) (local.get $i16_blocks_begin)))))
                                (then

                                    (if (v128.any_true (i32x4.eq (local.get $vector.splat32) (v128.load offset=0 (i32.add (local.get $offset.block) (local.get $i32_blocks_begin)))))
                                        (then

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=0 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=0 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=16 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=1 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )

                                    (if (v128.any_true (i32x4.eq (local.get $vector.splat32) (v128.load offset=16 (i32.add (local.get $offset.block) (local.get $i32_blocks_begin)))))
                                        (then

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=32 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=0 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=48 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=1 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                            ;; index8   = 8-16
                            ;; index16  = 4-8
                            ;; index32  = 2-4
                            ;; index64  = 1-2
                            ;;
                            ;; offset8  = 8  (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 16 i8 element means, 0 blocks past x 16 bytes per block)
                            ;; offset16 = 16 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 8 i16 element means, 1 blocks past x 16 bytes per block)
                            ;; offset32 = 32 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 4 i32 element means, 2 blocks past x 16 bytes per block)
                            ;; offset64 = 64 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 2 i64 element means, 4 blocks past x 16 bytes per block)
                            ;; ---------
                            ;; offset   = 0
                            (if (v128.any_true (i16x8.eq (local.get $vector.splat16) (v128.load offset=16 (i32.add (local.get $offset.block) (local.get $i16_blocks_begin)))))
                                (then

                                    ;; index8   = 8-12
                                    ;;
                                    ;; offset8  = 8  (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 16 i8 element means, 0 blocks past x 16 bytes per block)
                                    ;; offset16 = 16 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 8 i16 element means, 1 blocks past x 16 bytes per block)
                                    ;; offset32 = 32 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 4 i32 element means, 2 blocks past x 16 bytes per block)
                                    ;; offset64 = 64 (past 8 i8 element means, previous blocks contains 8 item, for each block can hold 2 i64 element means, 4 blocks past x 16 bytes per block)
                                    ;; ---------
                                    ;; offset   = 0
                                    (if (v128.any_true (i32x4.eq (local.get $vector.splat32) (v128.load offset=32 (i32.add (local.get $offset.block) (local.get $i32_blocks_begin)))))
                                        (then

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=64 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=0 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=128 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=1 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )

                                    ;; index8   = 12-16
                                    ;;
                                    ;; offset8  = 12 (past 12 i8 element means, previous blocks contains 10 item, for each block can hold 16 i8 element means, 0 blocks past x 16 bytes per block)
                                    ;; offset16 = 20 (past 12 i8 element means, previous blocks contains 10 item, for each block can hold 8 i16 element means, 1 blocks past x 16 bytes per block)
                                    ;; offset32 = 32 (past 12 i8 element means, previous blocks contains 10 item, for each block can hold 4 i32 element means, 2 blocks past x 16 bytes per block)
                                    ;; offset64 = 64 (past 12 i8 element means, previous blocks contains 10 item, for each block can hold 2 i64 element means, 4 blocks past x 16 bytes per block)
                                    ;; ---------
                                    ;; offset   = 0
                                    (if (v128.any_true (i32x4.eq (local.get $vector.splat32) (v128.load offset=64 (i32.add (local.get $offset.block) (local.get $i32_blocks_begin)))))
                                        (then

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=196 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=0 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )

                                            (if (v128.any_true (i64x2.eq (local.get $vector.splat64) (v128.load offset=256 (i32.add (local.get $offset.block) (local.get $i64_blocks_begin)))))
                                                (then
                                                    (if (i32.eq (local.get $scalar.i8b) (i32.load8_u offset=1 (i32.add (local.get $offset.block) (local.get $i8b_blocks_begin))))
                                                        (then
                                                            (return (local.get $count.blocks))
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )



    )
)