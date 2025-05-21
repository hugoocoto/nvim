vim.opt.termguicolors = true

local c = {
        -- Color de fondo.
        bg       = '#272727', -- Color de fondo.
        fg       = '#9d9d9d', -- Color de texto principal.
        black    = '#000000', -- Color negro
        red      = '#dd6666', -- Color rojo
        green    = '#99bb66', -- Color verde
        yellow   = '#ccbb66', -- Color amarillo
        blue     = '#66aadd', -- Color azul
        magenta  = '#9999dd', -- Color magenta
        cyan     = '#88bbcc', -- Color cian
        white    = '#aaaaaa', -- Color blanco
        br_black = '#777777', -- Color negro brillante
        br_white = '#ffffff', -- Color blanco brillante
}


local defaults = {
        variables = { fg = c.white },
        types = { fg = c.cyan },
        values = { fg = c.red },
        functions = { fg = c.blue },
        operators = { fg = c.white },
        keywords = { fg = c.magenta },
        strings = { fg = c.white },
        comments = { fg = c.br_black },
        bg = c.bg -- o "NONE" para transparencia
}

-- -- Normal y ventanas flotantes
-- vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = defaults.bg })  -- Texto normal con fondo especificado.
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.black }) -- Texto en ventanas flotantes con fondo negro.
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.white })            -- Bordes de ventanas flotantes con color blanco.
--
-- vim.api.nvim_set_hl(0, "Error", { fg = c.red })                    -- Mensajes de error.
-- vim.api.nvim_set_hl(0, "WarningMsg", { fg = c.yellow })            -- Mensajes de advertencia.
--
-- -- Pmenu para ventanas flotantes
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = c.fg, bg = c.black })       -- Menú flotante de autocompletado.
-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.green, bg = c.black }) -- Selección en el menú flotante.
-- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE", fg = "NONE" })  -- Barra de desplazamiento en el menú flotante.
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE", fg = "NONE" }) -- "Thumb" de la barra de desplazamiento.
--
-- -- Resaltados de nvim-cmp
-- vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = c.fg })                   -- Texto abreviado del ítem en el menú de autocompletado.
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = c.fg, bold = true }) -- Texto que coincide con lo escrito en el menú de autocompletado.
-- vim.api.nvim_set_hl(0, "CmpItemKind", { fg = c.blue })                 -- Tipo del ítem (función, variable, etc.) en el menú de autocompletado.
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = c.fg })                   -- Origen del ítem (menú o fuente) en el menú de autocompletado.
--
-- -- Fondo transparente para componentes adicion
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = c.br_black, bg = defaults.bg }) -- Espacios en blanco visibles.
-- vim.api.nvim_set_hl(0, "NonText", { fg = c.yellow, bg = defaults.bg })      -- Caracteres no textuales como el `~` al final de las líneas vacías.
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = c.cyan, bg = defaults.bg })    -- Oculta el `~` en las líneas vacías.
--
-- -- Línea de comandos y separadores
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = c.white, bg = c.black })       -- Línea de estado.
-- vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" })                      -- Columna de plegado con fondo transparente.
-- vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })                          -- Texto plegado con fondo transparente.
-- vim.api.nvim_set_hl(0, "SignColumn", { fg = c.white, bg = defaults.bg })   -- Columna de signos con fondo especificado.
-- vim.api.nvim_set_hl(0, "ColorColumn", { bold = true })                     -- Columna de color para resaltar la columna 80.
-- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = c.br_black, bg = c.black })  -- Línea de estado inactiva.
-- vim.api.nvim_set_hl(0, "VertSplit", { fg = c.br_black, bg = c.br_black })  -- Separación vertical entre ventanas.
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.br_black, bg = c.bg })     -- Separadores de ventana.
-- vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = c.red })              -- Signo de error de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = c.yellow })            -- Signo de advertencia de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = c.blue })              -- Signo de información de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = c.cyan })              -- Signo de sugerencia de diagnóstico
-- vim.api.nvim_set_hl(0, "ErrorMsg", { fg = c.red, bg = c.bg, bold = true }) -- Mensajes de error en comandos
-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = c.red })                  -- Signo de error de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = c.yellow })                -- Signo de advertencia de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.blue })                  -- Signo de información de diagnóstico
-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.cyan })                  -- Signo de sugerencia de diagnóstico
--
-- -- Pestañas
-- vim.api.nvim_set_hl(0, "TabLine", { fg = c.fg, bg = defaults.bg }) -- Línea de pestañas.
-- vim.api.nvim_set_hl(0, "TabLineSel", { fg = c.fg, bg = c.black })  -- Pestaña seleccionada.
-- vim.api.nvim_set_hl(0, "TabLineFill", { fg = c.fg })               -- Relleno de la línea de pestañas.
--
-- -- Palabras clave y directivas de preprocesador
-- vim.api.nvim_set_hl(0, "PreProc", defaults.keywords)     -- Directivas del preprocesador.
-- vim.api.nvim_set_hl(0, "Keyword", defaults.keywords)     -- Palabras clave como `for`, `while`, `if`.
-- vim.api.nvim_set_hl(0, "Conditional", defaults.keywords) -- Condicionales como `if`, `else`.
-- vim.api.nvim_set_hl(0, "Special", { fg = c.fg })         -- Palabras especiales.
--
-- -- Nombres de funciones y operadores
-- vim.api.nvim_set_hl(0, "Function", defaults.functions) -- Nombres de funciones.
-- vim.api.nvim_set_hl(0, "Operator", defaults.operators) -- Operadores como `+`, `-`, `=`.
--
-- -- Tipos de datos y valores
-- vim.api.nvim_set_hl(0, "Type", defaults.types)                  -- Tipos de datos como `int`, `char`, y tipos antes de una función.
-- vim.api.nvim_set_hl(0, "Number", defaults.values)               -- Números.
-- vim.api.nvim_set_hl(0, "Character", defaults.strings)           -- Caracteres individuales.
-- vim.api.nvim_set_hl(0, "Boolean", defaults.values)              -- Literales booleanos.
-- vim.api.nvim_set_hl(0, "Constant", { fg = c.red, bold = true }) -- Constantes generales.
-- vim.api.nvim_set_hl(0, "String", defaults.strings)              -- Literales de cadena.
--
-- -- Variables, identificadores y delimitadores
-- vim.api.nvim_set_hl(0, "Variable", defaults.variables) -- Variables.
-- vim.api.nvim_set_hl(0, "Identifier", { fg = c.white }) -- Identificadores como nombres de variables.
-- vim.api.nvim_set_hl(0, "Delimiter", { fg = c.white })  -- Delimitadores como `;`, `,`, `.`.
--
-- -- Comentarios y documentación
-- vim.api.nvim_set_hl(0, "Comment", { fg = c.br_black, italic = false })    -- Comentarios en el código.
-- vim.api.nvim_set_hl(0, "DocComment", { fg = c.br_black, italic = false }) -- Comentarios de documentación.
--
-- -- Números de línea
-- vim.api.nvim_set_hl(0, "LineNr", { fg = c.br_black, bg = defaults.bg })                  -- Números de línea.
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.green, bold = false, bg = defaults.bg }) -- Número de línea actual resaltado.
--
-- -- Comentarios `TODO`, `FIXME`, etc.
-- vim.api.nvim_set_hl(0, "Todo", { fg = c.green, italic = false }) -- Comentarios `TODO`.
-- vim.api.nvim_set_hl(0, "Debug", { fg = c.red, italic = false })  -- Declaraciones de depuración.
--
-- -- Títulos y negrita
-- vim.api.nvim_set_hl(0, "Title", { fg = c.blue, bold = true }) -- Títulos de ventanas.
-- vim.api.nvim_set_hl(0, "Bold", { bold = true })               -- Negrita para cualquier texto.
--
-- -- Configuración de Treesitter
-- vim.api.nvim_set_hl(0, "@function", defaults.functions)          -- Nombres de funciones.
-- vim.api.nvim_set_hl(0, "@function.macro", defaults.functions)    -- Nombres de funciones.
-- vim.api.nvim_set_hl(0, "@function.attribute", defaults.keywords) -- Atributos de funciones.
-- vim.api.nvim_set_hl(0, "@attribute", defaults.keywords)          -- Atributos como `__attribute__`.
-- vim.api.nvim_set_hl(0, "@method", { fg = c.blue })               -- Métodos de objetos.
-- vim.api.nvim_set_hl(0, "@keyword.function", defaults.keywords)   -- Palabras clave de funciones.
-- vim.api.nvim_set_hl(0, "@parameter", defaults.values)            -- Parámetros de funciones.
-- vim.api.nvim_set_hl(0, "@keyword", defaults.keywords)            -- Palabras clave generales.
-- vim.api.nvim_set_hl(0, "@variable", defaults.variables)          -- Variables.
-- vim.api.nvim_set_hl(0, "@constant", { fg = c.red, bold = true }) -- Constantes.
-- vim.api.nvim_set_hl(0, "@string", defaults.strings)              -- Cadenas de texto.
-- vim.api.nvim_set_hl(0, "@number", defaults.values)               -- Números.
-- vim.api.nvim_set_hl(0, "@operator", defaults.operators)          -- Operadores.
-- vim.api.nvim_set_hl(0, "@type", defaults.types)                  -- Tipos de datos.
-- vim.api.nvim_set_hl(0, "@type.builtin", defaults.types)          -- Tipos de datos incorporados.
-- vim.api.nvim_set_hl(0, "@tag", { fg = c.yellow })                -- Etiquetas como las de HTML.
-- vim.api.nvim_set_hl(0, "@tag.attribute", { fg = c.yellow })      -- Atributos en etiquetas HTML.
-- vim.api.nvim_set_hl(0, "@markup", { fg = c.white })
-- vim.api.nvim_set_hl(0, "@markup.strong", { fg = c.yellow, bold = true })
-- vim.api.nvim_set_hl(0, "@markup.italic", { fg = c.white, italic = false })
-- vim.api.nvim_set_hl(0, "@markup.strikethrough", { fg = c.green, strikethrough = true })
-- vim.api.nvim_set_hl(0, "@markup.underline", { fg = c.green })
-- vim.api.nvim_set_hl(0, "@markup.heading", { fg = c.magenta })
-- vim.api.nvim_set_hl(0, "@markup.link", { fg = c.blue })
--
-- -- Configuración de LSP
-- vim.api.nvim_set_hl(0, "LspReferenceText", { bg = c.br_black })                            -- Resaltar referencias de texto.
-- vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = c.br_black })                            -- Resaltar referencias de lectura.
-- vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = c.br_black })                           -- Resaltar referencias de escritura.
-- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = c.bg, bg = c.yellow })        -- Parámetro activo en la firma de la función.
-- vim.api.nvim_set_hl(0, "LspDiagnosticsError", { fg = c.red })                              -- Mensajes de error en LSP.
-- vim.api.nvim_set_hl(0, "LspDiagnosticsWarning", { fg = c.yellow })                         -- Mensajes de advertencia en LSP.
-- vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { fg = c.red, bg = c.bg })        -- Error en texto virtual
-- vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = c.yellow, bg = c.bg })   -- Advertencia en texto virtual
-- vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInformation", { fg = c.blue, bg = c.bg }) -- Información en texto virtual
-- vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = c.cyan, bg = c.bg })        -- Sugerencia en texto virtual
-- vim.api.nvim_set_hl(0, "LspDiagnosticsInformation", { fg = c.blue, bg = c.bg })            -- Información de LSP
-- vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { fg = c.cyan, bg = c.bg })                   -- Sugerencias de LSP
--
-- -- Configuración del color de los comandos y elementos relacionados
-- vim.api.nvim_set_hl(0, "Cmdline", { bg = c.black, fg = c.fg })       -- Línea de comandos en la parte inferior del editor.
-- vim.api.nvim_set_hl(0, "CmdlineEnter", { bg = c.black, fg = c.fg })  -- Cuando entras en el modo de línea de comandos.
-- vim.api.nvim_set_hl(0, "CmdlineChange", { bg = c.black, fg = c.fg }) -- Cuando cambias el texto en la línea de comandos.
-- vim.api.nvim_set_hl(0, "CmdlinePos", { bg = c.black, fg = c.fg })    -- La posición del cursor en la línea de comandos.
-- vim.api.nvim_set_hl(0, "CmdlineBlock", { bg = c.black, fg = c.fg })  -- Bloques de texto en la línea de comandos.
-- vim.api.nvim_set_hl(0, "ModeMsg", { fg = c.blue })                   -- Mensajes de modo (por ejemplo, "INSERT", "NORMAL").
-- vim.api.nvim_set_hl(0, "MoreMsg", { fg = c.green })                  -- Mensajes de paginación (por ejemplo, "Press ENTER or type command to continue").
-- vim.api.nvim_set_hl(0, "CmdlinePrompt", { fg = c.blue })             -- Configuración del color del prompt `:` en la línea de comandos.
-- vim.api.nvim_set_hl(0, "CmdlineInfo", { fg = c.white })              -- Opcional: Configuración del texto de información en la línea de comandos.
--
-- -- Mensajes de error y advertencia en pantalla
-- vim.api.nvim_set_hl(0, "TroubleText", { fg = c.fg, bg = c.bg })           -- Texto en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleNormal", { fg = c.fg, bg = c.bg })         -- Normal en la ventana de Trouble.
-- vim.api.nvim_set_hl(0, "TroubleCount", { fg = c.yellow })                 -- Contador en la barra de Trouble.
-- vim.api.nvim_set_hl(0, "TroubleIcon", { fg = c.blue })                    -- Iconos en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleIndent", { fg = c.cyan })                  -- Indentación en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleTextLineNumber", { fg = c.fg, bg = c.bg }) -- Números de línea en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleError", { fg = c.red, bg = c.bg })         -- Errores en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleWarning", { fg = c.yellow, bg = c.bg })    -- Advertencias en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleInformation", { fg = c.blue, bg = c.bg })  -- Información en Trouble.
-- vim.api.nvim_set_hl(0, "TroubleHint", { fg = c.cyan, bg = c.bg })         -- Sugerencias en Trouble.
--
-- vim.api.nvim_set_hl(0, "Visual", { bg = c.black })                        -- Selección en modo visual.
-- vim.api.nvim_set_hl(0, "VisualNOS", { bg = c.black })                     -- Selección visual en modo normal.
--
-- vim.api.nvim_set_hl(0, "DiffAdd", { fg = c.green, bg = c.bg })            -- Diferencias añadidas en modo diff.
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = c.yellow, bg = c.bg })        -- Diferencias cambiadas en modo diff.
-- vim.api.nvim_set_hl(0, "DiffDelete", { fg = c.red, bg = c.bg })           -- Diferencias eliminadas en modo diff.
-- vim.api.nvim_set_hl(0, "DiffText", { fg = c.blue, bg = c.bg })            -- Texto de diferencias en modo diff.
--
-- vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = c.fg, bg = c.black })    -- Prompts en Telescope.
-- vim.api.nvim_set_hl(0, "TelescopeResults", { fg = c.fg, bg = c.bg })      -- Resultados de búsqueda en Telescope.
-- vim.api.nvim_set_hl(0, "TelescopePreview", { fg = c.fg, bg = c.black })   -- Vista previa en Telescope.
--
-- vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = c.green })                  -- Adiciones en el archivo.
-- vim.api.nvim_set_hl(0, "GitGutterChange", { fg = c.yellow })              -- Cambios en el archivo.
-- vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = c.red })                 -- Eliminaciones en el archivo.
--
-- vim.api.nvim_set_hl(0, "LualineNormal", { fg = c.fg, bg = c.bg })         -- Estado normal en Lualine.
-- vim.api.nvim_set_hl(0, "LualineInsert", { fg = c.green, bg = c.bg })      -- Estado de inserción en Lualine.
-- vim.api.nvim_set_hl(0, "LualineVisual", { fg = c.cyan, bg = c.bg })       -- Estado visual en Lualine.
--
-- vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = c.blue })             -- Iconos de carpeta en Nvim-tree.
-- vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = c.blue })             -- Nombres de carpeta en Nvim-tree.
-- vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = c.green })      -- Carpeta abierta en Nvim-tree.
-- vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = c.cyan })             -- Carpeta raíz en Nvim-tree.
-- vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = c.fg })          -- Carpeta vacía en Nvim-tree.
--

