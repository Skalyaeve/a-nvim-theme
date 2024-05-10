--=========================== UTILS
local function HsvToRgb(h, s, v, silent)
    s = s / 100.0
    v = v / 100.0
    h = h / 60.0

    local i = math.floor(h) % 6
    local f = h - math.floor(h)
    local p = v * (1.0 - s)
    local q = v * (1.0 - f * s)
    local t = v * (1.0 - (1.0 - f) * s)

    local r, g, b = 0, 0, 0

    if i == 0 then
        r, g, b = v, t, p
    elseif i == 1 then
        r, g, b = q, v, p
    elseif i == 2 then
        r, g, b = p, v, t
    elseif i == 3 then
        r, g, b = p, q, v
    elseif i == 4 then
        r, g, b = t, p, v
    else
        r, g, b = v, p, q
    end

    r = math.floor(r * 255 + 0.5)
    g = math.floor(g * 255 + 0.5)
    b = math.floor(b * 255 + 0.5)

    if not silent then
        print(string.format("#%02x%02x%02x", r, g, b))
    end
    return string.format("#%02x%02x%02x", r, g, b)
end

local function SetHl(group, mod, fg, bg)
    vim.cmd(string.format("highlight "..
        "%s gui=%s guifg=%s guibg=%s cterm=%s ctermfg=%s ctermbg=%s",
        group, mod[1], fg[1], bg[1], mod[2], fg[2], bg[2]))
end

--============================= COLORS
local colors = {
    black = {HsvToRgb(0, 0, 0, 1), 0},
    black_l = {HsvToRgb(0, 0, 7, 1), 0},
    gray_dd = {HsvToRgb(0, 0, 18, 1), 8},
    gray_d = {HsvToRgb(0, 0, 34, 1), 8},
    gray = {HsvToRgb(0, 0, 50, 1), 7},
    gray_l = {HsvToRgb(0, 0, 66, 1), 7},
    gray_ll = {HsvToRgb(0, 0, 82, 1), 7},
    white_d = {HsvToRgb(0, 0, 93, 1), 15},
    white = {HsvToRgb(0, 0, 100, 1), 15},
    red_d = {HsvToRgb(0, 100, 75, 1), 12},
    red = {HsvToRgb(0, 100, 100, 1), 12},
    red_l = {HsvToRgb(0, 75, 100, 1), 12},
    orange_d = {HsvToRgb(30, 100, 75, 1), 4},
    orange = {HsvToRgb(30, 100, 100, 1), 4},
    orange_l = {HsvToRgb(30, 75, 100, 1), 4},
    yellow_d = {HsvToRgb(60, 100, 75, 1), 14},
    yellow = {HsvToRgb(60, 100, 100, 1), 14},
    yellow_l = {HsvToRgb(60, 75, 100, 1), 14},
    chartreuse_d = {HsvToRgb(90, 100, 75, 1), 6},
    chartreuse = {HsvToRgb(90, 100, 100, 1), 6},
    chartreuse_l = {HsvToRgb(90, 75, 100, 1), 6},
    green_d = {HsvToRgb(120, 100, 75, 1), 10},
    green = {HsvToRgb(120, 100, 100, 1), 10},
    green_l = {HsvToRgb(120, 75, 100, 1), 10},
    turquoise_d = {HsvToRgb(150, 100, 75, 1), 2},
    turquoise = {HsvToRgb(150, 100, 100, 1), 2},
    turquoise_l = {HsvToRgb(150, 75, 100, 1), 2},
    cyan_d = {HsvToRgb(180, 100, 75, 1), 11},
    cyan = {HsvToRgb(180, 100, 100, 1), 11},
    cyan_l = {HsvToRgb(180, 75, 100, 1), 11},
    royal_d = {HsvToRgb(210, 100, 75, 1), 3},
    royal = {HsvToRgb(210, 100, 100, 1), 3},
    royal_l = {HsvToRgb(210, 75, 100, 1), 3},
    blue_d = {HsvToRgb(240, 100, 75, 1), 9},
    blue = {HsvToRgb(240, 100, 100, 1), 9},
    blue_l = {HsvToRgb(240, 75, 100, 1), 9},
    purple_d = {HsvToRgb(270, 100, 75, 1), 1},
    purple = {HsvToRgb(270, 100, 100, 1), 1},
    purple_l = {HsvToRgb(270, 75, 100, 1), 1},
    pink_d = {HsvToRgb(300, 100, 75, 1), 13},
    pink = {HsvToRgb(300, 100, 100, 1), 13},
    pink_l = {HsvToRgb(300, 75, 100, 1), 13},
    salmon_d = {HsvToRgb(330, 100, 75, 1), 5},
    salmon = {HsvToRgb(330, 100, 100, 1), 5},
    salmon_l = {HsvToRgb(330, 75, 100, 1), 5},
    none = {"NONE", "NONE"}
}

