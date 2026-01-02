(module
    (include "include/self/Date.wat")
    (include "include/self/Performance.wat")

    (include "include/imports/memory.wat")
    (include "include/imports/malloc.wat")

    (include "include/snippeds/module_global_defs.wat")

    (global $MODULE_LENGTH i32 i32(512))

    (func $i32.store.windowConfigStarted (param i32) (i32.store8  offset=0 (module*) (arg0)))
    (func $i32.load.windowConfigStarted (result i32) (i32.load8_u offset=0 (module*)))

    (func $f64.store.timeOrigin      (param f64) (f64.store offset=4 (module*) (arg0)))
    (func $f64.load.timeOrigin      (result f64) (f64.load  offset=4 (module*)))

    (func $f64.store.dateOrigin      (param f64) (f64.store offset=12 (module*) (arg0)))
    (func $f64.load.dateOrigin      (result f64) (f64.load  offset=12 (module*)))

    (main $window
        (include "include/snippeds/module_gset_malloc.wat")

        (call $i32.store.windowConfigStarted (true))

        (call $f64.store.timeOrigin (call $Performance:timeOrigin<ext>f64 (ref.extern $performance)))
        (call $f64.store.dateOrigin (call $Date.now<>f64))

        (console $warn<i32> (call $i32.load.windowConfigStarted))
        (console $warn<f64> (call $f64.load.timeOrigin))
        (console $warn<f64> (call $f64.load.dateOrigin))
    )
)