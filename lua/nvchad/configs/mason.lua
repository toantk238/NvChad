dofile(vim.g.base46_cache .. "mason")
local options = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- "tsserver",
    "deno",
    "prettier",
    -- "emmet-ls",
    "json-lsp",
    -- "tailwindcss-language-server",
    "unocss-language-server",
    -- "emmet-language-server",

    -- shell
    "shfmt",
    "shellcheck",
    "bash-language-server",

    -- "clangd",
    -- "clang-format",
    -- xml
    "lemminx",
    "xmlformatter",

    -- ruby
    -- "rubocop",
    -- "solargraph",

    -- python
    "pyright",
    "autopep8",
    "debugpy",
    -- markdown
    "marksman",
    -- yaml
    "yaml-language-server",
    "yamlfmt",
    "yamllint",
    -- kotlin
    -- "kotlin-language-server"
    "ktlint",
    "terraform-ls",
    -- java
    "google-java-format",
    -- rust
    "rust-analyzer",
    -- cmake
    "cmake-language-server",
    -- make file
    -- "autotools-language-server",
    "texlab",
    "latexindent",
    "gopls"
  }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,
}

return options
