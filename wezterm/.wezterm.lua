local wezterm = require("wezterm")

return {
    default_prog = { "powershell.exe", "-NoLog" },
    font = wezterm.font("DejaVuSansM Nerd Font"),
    font_size = 9.0,
    initial_cols = 200,
    initial_rows = 65,
    color_scheme = "BlulocoDark",
    leader = { key = "b", mods = "CTRL" },
    keys = {
        -- ペイン分割(縦)
        {
            key = "-",
            mods = "LEADER",
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
        },
        -- ペイン分割(横)
        {
            key = "|",
            mods = "LEADER",
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
        },
        -- ペインを閉じる
        {
            key = "x",
            mods = "LEADER",
            action = wezterm.action.CloseCurrentPane { confirm = true },
        },
        -- ペイン異動(h,j,k,l)
        {
            key = "h",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection "Left",
        },
        {
            key = "l",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection "Right",
        },
        {
            key = "j",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection "Down",
        },
        {
            key = "k",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection "Up"
        },
        -- ペインサイズ変更
        {
            key = "H",
            mods = "LEADER",
            action = wezterm.action.AdjustPaneSize{"Left", 1},
        },
        {
            key = "L",
            mods = "LEADER",
            action = wezterm.action.AdjustPaneSize{"Right", 1},
        },
        {
            key = "J",
            mods = "LEADER",
            action = wezterm.action.AdjustPaneSize{"Down", 1}
        },
        {
            key = "K",
            mods = "LEADER",
            action = wezterm.action.AdjustPaneSize{"Up", 1}
        }
    }
}
