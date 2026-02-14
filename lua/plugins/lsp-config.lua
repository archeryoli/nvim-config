return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vue_ls",
          "ts_ls",
          "pyright",
        },
        automatic_enable = {
          exclude = {
            "rust_analyzer",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
      },
    },
    config = function()
      --local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config('lua', {
        cmd = { "lua_ls" },
        filetypes = { "lua" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            }
          }
        },
      });
      vim.lsp.enable('lua');

      local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      vim.lsp.config('vue', {});
      vim.lsp.enable('vue_ls');

      local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
          '/vue-language-server' .. '/node_modules/@vue/language-server';
      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      local ts_ls_config = {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
      }

      vim.lsp.config('ts_ls', ts_ls_config);

      vim.lsp.enable('ts_ls');
      vim.lsp.enable('pyright');
      vim.lsp.enable('sqlls');
      vim.lsp.enable('csharp_ls');
      vim.lsp.enable('postgres_lsp');

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
