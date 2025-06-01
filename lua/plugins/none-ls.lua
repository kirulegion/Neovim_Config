return {
  { "https://github.com/rust-lang/rustfmt" },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local rustfmt = {
        name = "rustfmt",
        method = null_ls.methods.FORMATTING,
        filetypes = { "rust" },
        generator = null_ls.formatter({
          command = "rustfmt",
          args = { "--emit=stdout" },
          to_stdin = true,
        }),
      }
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          rustfmt,
        },
      })
    end,
  },
}
