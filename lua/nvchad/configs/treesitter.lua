pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

local options = {
  auto_install = true,
  languages = {
    smarty = {
      install_info = {
        url = "https://github.com/Kibadda/tree-sitter-smarty",
        files = { "src/parser.c" },
        branch = "main",
        queries = "queries",
      },
    },
  },
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
    "go",
    "latex",
    "gn",
  },
}

return options
