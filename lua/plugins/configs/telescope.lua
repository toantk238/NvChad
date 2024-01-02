local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-g",
      "!{jquery,bootstrap,font-awesome,js}",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
    -- preview = {
    --   filetype_hook = function(filepath, bufnr, opts)
    --     local api = require "image"
    --     local preview_id = "telescope_image_id"
    --     api.clear(preview_id)
    --
    --     local is_image = function(filepath)
    --       local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
    --       local split_path = vim.split(filepath:lower(), ".", { plain = true })
    --       local extension = split_path[#split_path]
    --       return vim.tbl_contains(image_extensions, extension)
    --     end
    --     if is_image(filepath) then
    --       local image = api.from_file(filepath, {
    --         id = preview_id,
    --         buffer = bufnr,
    --         x = 110,
    --         y = 20,
    --       })
    --       if image ~= nil then
    --         image:render()
    --       end
    --       -- local term = vim.api.nvim_open_term(bufnr, {})
    --       -- local function send_output(_, data, _)
    --       --   for _, d in ipairs(data) do
    --       --     vim.api.nvim_chan_send(term, d .. "\r\n")
    --       --   end
    --       -- end
    --       -- vim.fn.jobstart({
    --       --   -- "viu", "-w", "80", "-b", filepath,
    --       --   "kitty", "+kitten", "icat", filepath, -- Terminal image viewer command
    --       -- }, {
    --       --   on_stdout = send_output,
    --       --   stdout_buffered = true,
    --       --   pty = true,
    --       -- })
    --     else
    --       return true
    --     end
    --     return false
    --   end,
    -- },
  },

  extensions_list = { "themes", "terms" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

return options