vim.api.nvim_set_hl(0, "LualineNormal", { fg = c.fg, bg = c.bg })    -- Estado normal en Lualine.
vim.api.nvim_set_hl(0, "LualineInsert", { fg = c.green, bg = c.bg }) -- Estado de inserción en Lualine.
vim.api.nvim_set_hl(0, "LualineVisual", { fg = c.cyan, bg = c.bg })  -- Estado visual en Lualine.

vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })           -- Normal text
vim.api.nvim_set_hl(0, "Comment", defaults.comments)                 -- Any comment
vim.api.nvim_set_hl(0, "Constant", { fg = c.red, bold = true })      -- (*) Any constant
vim.api.nvim_set_hl(0, "String", defaults.strings)                   --   A string constant: "this is a string"
vim.api.nvim_set_hl(0, "Character", defaults.values)                 --   A character constant: 'c', '\n'
vim.api.nvim_set_hl(0, "Number", defaults.values)                    --   A number constant: 234, 0xff
vim.api.nvim_set_hl(0, "Boolean", defaults.values)                   --   A boolean constant: TRUE, false
vim.api.nvim_set_hl(0, "Float", defaults.values)                     --   A floating point constant: 2.3e10
vim.api.nvim_set_hl(0, "Identifier", defaults.variables)             -- (*) Any variable name
vim.api.nvim_set_hl(0, "Variable", defaults.variables)             -- (*) Any variable name
vim.api.nvim_set_hl(0, "Function", defaults.functions)               --   Function name (also: methods for classes)
vim.api.nvim_set_hl(0, "Statement", defaults.keywords)               -- (*) Any statement
vim.api.nvim_set_hl(0, "Conditional", defaults.keywords)             --   if, then, else, endif, switch, etc.
vim.api.nvim_set_hl(0, "Repeat", defaults.keywords)                  --   for, do, while, etc.
vim.api.nvim_set_hl(0, "Label", defaults.keywords)                   --   case, default, etc.
vim.api.nvim_set_hl(0, "Operator", defaults.operators)               --   "sizeof", "+", "*", etc.
vim.api.nvim_set_hl(0, "Keyword", defaults.keywords)                 --   any other keyword
vim.api.nvim_set_hl(0, "Exception", defaults.keywords)               --   try, catch, throw
vim.api.nvim_set_hl(0, "PreProc", defaults.keywords)                 -- (*) Generic Preprocessor
vim.api.nvim_set_hl(0, "Include", defaults.keywords)                 --   Preprocessor #include
vim.api.nvim_set_hl(0, "Define", defaults.keywords)                  --   Preprocessor #define
vim.api.nvim_set_hl(0, "Macro", { link = "Define" })                 --   Same as Define
vim.api.nvim_set_hl(0, "PreCondit", { link = "Define" })             --   Preprocessor #if, #else, #endif, etc.
vim.api.nvim_set_hl(0, "Type", defaults.types)                       -- (*) int, long, char, etc.
vim.api.nvim_set_hl(0, "Typedef", defaults.types)                    --   A typedef
vim.api.nvim_set_hl(0, "StorageClass", defaults.keywords)            --   static, register, volatile, etc.
vim.api.nvim_set_hl(0, "Structure", defaults.keywords)               --   struct, union, enum, etc.
vim.api.nvim_set_hl(0, "Special", defaults.operators)                -- (*) Any special symbol
vim.api.nvim_set_hl(0, "SpecialChar", { fg = c.fg })                 -- Special character in a constant as \n in strings
-- Tag            { }, --   You can use CTRL-] on this
vim.api.nvim_set_hl(0, "Delimiter", defaults.operators)              -- Special characters as '.', ',' ...
vim.api.nvim_set_hl(0, "SpecialComment", { fg = c.br_black })        --   Special things inside a comment (e.g. '\n')
-- Debug          { }, --   Debugging statements

