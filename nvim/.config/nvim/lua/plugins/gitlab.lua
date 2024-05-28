return {
  -- {
  --   "williamboman/mason-lspconfig",
  --   dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
  --   opts = {
  --     servers = {
  --       gitlab_ci_ls = {},
  --     },
  --   },
  -- },
  {
    "williamboman/mason-lspconfig",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "gitlab_ci_ls",
      })
    end,
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
}
