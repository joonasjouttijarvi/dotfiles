local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {

    " Pas d'honneur parmi les voleurs ",
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("p", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("b", "  Bookmarks", ":Telescope marks <CR>"),
    dashboard.button("c", "  Config", ":e ~/.config/nvim <CR>"),
    dashboard.button("s", "  Sessions", ":lua require('auto-session.session-lens').search_session() <CR>"),
    dashboard.button("q", "  Quit", ":qa <CR>"),
}

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

-- footer with date and time

local footer = require("alpha.themes.dashboard")

footer.section.footer.val = {
    "  " .. os.date(" %H:%M "),
    "  " .. os.date("%d/%m/%Y"),
}
dashboard.section.footer.opts.hl = "AlphaFooter"
