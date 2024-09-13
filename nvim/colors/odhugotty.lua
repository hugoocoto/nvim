vim.cmd('highlight clear') -- resetea esquema de color
vim.opt.termguicolors = false

-- Define los colores usando códigos ANSI (0-7 para colores básicos y 8-15 para colores brillantes)
local c = {
    bg       = 0,  -- Negro
    fg       = 7,  -- Blanco
    black    = 0,  -- Negro
    red      = 1,  -- Rojo
    green    = 2,  -- Verde
    yellow   = 3,  -- Amarillo
    blue     = 4,  -- Azul
    magenta  = 5,  -- Magenta
    cyan     = 6,  -- Cian
    white    = 7,  -- Blanco
    br_black = 8,  -- Negro brillante
    br_white = 15, -- Blanco brillante
}

-- Función para aplicar colores en Neovim para entornos `tty`
local function set_highlight(group, fg, bg, attr)
    bg = bg or c.bg
    fg = fg or c.fg
    local cmd = string.format("highlight %s ctermfg=%d ctermbg=%d", group, fg, bg)
    if attr then
        cmd = cmd .. " " .. attr
    end
    vim.cmd(cmd)
end

-- Normal y ventanas flotantes
set_highlight("Normal", c.fg, c.bg)         -- Texto normal
set_highlight("NormalFloat", c.fg, c.black) -- Texto en ventanas flotantes
set_highlight("FloatBorder", c.fg, c.black) -- Bordes de ventanas flotantes

-- Mensajes de error y advertencia
set_highlight("Error", c.red, c.bg)         -- Mensajes de error
set_highlight("WarningMsg", c.yellow, c.bg) -- Mensajes de advertencia

-- Menú flotante de autocompletado
set_highlight("Pmenu", c.fg, c.bg)       -- Menú flotante de autocompletado
set_highlight("PmenuSel", c.fg, c.black) -- Selección en el menú flotante
set_highlight("PmenuSbar", c.bg, c.bg)   -- Barra de desplazamiento en el menú flotante
set_highlight("PmenuThumb", c.bg, c.bg)  -- "Thumb" de la barra de desplazamiento

-- Línea de comandos y separadores
set_highlight("StatusLine", c.fg, c.black)         -- Línea de estado
set_highlight("SignColumn", c.fg, c.bg)            -- Columna de signos
set_highlight("ColorColumn", c.bg, c.bg)           -- Columna de color para resaltar la columna actual
set_highlight("StatusLineNC", c.br_black, c.black) -- Línea de estado inactiva
set_highlight("VertSplit", c.br_black, c.br_black) -- Separación vertical entre ventanas
set_highlight("WinSeparator", c.br_black, c.bg)    -- Separadores de ventana

-- Palabras clave y directivas de preprocesador
set_highlight("PreProc", c.magenta, c.bg)     -- Directivas del preprocesador
set_highlight("Keyword", c.magenta, c.bg)     -- Palabras clave
set_highlight("Conditional", c.magenta, c.bg) -- Condicionales
set_highlight("Special", c.fg, c.bg)          -- Palabras especiales

-- Nombres de funciones y operadores
set_highlight("Function", c.blue, c.bg)                -- Nombres de funciones
set_highlight("Operator", c.white, c.bg, "cterm=bold") -- Operadores

-- Tipos de datos y valores
set_highlight("Type", c.cyan, c.bg)                  -- Tipos de datos
set_highlight("Number", c.red, c.bg)                 -- Números
set_highlight("Character", c.green, c.bg)            -- Caracteres individuales
set_highlight("Boolean", c.red, c.bg)                -- Literales booleanos
set_highlight("Constant", c.red, c.bg, "cterm=bold") -- Constantes generales
set_highlight("String", c.green, c.bg)               -- Literales de cadena

