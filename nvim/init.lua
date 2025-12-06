vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require('init')

---------------------------------------------------------------
---SOME TRASPARENCY CODE AND COLORSCHME CODE
---------------------------------------------------------------

local function set_line_number_highlights()
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })  -- Regular line number
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#858585" })  -- Line numbers below
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#858585" })  -- Line numbers above
end

local function set_cursor_line_nr_highlight()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",  -- Trigger for any colorscheme
    callback = function()
        set_line_number_highlights()  -- Set custom line number highlights
        set_cursor_line_nr_highlight()  -- Set custom CursorLineNr color
    end,
})
-- Apply the highlights after a colorscheme is applied
local function apply_colorscheme_and_set_defaults(scheme)
    vim.cmd("colorscheme " .. scheme)
end
apply_colorscheme_and_set_defaults("tokyonight-storm")

local function make_nvim_tree_transparent()
        local hl_groups = {
          --NvimTree
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeCursorLine",
          "NvimTreeStatusLine",
          "NvimTreeStatusLineNC",
          "NvimTreeVertSplit",
          "NvimTreeEndOfBuffer",
          "NvimTreeWinSeparator",  -- Often missed group
          --Telescope
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",
          "TelescopeSelection",
          "TelescopePromptPrefix",
          "TelescopePromptNormal",
          "TelescopeResultsTitle",
          "TelescopePreviewTitle",
          --VimBeGood
          "VimBeGoodNormal",       -- Main background for the game window
          "VimBeGoodBorder",       -- Border around the game UI
          "VimBeGoodPrompt",       -- Prompt or instruction text area
          "VimBeGoodSelection",    -- Highlighted selection or active area
          "VimBeGoodStatusLine",
        }

        for _, group in ipairs(hl_groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end

      -- Apply on startup
      make_nvim_tree_transparent()

      -- Re-apply when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = make_nvim_tree_transparent,
      })
