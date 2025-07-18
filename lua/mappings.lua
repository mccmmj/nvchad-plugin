require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Custom command to install all Mason packages
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat({
    "black",
    "clangd", 
    "clang-format",
    "cpplint",
    "eslint-lsp",
    "eslint_d", 
    "prettier",
    "html-lsp",
    "css-lsp",
    "pylint",
    "mypy",
    "ruff",
    "python-lsp-server",
    "typescript-language-server",
    "lua-language-server"
  }, " "))
end, {})
