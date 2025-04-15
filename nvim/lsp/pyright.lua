<<<<<<< HEAD
---@brief
---
-- https://github.com/microsoft/pyright
--
-- `pyright`, a static type checker and language server for python
return {
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        root_markers = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
                'pyrightconfig.json',
                '.git',
        },
        settings = {
                python = {
                        analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = 'openFilesOnly',
                        },
                },
        },
=======
return {
        cmd = { 'pyright' },
        filetypes = { 'py' },
        root_markers = { '.git', 'bin', 'include' }
>>>>>>> origin/HEAD
}