vim.api.nvim_set_hl(0, "Underlined", { underline = true }) -- Text that stands out, HTML links
vim.api.nvim_set_hl(0, "Ignore", {})                       -- Left blank, hidden |hl-Ignore| (NOTE May be invisible here in template)
vim.api.nvim_set_hl(0, "Error", { fg = c.red })            -- Any erroneous construct
vim.api.nvim_set_hl(0, "Todo", { fg = c.yellow })          -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

vim.api.nvim_set_hl(0, "Conceal", { fg = c.br_black })     -- Placeholder characters substituted for concealed text (see 'conceallevel')
vim.api.nvim_set_hl(0, "Cursor", { reverse = true })       -- Character under the cursor
vim.api.nvim_set_hl(0, "lCursor", { link = "Cursor" })     -- Character under the cursor when |language-mapping| is used (see 'guicursor')
vim.api.nvim_set_hl(0, "CursorIM", { link = "Cursor" })    -- Like Cursor, but used when in IME mode |CursorIM|
vim.api.nvim_set_hl(0, "CursorColumn", { bg = c.black })   -- Screen-column at the cursor, when 'cursorcolumn' is set.
vim.api.nvim_set_hl(0, "CursorLine", { bg = c.black })     -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
vim.api.nvim_set_hl(0, "IblIndent", { fg = c.br_black })
vim.api.nvim_set_hl(0, "VirtColumn", { fg = c.br_black })
vim.api.nvim_set_hl(0, "ColorColumn", { fg = c.black })     -- Columns set with 'colorcolumn'
vim.api.nvim_set_hl(0, "Directory", { fg = c.fg })          -- Directory names (and other special names in listings)
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = c.cyan })      -- Filler lines ~ after the end of the buffer. By default, this is highlighted like |hl-NonText|.
vim.api.nvim_set_hl(0, "TermCursor", { link = "Cursor" })   -- Cursor in a focused terminal
vim.api.nvim_set_hl(0, "TermCursorNC", { link = "Cursor" }) -- Cursor in an unfocused terminal
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = c.red })          -- Error messages on the command line
vim.api.nvim_set_hl(0, "Folded", { bg = c.black })          -- Line used for closed folds
vim.api.nvim_set_hl(0, "FoldColumn", { bg = c.black })      -- 'foldcolumn'
vim.api.nvim_set_hl(0, "SignColumn", {})                    -- Column where |signs| are displayed, like warning W
-- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
-- Substitute   { }, -- |:substitute| replacement text highlighting
vim.api.nvim_set_hl(0, "LineNr", { fg = c.br_black })                    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.br_black, bold = true }) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
vim.api.nvim_set_hl(0, "MatchParen", { bg = c.br_black, bold = true })   -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
vim.api.nvim_set_hl(0, "MsgArea", { fg = c.fg })                         -- Area for messages and cmdline
vim.api.nvim_set_hl(0, "ModeMsg", { link = "MsgArea" })                  -- 'showmode' message (e.g., "-- INSERT -- ")
-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
vim.api.nvim_set_hl(0, "MoreMsg", { fg = c.yellow })                     -- |more-prompt|
vim.api.nvim_set_hl(0, "NonText", { fg = c.cyan })                       -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.black })          -- Normal text in floating windows.
vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.white })