-- Variables y delimitadores
set_highlight("Variable", c.fg, c.bg)   -- Variables
set_highlight("Identifier", c.fg, c.bg) -- Identificadores
set_highlight("Delimiter", c.fg, c.bg)  -- Delimitadores

-- Comentarios y documentación
set_highlight("Comment", c.br_black, c.bg, "cterm=italic")    -- Comentarios
set_highlight("DocComment", c.br_black, c.bg, "cterm=italic") -- Comentarios de documentación

-- Números de línea
set_highlight("LineNr", c.br_black, c.bg)                  -- Números de línea
set_highlight("CursorLineNr", c.white, c.bg, "cterm=bold") -- Número de línea actual resaltado

-- Comentarios `TODO`, `FIXME`, etc.
set_highlight("Todo", c.green, c.bg, "cterm=italic") -- Comentarios `TODO`
set_highlight("Debug", c.red, c.bg, "cterm=italic")  -- Declaraciones de depuración

-- Títulos y negrita
set_highlight("Title", c.blue, c.bg, "cterm=bold") -- Títulos de ventanas
set_highlight("Bold", nil, nil, "cterm=bold")      -- Negrita

-- Configuración de Treesitter
set_highlight("@function", c.blue, c.bg)              -- Nombres de funciones
set_highlight("@function.macro", c.blue, c.bg)        -- Nombres de funciones
set_highlight("@function.attribute", c.magenta, c.bg) -- Atributos de funciones
set_highlight("@attribute", c.magenta, c.bg)          -- Atributos
set_highlight("@method", c.blue, c.bg)                -- Métodos de objetos
set_highlight("@keyword.function", c.magenta, c.bg)   -- Palabras clave de funciones
set_highlight("@parameter", c.red, c.bg)              -- Parámetros de funciones
set_highlight("@keyword", c.magenta, c.bg)            -- Palabras clave generales
set_highlight("@variable", c.fg, c.bg)                -- Variables
set_highlight("@constant", c.red, c.bg, "cterm=bold") -- Constantes
set_highlight("@string", c.green, c.bg)               -- Cadenas de texto
set_highlight("@number", c.red, c.bg)                 -- Números
set_highlight("@operator", c.white, c.bg)             -- Operadores
set_highlight("@type", c.cyan, c.bg)                  -- Tipos de datos
set_highlight("@type.builtin", c.cyan, c.bg)          -- Tipos de datos incorporados
set_highlight("@tag", c.yellow, c.bg)                 -- Etiquetas
set_highlight("@tag.attribute", c.yellow, c.bg)       -- Atributos en etiquetas

-- Configuración de LSP
set_highlight("LspReferenceText", c.black, c.bg)                    -- Resaltar referencias de texto
set_highlight("LspReferenceRead", c.black, c.bg)                    -- Resaltar referencias de lectura
set_highlight("LspReferenceWrite", c.black, c.bg)                   -- Resaltar referencias de escritura
set_highlight("LspSignatureActiveParameter", c.yellow, c.bg)        -- Parámetro activo en la firma de la función
set_highlight("LspDiagnosticsError", c.red, c.bg)                   -- Mensajes de error en LSP
set_highlight("LspDiagnosticsWarning", c.yellow, c.bg)              -- Mensajes de advertencia en LSP
set_highlight("LspDiagnosticsVirtualTextError", c.red, c.bg)        -- Error en texto virtual
set_highlight("LspDiagnosticsVirtualTextWarning", c.yellow, c.bg)   -- Advertencia en texto virtual
set_highlight("LspDiagnosticsVirtualTextInformation", c.blue, c.bg) -- Información en texto virtual
set_highlight("LspDiagnosticsVirtualTextHint", c.cyan, c.bg)        -- Sugerencia en texto virtual
set_highlight("LspDiagnosticsInformation", c.blue, c.bg)            -- Información de LSP
set_highlight("LspDiagnosticsHint", c.cyan, c.bg)                   -- Sugerencia de LSP
