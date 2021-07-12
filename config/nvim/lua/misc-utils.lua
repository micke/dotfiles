local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt("o", "compatible", false)
opt("o", "hidden", true)
opt("o", "backup", false)
opt("o", "autoindent", true)
opt("o", "writebackup", false)
opt("o", "swapfile", false)
opt("o", "history", 500)
opt("o", "ruler", false)
opt("o", "showcmd", true)
opt("o", "showmode", false)
opt("o", "autowrite", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("o", "joinspaces", false)
opt("o", "gdefault", true)
opt("o", "wrap", false)

opt("o", "wildmode", "longest:full,list:full")

opt("o", "undodir", "~/.vim/undodir")
opt("o", "undofile", true)

opt("o", "mouse", "a")

opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

opt("o", "updatetime", 250)
opt("o", "clipboard", "unnamedplus")

opt("w", "number", true)
opt("o", "numberwidth", 2)
opt("o", "relativenumber", true)

opt("o", "incsearch", true)
opt("o", "inccommand", "nosplit")
opt("o", "grepprg", "rg --vimgrep")

-- for indenline
opt("b", "expandtab", true)
opt("b", "shiftwidth", 2)
opt("b", "smartindent", true)

opt("o", "formatoptions", string.gsub(vim.o.formatoptions, "[at]", "")) -- Disable autoformatting
opt("o", "formatoptions", vim.o.formatoptions .. "c") -- Respect textwidth in comments
opt("o", "formatoptions", vim.o.formatoptions .. "q") -- Format comments with gq
opt("o", "formatoptions", string.gsub(vim.o.formatoptions, "[o]", "")) -- Don"t continue comments with o and O
opt("o", "formatoptions", vim.o.formatoptions .. "r") -- Enter continues comments
opt("o", "formatoptions", vim.o.formatoptions .. "n") -- Indent past the formatlistpat, not underneath it.
opt("o", "formatoptions", vim.o.formatoptions .. "j") -- Auto-remove comments if possible.
opt("o", "formatoptions", string.gsub(vim.o.formatoptions, "2", ""))

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end
-- file extension specific tabbing
vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
return M