-- NormalNC     { }, -- normal text in non-current windows
vim.api.nvim_set_hl(0, "Pmenu", { fg = c.fg, bg = c.bg }) -- Popup menu: Normal item.
-- PmenuSel = { }, -- Popup menu: Selected item.
-- PmenuSbar = {  }, -- Popup menu: Scrollbar.d
-- PmenuThumb = { }, -- Popup menu: Thumb of the scrollbar.
-- Question     { }, -- |hit-enter| prompt and yes/no questions
vim.api.nvim_set_hl(0, "QuickFixLine", { bg = c.black })      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
vim.api.nvim_set_hl(0, "Search", { fg = c.bg, bg = c.green }) -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
vim.api.nvim_set_hl(0, "SpecialKey", { fg = c.br_black })     -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, "StatusLine", { bg = c.bg })   -- Status line of current window
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = c.bg }) -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
vim.api.nvim_set_hl(0, "TabLine", { bg = c.bg })      -- Tab pages line, not active tab page label
vim.api.nvim_set_hl(0, "TabLineFill", { bg = c.bg })  -- Tab pages line, where there are no labels
vim.api.nvim_set_hl(0, "TabLineSel", { bg = c.bg })   -- Tab pages line, active tab page label
vim.api.nvim_set_hl(0, "Title", { fg = c.magenta })   -- Titles for output from ":set all", ":autocmd" etc.
-- NB!: VertSplit is dynamic. See functions below.
vim.api.nvim_set_hl(0, "VertSplit", { fg = c.white }) -- Vertical split line
vim.api.nvim_set_hl(0, "Visual", { bg = c.black })    -- Visual mode selection
-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
-- WarningMsg   { }, -- Warning messages
vim.api.nvim_set_hl(0, "Whitespace", { fg = c.br_black })      -- "nbsp", "space", "tab" and "trail" in 'listchars'
vim.api.nvim_set_hl(0, "Winseparator", { link = "VertSplit" }) -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
-- WildMenu     { }, -- Current match in 'wildmenu' completion
vim.api.nvim_set_hl(0, "Winbar", { bg = c.bg })
vim.api.nvim_set_hl(0, "WinbarNC", { bg = c.bg })

