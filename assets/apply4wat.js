export default function (wat) {
    wat = wat.replaceAll(/(\s)(i32|f32|i64|f64|v128)\(/g, `$1($2.const `)
    wat = wat.replaceAll(/(\s)([a-z0-9A-Z\_\.]+)\(/g, `$1(call $$$2`)
    wat = wat.replaceAll("(arg0)", "(local.get 0)")
    wat = wat.replaceAll("(args)", "(self)")
    wat = wat.replaceAll("(module*)", "(global.get $module*)")
    wat = wat.replaceAll("(module.length)", "(global.get $MODULE_LENGTH)")
    wat = wat.replaceAll("(ui8.load ", "(i32.load8_u ")
    wat = wat.replaceAll("(ui8.store ", "(i32.store8 ")
    wat = wat.replaceAll("(i32.store8 ", "(i32.store8 ")
    wat = wat.replaceAll(")l#", ") (call $self.console.log<ext>)")
    wat = wat.replaceAll(")li", ") (call $self.console.log<i32>)")
    wat = wat.replaceAll(")wi", ") (call $self.console.warn<i32>)")
    wat = wat.replaceAll(")wf", ") (call $self.console.warn<f32>)")
    wat = wat.replaceAll(")!!", ") (call $self.console.warn<ext.ext>)")
    wat = wat.replaceAll(")w#", ") (call $self.console.warn<ext>)")

    return wat;
}