pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

local options = {
  ensure_installed = {
    "lua",
    "luadoc",
    "printf",
    "vim",
    "vimdoc",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "tsx",
    "typescript",
    "kotlin",
    "python",
    "java",
    "ruby",
    "yaml",
    "dockerfile",
    "sql",
    "swift",
    "terraform",
    "hurl",
    "rust",
    "make",
    "cmake",
    "markdown_inline",
    "hjson",
    "dart",
    "go"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