-- Tree-Sitter syntax groups.
--
vim.api.nvim_set_hl(0, '@comment', { link = "Comment" }) -- Comment
vim.api.nvim_set_hl(0, '@comment.hint', { fg = c.green })
vim.api.nvim_set_hl(0, '@comment.info', { fg = c.yellow })
vim.api.nvim_set_hl(0, '@comment.note', { fg = c.green })
vim.api.nvim_set_hl(0, '@comment.todo', { fg = c.yellow })
vim.api.nvim_set_hl(0, '@comment.warning', { fg = c.yellow })
vim.api.nvim_set_hl(0, '@constant', { link = "Constant" }) -- Constant
vim.api.nvim_set_hl(0, '@keyword', defaults.keywords)
vim.api.nvim_set_hl(0, '@macro', { link = "Macro" })       -- Macro
vim.api.nvim_set_hl(0, '@string', { link = "String" })     -- String

vim.api.nvim_set_hl(0, "@markup", { fg = c.white })
vim.api.nvim_set_hl(0, "@markup.strong", { fg = c.yellow, bold = true })
vim.api.nvim_set_hl(0, "@markup.italic", { fg = c.white, italic = false })
vim.api.nvim_set_hl(0, "@markup.strikethrough", { fg = c.green, strikethrough = true })
vim.api.nvim_set_hl(0, "@markup.underline", { fg = c.green })
vim.api.nvim_set_hl(0, "@markup.heading", { fg = c.magenta })
vim.api.nvim_set_hl(0, "@markup.link", { fg = c.blue })
-- vim.api.nvim_set_hl(0, '@markup.emphasis', { italic = true })
-- vim.api.nvim_set_hl(0, '@markup.environment', { link = "Macro" })
-- vim.api.nvim_set_hl(0, '@markup.environment.name', { link = "Type" })
-- vim.api.nvim_set_hl(0, '@markup.heading', { link = "Title" })
-- vim.api.nvim_set_hl(0, '@markup.italic', { italic = true })
-- vim.api.nvim_set_hl(0, '@markup.link', { fg = c.teal })
-- vim.api.nvim_set_hl(0, '@markup.link.label', { link = "SpecialChar" })
-- vim.api.nvim_set_hl(0, '@markup.link.label.symbol', { link = "Identifier" })
-- vim.api.nvim_set_hl(0, '@markup.link.url', { link = "Underlined" })
-- vim.api.nvim_set_hl(0, '@markup.list', { fg = c.blue })           -- For special punctutation that does not fall in the categories before.
-- vim.api.nvim_set_hl(0, '@markup.list.checked', { fg = c.green })  -- For brackets and parens.
-- vim.api.nvim_set_hl(0, '@markup.list.markdown', { fg = c.orange, bold = true })
-- vim.api.nvim_set_hl(0, '@markup.list.unchecked', { fg = c.blue }) -- For brackets and parens.
-- vim.api.nvim_set_hl(0, '@markup.math', { link = "Special" })
-- vim.api.nvim_set_hl(0, '@markup.raw', { link = "String" })
-- vim.api.nvim_set_hl(0, '@markup.raw.block', { link = "String" })
-- vim.api.nvim_set_hl(0, '@markup.raw.block.markdown', { link = "Normal" })
-- vim.api.nvim_set_hl(0, '@label.markdown', { link = "Normal" })
-- vim.api.nvim_set_hl(0, '@variable.parameter.builtin', { fg = c.teal })
-- vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { bg = c.bg, fg = c.blue })
vim.api.nvim_set_hl(0, '@constructor', { link = "Special" }) -- Special
vim.api.nvim_set_hl(0, '@operator', { link = "Operator" })   -- Operator
vim.api.nvim_set_hl(0, '@keyword', { link = "Keyword" })     -- Keyword
vim.api.nvim_set_hl(0, '@variable', defaults.variables)      -- Variable
vim.api.nvim_set_hl(0, '@punctuation.bracket', defaults.operators)
vim.api.nvim_set_hl(0, '@tag', { link = "Label" })
vim.api.nvim_set_hl(0, '@type', { link = "Type" })               -- Type
vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })       -- Tipos de datos incorporados.
vim.api.nvim_set_hl(0, '@type.definition', { link = "Typedef" }) -- Typedef
vim.api.nvim_set_hl(0, '@structure', { link = "Structure" })     -- Structure
vim.api.nvim_set_hl(0, '@include', { link = "Include" })         -- Include

