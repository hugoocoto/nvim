---@diagnostic disable: undefined-global

return {
        s("inc", { t("#include <"), i(1), t(">") }),
        s("incl", { t("#include \""), i(1), t("\"") }),
        s("def", { t("#define ") }),
        s("print", { t("printf(\""), i(1), t("\\n\")") }),
}
