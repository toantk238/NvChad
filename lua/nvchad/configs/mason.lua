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
    "autotools-language-server",
    "texlab",
    "latexindent",
    "gopls"
  }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