vim.api.nvim_set_hl(0, '@keyword.import', { link = "Include" })
--
--  highlights for a languages
--
-- vim.api.nvim_set_hl(0, '["@keyword.rust"]', { fg = color.magenta })
-- vim.api.nvim_set_hl(0, '["@keyword.python"]', { fg = color.magenta })
-- ["@keyword.lua"] = { fg = color.cyan },
--  LSP
vim.api.nvim_set_hl(0, '@lsp.type.parameter', defaults.variables)
vim.api.nvim_set_hl(0, '@lsp.type.variable.lua', defaults.variables)

vim.api.nvim_set_hl(0, 'markdownCode', { fg = c.fg })
vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = c.fg })
vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = c.blue, underline = true })

--
-- Render-markdown.nvim
--
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { fg = c.green, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { fg = c.faded_text, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownInlineHighlight', { fg = c.faded_text, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownBullet', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownTableHead', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownTableRow', { fg = c.cyan })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownSuccess', { fg = c.green })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownInfo', { fg = c.silver })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownHint', { fg = c.teal })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownWarn', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownError', { fg = c.red })
--
-- Snacks.nvim
--
-- vim.api.nvim_set_hl(0, 'SnacksIndentBlank', { fg = c.medium_gray })
-- vim.api.nvim_set_hl(0, 'SnacksIndentScope', { fg = c.medium_gray })
-- vim.api.nvim_set_hl(0, 'SnacksIndentChunk', { fg = c.medium_gray })
-- vim.api.nvim_set_hl(0, 'SnacksDashboardDesc', { fg = c.white })
-- vim.api.nvim_set_hl(0, 'SnacksDashboardDir', { fg = c.green })
-- vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = c.green })
--
-- Noice.nvim
--
-- vim.api.nvim_set_hl(0, 'NoiceCmdline', { fg = c.white })                 -- Search prompt
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { fg = c.white, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { fg = c.faded_text }) -- Cmd window boarder
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { fg = c.white })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { fg = c.white })             -- Prompt begin icon
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconCalculator', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconCmdLine', { fg = c.white })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconFilter', { fg = c.magenta })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconHelp', { fg = c.cyan })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconInput', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconLua', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { fg = c.yellow })
--
-- vim.api.nvim_set_hl(0, 'NoiceConfirmBorder', { fg = c.blue })

