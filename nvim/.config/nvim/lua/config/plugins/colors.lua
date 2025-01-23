return {
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        typeStyle = {},
        statementStyle = { bold = true },
        transparent = false,
        dimInactive = true,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = "wave",
        -- background = {
        --   dark = "dragon",
        --   light = "lotus",
        -- },
      })

      vim.cmd.colorscheme "kanagawa"
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFload", { bg = "none" })
    end
  },
}
