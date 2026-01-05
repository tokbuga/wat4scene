
    (func $settleModuleHeap
        (global.set $module* 
            (call $malloc<i32>i32 
                (global.get $MODULE_LENGTH)
            )
        )    
    )