--
-- Blink.Cmp
--
--
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = c.bg, fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { bg = c.bg, fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', { link = "BlinkCmpLabel" })
vim.api.nvim_set_hl(0, 'BlinkCmpSource', { fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = c.black, fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', { bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', { fg = c.fg })

vim.api.nvim_set_hl(0, 'BlinkCmpKind', { fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpKindDefaul', { fg = c.fg })

vim.api.nvim_set_hl(0, 'BlinkCmpKindArray', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindBoolean', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindClass', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindColor', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstant', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstructor', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnum', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnumMember', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEvent', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindField', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFile', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFolder', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFunction', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindIdentifier', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindInterface', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindKey', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindKeyword', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindMethod', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindModule', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindNumber', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindObject', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindOperator', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindPackage', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindProperty', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindReference', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindSnippet', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindStruct', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindText', { fg = c.fg })
vim.api.nvim_set_hl(0, 'BlinkCmpKindTypeParameter', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindUnit', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindValue', { link = "BlinkCmpKindText" })
vim.api.nvim_set_hl(0, 'BlinkCmpKindVariable', { link = "BlinkCmpKindText" })

-- Mason
vim.api.nvim_set_hl(0, 'MasonHighlight', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'MasonHighlightBlockBold', { fg = c.magenta })

-- Git
--
-- vim.api.nvim_set_hl(0, 'GitAdded', { fg = color.green })
-- vim.api.nvim_set_hl(0, 'GitChanged', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'GitDeleted', { fg = color.red })
--
-- vim.api.nvim_set_hl(0, 'diffAdded', { link = "GitAdded" })
-- vim.api.nvim_set_hl(0, 'diffChanged', { link = "GitChanged" })
-- vim.api.nvim_set_hl(0, 'diffDeleted', { link = "GitDeleted" })
--
-- vim.api.nvim_set_hl(0, 'DiffAdd', { bg = color.diff_add_bg }) -- Diff mode: Added line |diff.txt|
-- vim.api.nvim_set_hl(0, 'DiffChange', { bg = color.blue }) -- Diff mode: Changed line |diff.txt|
-- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = color.faded_text, bg = color.bg }) -- Diff mode: Deleted line |diff.txt|
-- vim.api.nvim_set_hl(0, 'DiffText', { bg = color.cyan }) -- Diff mode: Changed text within a changed line |diff.txt|

-- Diffview
-- vim.api.nvim_set_hl(0, 'DiffviewDiffAdd', { bg = color.diff_add_bg })
-- vim.api.nvim_set_hl(0, 'DiffviewDiffAddText', { bg = color.diff_add_bg })
-- vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = color.diff_delete_bg })
-- vim.api.nvim_set_hl(0, 'DiffviewDiffDeleteText', { bg = color.diff_delete_bg })
-- vim.api.nvim_set_hl(0, 'DiffviewDiffFill', { fg = color.faded_text, bg = color.bg })

-- Gitsigns
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = "GitAdded" })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { link = "GitChanged" })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = "GitDeleted" })
-- vim.api.nvim_set_hl(0, 'GitSignsAddPreview', { link = "DiffviewDiffAdd" })
-- vim.api.nvim_set_hl(0, 'GitSignsDeletePreview', { link = "DiffviewDiffDelete" })
-- vim.api.nvim_set_hl(0, 'GitSignsAddInline', { link = "DiffviewDiffAddText" })
-- vim.api.nvim_set_hl(0, 'GitSignsDeleteInline', { link = "DiffviewDiffDeleteText" })

-- LSP highlighting
vim.api.nvim_set_hl(0, 'LspReferenceText', { underline = true })                           -- Used for highlighting "text" references
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = "LspReferenceText" })                  -- Used for highlighting "read" references
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = "LspReferenceText" })                 -- Used for highlighting "write" references
vim.api.nvim_set_hl(0, 'LspInlayHint', { link = "Comment", bold = true })
vim.api.nvim_set_hl(0, 'LspCodeLens', { link = "LspInlayHint" })                           -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
vim.api.nvim_set_hl(0, "LspDiagnosticsError", { fg = c.red })                              -- Mensajes de error en LSP.
vim.api.nvim_set_hl(0, "LspDiagnosticsWarning", { fg = c.yellow })                         -- Mensajes de advertencia en LSP.
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { fg = c.red, bg = c.bg })        -- Error en texto virtual
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = c.yellow, bg = c.bg })   -- Advertencia en texto virtual
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInformation", { fg = c.blue, bg = c.bg }) -- Información en texto virtual
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = c.cyan, bg = c.bg })        -- Sugerencia en texto virtual
vim.api.nvim_set_hl(0, "LspDiagnosticsInformation", { fg = c.blue, bg = c.bg })            -- Información de LSP
vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { fg = c.cyan, bg = c.bg })                   -- Sugerencias de LSP
-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
--
vim.api.nvim_set_hl(0, 'DiagnosticError', {})                                                      -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
vim.api.nvim_set_hl(0, 'DiagnosticWarn', {})                                                       -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
vim.api.nvim_set_hl(0, 'DiagnosticInfo', {})                                                       -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
vim.api.nvim_set_hl(0, 'DiagnosticHint', {})                                                       -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = c.red })                               -- Used for "Error" diagnostic virtual text.
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = c.yellow })                             -- Used for "Warn" diagnostic virtual text.
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = c.blue })                               -- Used for "Info" diagnostic virtual text.
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = c.fg })                                 -- Used for "Hint" diagnostic virtual text.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { link = "DiagnosticError", undercurl = true }) -- Used to underline "Error" diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { link = "DiagnosticWarn", undercurl = true })   -- Used to underline "Warn" diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { link = "DiagnosticInfo", undercurl = true })   -- Used to underline "Info" diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { link = "DiagnosticHint", undercurl = true })   -- Used to underline "Hint" diagnostics.
vim.api.nvim_set_hl(0, 'DiagnosticFloatingErrorLabel', { fg = c.bg, bg = c.red })
vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarnLabel', { fg = c.bg, bg = c.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfoLabel', { fg = c.bg, bg = c.blue })
vim.api.nvim_set_hl(0, 'DiagnosticFloatingHintLabel', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = c.red })   -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = c.yellow }) -- Used to color "Warn" diagnostic messages in diagnostics float.
vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = c.blue })   -- Used to color "Info" diagnostic messages in diagnostics float.
vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = c.fg })     -- Used to color "Hint" diagnostic messages in diagnostics float.
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = c.red })       -- Used for "Error" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = c.yellow })     -- Used for "Warn" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = c.blue })       -- Used for "Info" signs in sign column.
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = c.fg })         -- Used for "Hint" signs in sign column.
vim.api.nvim_set_hl(0, 'StatusBarSegmentNormal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'StatusBarSegmentFaded', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'StatusBarDiagnosticError', { fg = c.red, bg = c.bg })
vim.api.nvim_set_hl(0, 'StatusBarDiagnosticWarn', { fg = c.yellow, bg = c.bg })
vim.api.nvim_set_hl(0, 'StatusBarDiagnosticInfo', { fg = c.blue, bg = c.bg })
vim.api.nvim_set_hl(0, 'StatusBarDiagnosticHint', { fg = c.fg, bg = c.bg })

vim.api.nvim_set_hl(0, 'FloatTitle', { fg = c.bg, bg = c.cyan, bold = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = c.black })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = c.black })
vim.api.nvim_set_hl(0, 'TodoComment', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'FixmeComment', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'HackComment', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'PriorityComment', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'MiniStarterSection', { fg = c.fg, bg = c.bg, bold = true })
-- vim.api.nvim_set_hl(0, 'MiniStarterFooter', { link = "Comment" })
-- vim.api.nvim_set_hl(0, 'ZenBg', { fg = c.fg, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'WinShiftMove', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'TabsVsSpaces', { fg = c.fg, underline = true })
-- vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = c.bg, bg = c.green, bold = true })
-- vim.api.nvim_set_hl(0, 'FlashMatch', { fg = c.bg, bg = c.cyan })
-- vim.api.nvim_set_hl(0, 'FlashLabel', { fg = c.bg, bg = c.magenta, bold = true })
-- vim.api.nvim_set_hl(0, 'FlashPrompt', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'FlashPromptIcon', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = c.bg })
-- vim.api.nvim_set_hl(0, 'NvimSurroundHighlight', { fg = c.bg, bg = c.cyan })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = c.bg })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.fg })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = c.bg })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = c.fg, bg = c.bg }) -- this is used for telescope titles
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { link = "GitAdded" })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { link = "GitChanged" })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { link = "GitDeleted" })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { link = "Comment" })

