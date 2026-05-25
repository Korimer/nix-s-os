return {
  'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = {
          lua = { "stylua" };
          nix = { "nixfmt" };
          python = { "autopep8" };
        }
      },
    config = function (_, opts)
      require('conform').setup(opts)
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end
}
