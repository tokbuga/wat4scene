export default function (wat) {
    wat = wat.replaceAll("(arg0)", "(local.get 0)")
    wat = wat.replaceAll("(module*)", "(global.get $module*)")
    wat = wat.replaceAll("(module.size)", "(global.get $MODULE_LENGTH)")

    return wat;
}