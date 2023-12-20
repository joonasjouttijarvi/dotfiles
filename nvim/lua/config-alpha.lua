local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

function DayLeft()
	local now = os.date("*t")
	local totalSeconds = 24 * 60 * 60
	local secondsPassed = now.hour * 60 * 60 + now.min * 60 + now.sec
	local dayLeftPercentage = (totalSeconds - secondsPassed) / totalSeconds * 100
	return dayLeftPercentage
end
function MonthLeft()
	local now = os.date("*t")
	local totalDaysInMonth = os.date("*t", os.time({ year = now.year, month = now.month + 1, day = 0 })).day
	local monthLeftPercentage = (totalDaysInMonth - now.day) / totalDaysInMonth * 100
	return monthLeftPercentage
end
function YearLeft()
	local now = os.date("*t")
	local yearStart = os.time({ year = now.year, month = 1, day = 1 })
	local yearEnd = os.time({ year = now.year + 1, month = 1, day = 1 })
	local totalSecondsInYear = yearEnd - yearStart
	local secondsPassedThisYear = os.time() - yearStart
	local yearLeftPercentage = (totalSecondsInYear - secondsPassedThisYear) / totalSecondsInYear * 100
	return yearLeftPercentage
end
function LifeLeft()
	local birthYear = 1994
	local currentYear = os.date("*t").year
	local age = currentYear - birthYear
	local lifeLeftPercentage = (79 - age) / 79 * 100
	return lifeLeftPercentage
end

dashboard.section.header.val = {
	"DAY Left " .. string.format("%.2f", DayLeft()) .. "%",
	"MONTH Left " .. string.format("%.2f", MonthLeft()) .. "%",
	"YEAR Left " .. string.format("%.2f", YearLeft()) .. "%",
	"LIFE Left " .. string.format("%.2f", LifeLeft()) .. "%",
}

dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("p", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("b", "  Bookmarks", ":Telescope marks <CR>"),
	dashboard.button("c", "  Config", ":e ~/.config/nvim <CR>"),
	dashboard.button("s", "  Session", ":Telescope session-lens search_session<CR>"),
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
