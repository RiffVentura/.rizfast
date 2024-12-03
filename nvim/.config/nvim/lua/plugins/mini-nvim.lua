return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local queries = require 'nvim-treesitter.query'

      local miniAiTreesitter = function(ai_type, _, _, query_list)
        ai_type = ai_type == 'a' and '.outer' or '.inner'
        query_list = vim.tbl_map(function(query)
          return query .. ai_type
        end, query_list)

        local matches = {}
        for _, query in pairs(query_list) do
          vim.list_extend(matches, queries.get_capture_matches_recursively(0, query, 'textobjects'))
        end

        matches = vim.tbl_map(function(match)
          local from_line, from_col, to_line, to_col = match.node:range()
          return {
            from = { line = from_line + 1, col = from_col + 1 },
            to = { line = to_line + 1, col = to_col + 1 },
          }
        end, matches)

        return matches
      end

      local miniAiTreeWrapper = function(query_list)
        if type(query_list) ~= 'table' then
          query_list = { query_list }
        end
        return function(ai_type, _, opts)
          return miniAiTreesitter(ai_type, _, opts, query_list)
        end
      end
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          o = miniAiTreeWrapper { '@block', '@conditional', '@loop' },
          s = miniAiTreeWrapper { '@function', '@class' },
          c = miniAiTreeWrapper '@comment',
        },
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
