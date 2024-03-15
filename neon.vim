"================================================ UTILS
function! HsvToRgb(h, s, v, ...)
    " ... = [silent mode]
    let s = a:s / 100.0
    let v = a:v / 100.0
    let h = a:h / 60.0

    let i = float2nr(floor(h)) % 6
    let f = h - floor(h)
    let p = v * (1.0 - s)
    let q = v * (1.0 - f * s)
    let t = v * (1.0 - (1.0 - f) * s)

    let r = 0
    let g = 0
    let b = 0

    if i == 0
        let r = v
        let g = t
        let b = p
    elseif i == 1
        let r = q
        let g = v
        let b = p
    elseif i == 2
        let r = p
        let g = v
        let b = t
    elseif i == 3
        let r = p
        let g = q
        let b = v
    elseif i == 4
        let r = t
        let g = p
        let b = v
    else
        let r = v
        let g = p
        let b = q
    endif
    let r = float2nr(floor(r * 255 + 0.5))
    let g = float2nr(floor(g * 255 + 0.5))
    let b = float2nr(floor(b * 255 + 0.5))

    let silent = 0
    if a:0 > 0
        let silent = a:1
    endif

    if !silent
        echo printf("#%02x%02x%02x", r, g, b)
    endif
    return printf("#%02x%02x%02x", r, g, b)
endfunction

function! SetHighlight(group, mod, fg, bg)
    execute 'highlight' a:group
                \ 'gui=' . a:mod[0]
                \ 'guifg=' . a:fg[0]
                \ 'guibg=' . a:bg[0]
                \ 'cterm=' . a:mod[1]
                \ 'ctermfg=' . a:fg[1]
                \ 'ctermbg=' . a:bg[1]
endfunction

"================================================ COULEURS
let s:colors = {
            \ 'black': [HsvToRgb(0, 0, 0, 1), 0],
            \ 'black_l': [HsvToRgb(0, 0, 7, 1), 0],
            \ 'gray_d': [HsvToRgb(0, 0, 25, 1), 8],
            \ 'gray': [HsvToRgb(0, 0, 50, 1), 7],
            \ 'gray_l': [HsvToRgb(0, 0, 75, 1), 7],
            \ 'white_d': [HsvToRgb(0, 0, 93, 1), 15],
            \ 'white': [HsvToRgb(0, 0, 100, 1), 15],
            \ 'red_d': [HsvToRgb(0, 100, 75, 1), 12],
            \ 'red': [HsvToRgb(0, 100, 100, 1), 12],
            \ 'red_l': [HsvToRgb(0, 75, 100, 1), 12],
            \ 'orange_d': [HsvToRgb(30, 100, 75, 1), 4],
            \ 'orange': [HsvToRgb(30, 100, 100, 1), 4],
            \ 'orange_l': [HsvToRgb(30, 75, 100, 1), 4],
            \ 'yellow_d': [HsvToRgb(60, 100, 75, 1), 14],
            \ 'yellow': [HsvToRgb(60, 100, 100, 1), 14],
            \ 'yellow_l': [HsvToRgb(60, 75, 100, 1), 14],
            \ 'chartreuse_d': [HsvToRgb(90, 100, 75, 1), 6],
            \ 'chartreuse': [HsvToRgb(90, 100, 100, 1), 6],
            \ 'chartreuse_l': [HsvToRgb(90, 75, 100, 1), 6],
            \ 'green_d': [HsvToRgb(120, 100, 75, 1), 10],
            \ 'green': [HsvToRgb(120, 100, 100, 1), 10],
            \ 'green_l': [HsvToRgb(120, 75, 100, 1), 10],
            \ 'turquoise_d': [HsvToRgb(150, 100, 75, 1), 2],
            \ 'turquoise': [HsvToRgb(150, 100, 100, 1), 2],
            \ 'turquoise_l': [HsvToRgb(150, 75, 100, 1), 2],
            \ 'cyan_d': [HsvToRgb(180, 100, 75, 1), 11],
            \ 'cyan': [HsvToRgb(180, 100, 100, 1), 11],
            \ 'cyan_l': [HsvToRgb(180, 75, 100, 1), 11],
            \ 'royal_d': [HsvToRgb(210, 100, 75, 1), 3],
            \ 'royal': [HsvToRgb(210, 100, 100, 1), 3],
            \ 'royal_l': [HsvToRgb(210, 75, 100, 1), 3],
            \ 'blue_d': [HsvToRgb(240, 100, 75, 1), 9],
            \ 'blue': [HsvToRgb(240, 100, 100, 1), 9],
            \ 'blue_l': [HsvToRgb(240, 75, 100, 1), 9],
            \ 'purple_d': [HsvToRgb(270, 100, 75, 1), 1],
            \ 'purple': [HsvToRgb(270, 100, 100, 1), 1],
            \ 'purple_l': [HsvToRgb(270, 75, 100, 1), 1],
            \ 'pink_d': [HsvToRgb(300, 100, 75, 1), 13],
            \ 'pink': [HsvToRgb(300, 100, 100, 1), 13],
            \ 'pink_l': [HsvToRgb(300, 75, 100, 1), 13],
            \ 'salmon_d': [HsvToRgb(330, 100, 75, 1), 5],
            \ 'salmon': [HsvToRgb(330, 100, 100, 1), 5],
            \ 'salmon_l': [HsvToRgb(330, 75, 100, 1), 5],
            \ 'none': ['NONE', 'NONE']
            \ }

