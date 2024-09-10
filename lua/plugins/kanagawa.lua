require("kanagawa").setup({
  compile = true,
  dimInactive = true,
  overrides = function(colors)
    local theme = colors.theme
    return {
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
      PmenuKind = { link = "Pmenu" },
      PmenuKindSel = { link = "PmenuSel" },
      PmenuMatch = { bg = theme.ui.bg_p1, fg = theme.syn.fun },
      PmenuMatchSel = { bg = theme.ui.bg_p2, fg = theme.syn.fun },
    }
  end,
})
