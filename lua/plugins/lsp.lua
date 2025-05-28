return {
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "tailwindcss",
          "html",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "lua", "rust", "typescript", "javascript", "python", "css", "c", "cpp", "json", "html", "zig", "odin" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Shared on_attach function
      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        -- Core keymaps from LSP-1
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

        -- Additional keymaps from LSP-2, optimized
        local tele = require("telescope.builtin")
        map("<leader>fr", tele.lsp_references, "Goto References")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>E", vim.diagnostic.open_float, "Show Diagnostics")
        map("<leader>wf", vim.lsp.buf.format, "Format Buffer")

        -- Visual mode code action
        vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })
      end

      -- Configure each server with capabilities and on_attach
      local servers = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
        "tailwindcss",
        "pyright",
        "clangd",
        "jsonls",
        "html",
        "zls",
        "ols",
      }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- Optional: Add jdtls or eslint for specific projects
      -- Example for jdtls (uncomment and configure as needed)
      -- lspconfig.jdtls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
      -- })
    end,
  },
}
