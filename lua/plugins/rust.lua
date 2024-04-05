return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {}
      },
    },
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
          end
        }
      }
    end
  },
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    init = function()
      --[[ vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_fail_silently = 1 ]]
    end,
  }, --[[ {
    'simrat39/rust-tools.nvim',
    ft = { 'rust' },
    config = function ()
      -- require('rust-tools').inlay_hints.enable()
      require('rust-tools').setup()
    end
  } ]]
}