--============================= MODIFIERS
local mods = {
    bold = {"bold", "bold"},
    italic = {"italic", "italic"},
    underline = {"underline", "underline"},
    undercurl = {"undercurl", "undercurl"},
    reverse = {"reverse", "reverse"},
    standout = {"standout", "standout"},
    strikethrough = {"strikethrough", "strikethrough"},
    none = {"NONE", "NONE"}
}

--============================= SETUP - GENERAL - EDITOR
SetHl("Title", mods["bold"], colors["turquoise_l"], colors["none"])
SetHl("Directory", mods["none"], colors["purple_l"], colors["none"])
SetHl("Question", mods["none"], colors["purple_l"], colors["none"])
SetHl("ErrorMsg", mods["none"], colors["red_l"], colors["none"])
SetHl("WarningMsg", mods["none"], colors["orange_l"], colors["none"])
SetHl("CursorLineNr", mods["none"], colors["yellow_l"], colors["gray_dd"])
SetHl("Normal", mods["none"], colors["white"], colors["black_l"])
SetHl("LineNrAbove", mods["italic"], colors["white"], colors["none"])
SetHl("LineNrBelow", mods["italic"], colors["white"], colors["none"])
SetHl("StatusLine", mods["bold"], colors["white"], colors["gray_dd"])
SetHl("StatusLineNC", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("StatusLineTerm", mods["none"], colors["white"], colors["gray_dd"])
SetHl("StatusLineTermNC", mods["none"], colors["white"], colors["gray_dd"])
SetHl("TabLine", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("TabLineSel", mods["bold"], colors["white"], colors["gray_dd"])
SetHl("TabLineFill", mods["none"], colors["none"], colors["gray_dd"])
SetHl("Terminal", mods["none"], colors["white"], colors["none"])
SetHl("PopupNotification", mods["none"], colors["white"], colors["none"])
SetHl("LineNr", mods["italic"], colors["gray"], colors["none"])
SetHl("VertSplit", mods["none"], colors["gray"], colors["gray_dd"])
SetHl("EndOfBuffer", mods["none"], colors["gray_d"], colors["none"])
SetHl("CursorLine", mods["none"], colors["none"], colors["gray_dd"])
SetHl("CursorColumn", mods["none"], colors["none"], colors["gray_dd"])
SetHl("Visual", mods["none"], colors["none"], colors["gray_d"])
SetHl("MatchParen", mods["bold"], colors["yellow_l"], colors["gray_d"])
SetHl("Search", mods["bold"], colors["yellow_l"], colors["gray_d"])

--============================= SETUP - GENERAL - MENU
SetHl("Pmenu", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("PmenuSel", mods["bold"], colors["white"], colors["gray_dd"])
SetHl("PmenuKind", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("PmenuKindSel", mods["bold"], colors["white"], colors["gray_dd"])
SetHl("PmenuExtra", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("PmenuExtraSel", mods["bold"], colors["gray"], colors["gray_dd"])
SetHl("PmenuSbar", mods["none"], colors["white"], colors["gray_dd"])
SetHl("PmenuPmenuThumb", mods["none"], colors["gray"], colors["gray_dd"])

--============================= SETUP - GENERAL - FILE EXPLORER
SetHl("netrwVersion", mods["italic"], colors["turquoise_l"], colors["none"])
SetHl("netrwList", mods["italic"], colors["royal_l"], colors["none"])
SetHl("netrwHelpCmd", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("netrwSymLink", mods["none"], colors["cyan_l"], colors["none"])
SetHl("netrwClassify", mods["none"], colors["purple_d"], colors["none"])

--============================= SETUP - GENERAL - IDK
SetHl("SpecialKey", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("MoreMsg", mods["none"], colors["green_l"], colors["none"])
SetHl("NonText", mods["none"], colors["royal_l"], colors["none"])
SetHl("WildMenu", mods["none"], colors["white"], colors["orange_d"])
SetHl("Folded", mods["none"], colors["white"], colors["purple_d"])
SetHl("Conceal", mods["none"], colors["white"], colors["gray_d"])
SetHl("FoldColumn", mods["bold"], colors["purple_d"], colors["none"])
SetHl("CursorLineFold", mods["bold"], colors["purple_d"], colors["none"])
SetHl("IncSearch", mods["none"], colors["white"], colors["gray_d"])
SetHl("MessageWindow", mods["none"], colors["white"], colors["none"])
SetHl("ModeMsg", mods["none"], colors["white"], colors["none"])
SetHl("CursorLineSign", mods["none"], colors["gray"], colors["none"])
SetHl("SignColumn", mods["none"], colors["gray"], colors["none"])
SetHl("QuickFixLine", mods["bold"], colors["yellow_d"], colors["gray_d"])
SetHl("CurSearch", mods["bold"], colors["yellow_d"], colors["gray_d"])
SetHl("ColorColumn", mods["bold"], colors["salmon_d"], colors["gray_d"])
SetHl("SepllBad", mods["bold"], colors["orange_d"], colors["gray_d"])
SetHl("SpellCap", mods["bold"], colors["royal_d"], colors["gray_d"])
SetHl("SpellLocal", mods["bold"], colors["cyan_d"], colors["gray_d"])
SetHl("SpellRare", mods["bold"], colors["pink_d"], colors["gray_d"])
SetHl("DiffAdd", mods["bold"], colors["royal_d"], colors["gray_d"])
SetHl("DiffChange", mods["bold"], colors["purple_d"], colors["gray_d"])
SetHl("DiffDelete", mods["bold"], colors["orange_d"], colors["gray_d"])
SetHl("DiffText", mods["bold"], colors["red_d"], colors["gray_d"])

--============================= SETUP - ADDONS - LAZY
SetHl("LazyH1", mods["none"], colors["salmon_l"], colors["none"])
SetHl("LazyH2", mods["none"], colors["white"], colors["none"])
SetHl("LazySpecial", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyButton", mods["none"], colors["white"], colors["none"])
SetHl("LazyButtonActive", mods["bold"], colors["white"], colors["none"])
SetHl("LazyComment", mods["italic"], colors["white"], colors["none"])
SetHl("LazyReasonPlugin", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyReasonCmd", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyReasonEvent", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyReasonStart", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyReasonImport", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("LazyNormal", mods["none"], colors["white"], colors["gray_dd"])

--============================= SETUP - ADDONS - NERD TREE
SetHl("NERDTreeCWD", mods["none"], colors["salmon_l"], colors["none"])
SetHl("NERDTreeLinkFile", mods["none"], colors["cyan_l"], colors["none"])
SetHl("NERDTreeLinkTarget", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("NERDTreeCurrentNode", mods["none"], colors["red_l"], colors["none"])
SetHl("NERDTreeDirSlash", mods["none"], colors["purple_d"], colors["none"])

--============================= SETUP - ADDONS - TELESCOPE
SetHl("TelescopeTitle", mods["none"], colors["salmon_l"], colors["none"])
SetHl("TelescopePromptPrefix", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("TelescopeMatching", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("TelescopePromptCounter", mods["italic"], colors["gray_l"], colors["none"])
SetHl("TelescopeResultsDiffAdd", mods["bold"], colors["royal_l"], colors["none"])
SetHl("TelescopeResultsDiffChange", mods["bold"], colors["purple_l"], colors["none"])
SetHl("TelescopeResultsDiffDelete", mods["bold"], colors["orange_l"], colors["none"])
SetHl("TelescopePreviewMatch", mods["bold"], colors["yellow_l"], colors["none"])

--============================= SETUP - ADDONS - COPILOT
SetHl("CopilotSuggestion", mods["italic"], colors["gray_d"], colors["none"])

--============================= SETUP - SYNTAX - GENERAL
SetHl("Statement", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("PreProc", mods["none"], colors["royal_l"], colors["none"])
SetHl("Identifier", mods["none"], colors["royal"], colors["none"])
SetHl("Type", mods["none"], colors["royal_d"], colors["none"])
SetHl("Constant", mods["none"], colors["white"], colors["none"])
SetHl("String", mods["italic"], colors["white"], colors["none"])
SetHl("Comment", mods["italic"], colors["gray"], colors["none"])
SetHl("Special", mods["none"], colors["gray"], colors["none"])

SetHl("@keyword", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@keyword.import", mods["none"], colors["purple"], colors["none"])
SetHl("@function", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("@function.builtin", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("@module", mods["none"], colors["royal_l"], colors["none"])
SetHl("@constant", mods["none"], colors["royal"], colors["none"])
SetHl("@variable", mods["none"], colors["royal"], colors["none"])
SetHl("@operator", mods["none"], colors["white"], colors["none"])
SetHl("@punctuation", mods["none"], colors["white"], colors["none"])

--============================= SETUP - SYNTAX - MARKDOWN
SetHl("@markup.heading.1.markdown", mods["underline"], colors["salmon_l"], colors["none"])
SetHl("@markup.heading.2.markdown", mods["underline"], colors["salmon_l"], colors["none"])
SetHl("@markup.heading.3.markdown", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@markup.heading.4.markdown", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@markup.heading.5.markdown", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@markup.heading.6.markdown", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@markup.quote.markdown", mods["none"], colors["gray_l"], colors["gray_dd"])
SetHl("@markup.list.markdown", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("@markup.list.checked.markdown", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("@markup.list.unchecked.markdown", mods["none"], colors["turquoise_d"], colors["none"])
SetHl("@markup.link.markdown_inline", mods["none"], colors["royal_d"], colors["none"])
SetHl("@markup.link.url.markdown_inline", mods["none"], colors["royal_l"], colors["none"])

--============================= SETUP - SYNTAX - MAKEFILE
SetHl("@string.special.symbol.make", mods["none"], colors["royal"], colors["none"])
SetHl("@operator.make", mods["none"], colors["royal_l"], colors["none"])

--============================= SETUP - SYNTAX - SH/BASH
SetHl("@punctuation.bracket.bash", mods["none"], colors["salmon_l"], colors["none"])
SetHl("@punctuation.delimiter.bash", mods["none"], colors["salmon_d"], colors["none"])
SetHl("@variable.parameter.bash", mods["none"], colors["turquoise_d"], colors["none"])
SetHl("@punctuation.special.bash", mods["none"], colors["royal_l"], colors["none"])
SetHl("@character.special.bash", mods["none"], colors["purple_l"], colors["none"])

--============================= SETUP - SYNTAX - MAKEFILE
SetHl("@tag.css", mods["none"], colors["turquoise_l"], colors["none"])
SetHl("@function.css", mods["none"], colors["orange_l"], colors["none"])

--============================= MISC
vim.cmd("hi normal guibg=NONE ctermbg=NONE")