"================================================ MODIFIEURS
let s:mods = {
            \ 'bold': ['bold', 'bold'],
            \ 'italic': ['italic', 'italic'],
            \ 'underline': ['underline', 'underline'],
            \ 'undercurl': ['undercurl', 'undercurl'],
            \ 'reverse': ['reverse', 'reverse'],
            \ 'standout': ['standout', 'standout'],
            \ 'strikethrough': ['strikethrough', 'strikethrough'],
            \ 'none': ['NONE', 'NONE']
            \ }

"================================================ SETUP - GENERAL - EDITOR
call SetHighlight('Normal', s:mods['none'], s:colors['white'], s:colors['black_l'])
call SetHighlight('LineNr', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHighlight('LineNrAbove', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHighlight('LineNrBelow', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHighlight('EndOfBuffer', s:mods['none'], s:colors['gray_d'], s:colors['none'])

call SetHighlight('CursorLineNr', s:mods['none'], s:colors['yellow_l'], s:colors['gray_d'])
call SetHighlight('CursorLine', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHighlight('CursorColumn', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHighlight('MatchParen', s:mods['none'], s:colors['none'], s:colors['gray'])

call SetHighlight('VertSplit', s:mods['none'], s:colors['gray'], s:colors['gray_d'])
call SetHighlight('StatusLine', s:mods['none'], s:colors['white'], s:colors['gray'])
call SetHighlight('StatusLineNC', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('StatusLineTerm', s:mods['none'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('StatusLineTermNC', s:mods['none'], s:colors['white'], s:colors['purple_d'])

call SetHighlight('TabLine', s:mods['none'], s:colors['white'], s:colors['gray'])
call SetHighlight('TabLineFill', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHighlight('TabLineSel', s:mods['bold'], s:colors['white'], s:colors['none'])

call SetHighlight('Visual', s:mods['none'], s:colors['none'], s:colors['gray'])
call SetHighlight('Terminal', s:mods['none'], s:colors['white'], s:colors['none'])

call SetHighlight('Title', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('WarningMsg', s:mods['bold'], s:colors['orange_l'], s:colors['none'])
call SetHighlight('ErrorMsg', s:mods['bold'], s:colors['red_l'], s:colors['none'])
call SetHighlight('PopupNotification', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHighlight('Question', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHighlight('Directory', s:mods['none'], s:colors['royal'], s:colors['none'])

"================================================ SETUP - GENERAL - MENU
call SetHighlight('Pmenu', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('PmenuSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('PmenuKind', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('PmenuKindSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('PmenuExtra', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('PmenuExtraSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('PmenuSbar', s:mods['none'], s:colors['white'], s:colors['gray_l'])
call SetHighlight('PmenuPmenuThumb', s:mods['bold'], s:colors['white'], s:colors['gray_l'])

"================================================ SETUP - GENERAL - SYNTAX
call SetHighlight('Constant', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHighlight('Comment', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHighlight('Special', s:mods['none'], s:colors['orange_l'], s:colors['none'])
call SetHighlight('Identifier', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHighlight('PreProc', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHighlight('Statement', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('Conditional', s:mods['none'], s:colors['purple_l'], s:colors['none'])
call SetHighlight('Operator', s:mods['none'], s:colors['white'], s:colors['none'])

"================================================ SETUP - GENERAL - IDK
call SetHighlight('Conceal', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('Folded', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('FoldColumn', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('CursorLineFold', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHighlight('CursorLineSign', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHighlight('SignColumn', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHighlight('ColorColumn', s:mods['none'], s:colors['none'], s:colors['salmon_d'])
call SetHighlight('IncSearch', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHighlight('MessageWindow', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHighlight('ModeMsg', s:mods['bold'], s:colors['white'], s:colors['none'])
call SetHighlight('MoreMsg', s:mods['bold'], s:colors['green_l'], s:colors['none'])
call SetHighlight('NonText', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHighlight('QuickFixLine', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHighlight('Search', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHighlight('CurSearch', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHighlight('SpecialKey', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('SpellBad', s:mods['none'], s:colors['none'], s:colors['orange_d'])
call SetHighlight('SpellCap', s:mods['none'], s:colors['none'], s:colors['royal_d'])
call SetHighlight('SpellLocal', s:mods['none'], s:colors['none'], s:colors['cyan_d'])
call SetHighlight('SpellRare', s:mods['none'], s:colors['none'], s:colors['pink_d'])
call SetHighlight('WildMenu', s:mods['none'], s:colors['white'], s:colors['orange_d'])
call SetHighlight('DiffAdd', s:mods['none'], s:colors['none'], s:colors['royal_d'])
call SetHighlight('DiffChange', s:mods['none'], s:colors['none'], s:colors['purple_d'])
call SetHighlight('DiffDelete', s:mods['none'], s:colors['none'], s:colors['orange_d'])
call SetHighlight('DiffText', s:mods['none'], s:colors['none'], s:colors['red_d'])

"================================================ SETUP - ADDONS - COPILOT
call SetHighlight('CopilotSuggestion', s:mods['italic'], s:colors['gray_d'], s:colors['none'])

"================================================ SETUP - ADDONS - NERD TREE
call SetHighlight('NERDTreeCWD', s:mods['bold'], s:colors['salmon_l'], s:colors['none'])
call SetHighlight('NERDTreeExecFile', s:mods['none'], s:colors['turquoise'], s:colors['none'])

"================================================ SETUP - SYNTHAX - SH
call SetHighlight('shShebang', s:mods['italic'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('shFunction', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('shFunctionOne', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('shCase', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('shCmdSubRegion', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('shOption', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('shTestOpr', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('shEcho', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])

call SetHighlight('shDerefSimple', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHighlight('shSetList', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHighlight('shVariable', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHighlight('shRepeat', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHighlight('shFor', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHighlight('shSet', s:mods['none'], s:colors['royal_d'], s:colors['none'])

call SetHighlight('shLoop', s:mods['none'], s:colors['purple_l'], s:colors['none'])
call SetHighlight('shRange', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHighlight('shSnglCase', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHighlight('shSemicolon', s:mods['none'], s:colors['purple'], s:colors['none'])

call SetHighlight('bashSpecialVariables', s:mods['bold'], s:colors['salmon_l'], s:colors['none'])
call SetHighlight('kshSpecialVariables', s:mods['bold'], s:colors['salmon_l'], s:colors['none'])

call SetHighlight('shQuote', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHighlight('shSingleQuote', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHighlight('shDoubleQuote', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHighlight('shParen', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHighlight('shCommandSub', s:mods['none'], s:colors['white'], s:colors['none'])

"================================================ SETUP - SNTHAX - VIM
call SetHighlight('vimCommand', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('vimUserFunc', s:mods['bold'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('vimSep', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHighlight('vimLet', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHighlight('vimParenSep', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('vimOperParen', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHighlight('vimFuncBody', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHighlight('vimContinue', s:mods['none'], s:colors['gray'], s:colors['none'])

"================================================ SETUP - SNTHAX - MAKEFILE
call SetHighlight('makeTarget', s:mods['none'], s:colors['turquoise_l'], s:colors['none'])
call SetHighlight('makeNextLine', s:mods['none'], s:colors['gray'], s:colors['none'])

"================================================ MISC
hi normal guibg=NONE ctermbg=NONE