-- Fzf-lua
-- vim.api.nvim_set_hl(0, 'FzfLuaNormal', { bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'FzfLuaTitle', { bg = color.english_violet })
-- vim.api.nvim_set_hl(0, 'FzfLuaBorder', { fg = color.faded_text, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'FzfLuaHelpNormal', { fg = color.yellow }) --
-- vim.api.nvim_set_hl(0, 'FzfLuaHeaderBind', { fg = color.yellow, bold = true }) -- header keybind
-- vim.api.nvim_set_hl(0, 'FzfLuaHeaderText', { fg = color.magenta }) -- keybind help text
-- vim.api.nvim_set_hl(0, 'FzfLuaDirPart', { fg = color.bar_faded_text })
-- vim.api.nvim_set_hl(0, 'FzfLuaSearch', { fg = color.orange, bold = true })
-- vim.api.nvim_set_hl(0, 'FzfLuaFzfMatch', { fg = color.orange, bold = true })

-- NeoTree
-- vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = color.strong_text, bold = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = color.faded_text })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = color.faded_text })
-- vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { link = "IndentBlanklineChar" })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = color.green })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = color.green })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitStaged', { fg = color.green })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitIgnored', { fg = color.faded_text })

-- NeoGit
-- vim.api.nvim_set_hl(0, 'NeogitSectionHeader', { fg = color.magenta })
-- vim.api.nvim_set_hl(0, 'gitcommitFirstLine', { fg = color.text })
-- vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = color.text })
--
-- vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'NotifyINFOBody', { fg = color.text, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = color.float_bg, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = color.yellow })
-- vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = color.yellow })
-- vim.api.nvim_set_hl(0, 'NotifyWARNBody', { fg = color.text, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = color.float_bg, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = color.red })
-- vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = color.red })
-- vim.api.nvim_set_hl(0, 'NotifyERRORBody', { fg = color.red, bg = color.float_bg })
-- vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = color.float_bg, bg = color.float_bg })

-- Trouble
vim.api.nvim_set_hl(0, "TroubleText", { fg = c.fg, bg = c.bg })           -- Texto en Trouble.
vim.api.nvim_set_hl(0, "TroubleNormal", { fg = c.fg, bg = c.bg })         -- Normal en la ventana de Trouble.
vim.api.nvim_set_hl(0, "TroubleCount", { fg = c.yellow })                 -- Contador en la barra de Trouble.
vim.api.nvim_set_hl(0, "TroubleIcon", { fg = c.blue })                    -- Iconos en Trouble.
vim.api.nvim_set_hl(0, "TroubleIndent", { fg = c.cyan })                  -- Indentación en Trouble.
vim.api.nvim_set_hl(0, "TroubleTextLineNumber", { fg = c.fg, bg = c.bg }) -- Números de línea en Trouble.
vim.api.nvim_set_hl(0, "TroubleError", { fg = c.red, bg = c.bg })         -- Errores en Trouble.
vim.api.nvim_set_hl(0, "TroubleWarning", { fg = c.yellow, bg = c.bg })    -- Advertencias en Trouble.
vim.api.nvim_set_hl(0, "TroubleInformation", { fg = c.blue, bg = c.bg })  -- Información en Trouble.
vim.api.nvim_set_hl(0, "TroubleHint", { fg = c.cyan, bg = c.bg })         -- Sugerencias en Trouble.

--- Cmp
-- vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = color.orange, bold = true, force = true })
-- vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = "Function", force = true })
-- vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = "Function" })
-- vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = "Type", force = true })
-- vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = color.blue })
-- vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = "Constant" })
-- vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = "Constant" })
-- vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { link = "Variable" })
-- vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link = "Keyword" })
-- vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = "Directory" })
