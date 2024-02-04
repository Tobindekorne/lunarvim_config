lvim.plugins = {
  { "tpope/vim-surround" },
  { "jubnzv/virtual-types.nvim" },
  { "VidocqH/lsp-lens.nvim" },
  { "chrisgrieser/nvim-dr-lsp" },
  { "dnlhc/glance.nvim" },

  -- Colorschemes
  { "folke/tokyonight.nvim" },
  { "arcticicestudio/nord-vim" },
  { "mfussenegger/nvim-jdtls" },
  { "TovarishFin/vim-solidity" },
  { "scottmckendry/cyberdream.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "catppuccin/nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "shaunsingh/nord.nvim" },
  { "EdenEast/nightfox.nvim" },

  { "soulis-1256/hoverhints.nvim" },

  { "lewis6991/gitsigns.nvim" },
  { "sindrets/diffview.nvim" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  { "ThePrimeagen/harpoon" },
  { "mg979/vim-visual-multi" },
  { "wellle/context.vim" },
  -- {
  --     "iamcco/markdown-preview.nvim",
  --     run = "cd app && npm install",
  --     ft = "markdown",
  --     config = function()
  --         vim.g.mkdp_auto_start = 0
  --     end,
  -- },
  { "rafi/awesome-vim-colorschemes" },
  { "s1n7ax/nvim-window-picker" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
}

require("gitsigns")
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = {
  delay = 200,
}
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
