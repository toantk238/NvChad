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
    "go",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = function(lang, buf)
      local max_filesize = 1000 * 1024 -- 1000 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  indent = { enable = true },
}

return options
