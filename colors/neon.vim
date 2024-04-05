"================================================ UTILS
function! HsvToRgb(h, s, v, ...) " ... = [silent mode]
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

function! SetHl(group, mod, fg, bg)
    execute 'highlight' a:group
                \ 'gui=' . a:mod[0]
                \ 'guifg=' . a:fg[0]
                \ 'guibg=' . a:bg[0]
                \ 'cterm=' . a:mod[1]
                \ 'ctermfg=' . a:fg[1]
                \ 'ctermbg=' . a:bg[1]
endfunction

"================================================ COLORS
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

"================================================ MODIFIERS
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
call SetHl('Normal', s:mods['none'], s:colors['white'], s:colors['black_l'])
call SetHl('LineNr', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHl('LineNrAbove', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHl('LineNrBelow', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHl('EndOfBuffer', s:mods['none'], s:colors['gray_d'], s:colors['none'])

call SetHl('CursorLineNr', s:mods['none'], s:colors['yellow_l'], s:colors['gray_d'])
call SetHl('CursorLine', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHl('CursorColumn', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHl('MatchParen', s:mods['none'], s:colors['none'], s:colors['gray'])

call SetHl('VertSplit', s:mods['none'], s:colors['gray'], s:colors['gray_d'])
call SetHl('StatusLine', s:mods['none'], s:colors['white'], s:colors['gray'])
call SetHl('StatusLineNC', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('StatusLineTerm', s:mods['none'], s:colors['white'], s:colors['purple_d'])
call SetHl('StatusLineTermNC', s:mods['none'], s:colors['white'], s:colors['purple_d'])

call SetHl('TabLine', s:mods['none'], s:colors['white'], s:colors['gray'])
call SetHl('TabLineFill', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHl('TabLineSel', s:mods['bold'], s:colors['white'], s:colors['none'])

call SetHl('Visual', s:mods['none'], s:colors['none'], s:colors['gray_d'])
call SetHl('Terminal', s:mods['none'], s:colors['white'], s:colors['none'])

call SetHl('Title', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('WarningMsg', s:mods['bold'], s:colors['orange_l'], s:colors['none'])
call SetHl('ErrorMsg', s:mods['bold'], s:colors['red_l'], s:colors['none'])
call SetHl('PopupNotification', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('Question', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('Directory', s:mods['none'], s:colors['royal'], s:colors['none'])

"================================================ SETUP - GENERAL - MENU
call SetHl('Pmenu', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('PmenuSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('PmenuKind', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('PmenuKindSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('PmenuExtra', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('PmenuExtraSel', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('PmenuSbar', s:mods['none'], s:colors['white'], s:colors['gray_l'])
call SetHl('PmenuPmenuThumb', s:mods['bold'], s:colors['white'], s:colors['gray_l'])

"================================================ SETUP - GENERAL - SYNTAX
call SetHl('Constant', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('Comment', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHl('Special', s:mods['none'], s:colors['orange_l'], s:colors['none'])
call SetHl('Identifier', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHl('PreProc', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHl('Statement', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('Conditional', s:mods['none'], s:colors['purple_l'], s:colors['none'])
call SetHl('Delimiter', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('Operator', s:mods['none'], s:colors['white'], s:colors['none'])

"================================================ SETUP - GENERAL - IDK
call SetHl('Conceal', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('Folded', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('FoldColumn', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('CursorLineFold', s:mods['bold'], s:colors['white'], s:colors['purple_d'])
call SetHl('CursorLineSign', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHl('SignColumn', s:mods['italic'], s:colors['gray'], s:colors['none'])
call SetHl('ColorColumn', s:mods['none'], s:colors['none'], s:colors['salmon_d'])
call SetHl('IncSearch', s:mods['none'], s:colors['white'], s:colors['gray_d'])
call SetHl('MessageWindow', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('ModeMsg', s:mods['bold'], s:colors['white'], s:colors['none'])
call SetHl('MoreMsg', s:mods['bold'], s:colors['green_l'], s:colors['none'])
call SetHl('NonText', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHl('QuickFixLine', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHl('Search', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHl('CurSearch', s:mods['none'], s:colors['black'], s:colors['yellow_d'])
call SetHl('SpecialKey', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('SpellBad', s:mods['none'], s:colors['none'], s:colors['orange_d'])
call SetHl('SpellCap', s:mods['none'], s:colors['none'], s:colors['royal_d'])
call SetHl('SpellLocal', s:mods['none'], s:colors['none'], s:colors['cyan_d'])
call SetHl('SpellRare', s:mods['none'], s:colors['none'], s:colors['pink_d'])
call SetHl('WildMenu', s:mods['none'], s:colors['white'], s:colors['orange_d'])
call SetHl('DiffAdd', s:mods['none'], s:colors['none'], s:colors['royal_d'])
call SetHl('DiffChange', s:mods['none'], s:colors['none'], s:colors['purple_d'])
call SetHl('DiffDelete', s:mods['none'], s:colors['none'], s:colors['orange_d'])
call SetHl('DiffText', s:mods['none'], s:colors['none'], s:colors['red_d'])

"================================================ SETUP - ADDONS - COPILOT
call SetHl('CopilotSuggestion', s:mods['italic'], s:colors['gray_d'], s:colors['none'])

"================================================ SETUP - ADDONS - NERD TREE
call SetHl('NERDTreeCWD', s:mods['none'], s:colors['salmon_l'], s:colors['none'])
call SetHl('NERDTreeDir', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('NERDTreeDirSlash', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHl('NERDTreeOpenable', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHl('NERDTreeClosable', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHl('NERDTreeExecFile', s:mods['none'], s:colors['turquoise'], s:colors['none'])

"================================================ SETUP - SYNTHAX - SH / BASH
call SetHl('shShebang', s:mods['italic'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('shFunction', s:mods['none'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('shFunctionOne', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('shCase', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('shCmdSubRegion', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('shOption', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('shTestOpr', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('shEcho', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('shOperator', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('shNoQuote', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])

call SetHl('shDerefSimple', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHl('shArithmetic', s:mods['bold'], s:colors['royal_l'], s:colors['none'])
call SetHl('shSetList', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHl('shVariable', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHl('shRepeat', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHl('shFor', s:mods['none'], s:colors['royal'], s:colors['none'])
call SetHl('shSet', s:mods['none'], s:colors['royal_d'], s:colors['none'])

call SetHl('shLoop', s:mods['none'], s:colors['purple_l'], s:colors['none'])
call SetHl('shRange', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('shSnglCase', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('shSemicolon', s:mods['none'], s:colors['purple'], s:colors['none'])

call SetHl('bashSpecialVariables', s:mods['bold'], s:colors['salmon_l'], s:colors['none'])
call SetHl('kshSpecialVariables', s:mods['bold'], s:colors['salmon_l'], s:colors['none'])

call SetHl('shQuote', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('shSingleQuote', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHl('shDoubleQuote', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHl('shTestSingleQuote', s:mods['italic'], s:colors['white'], s:colors['none'])
call SetHl('shParen', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('shCommandSub', s:mods['none'], s:colors['white'], s:colors['none'])
call SetHl('shSpecial', s:mods['none'], s:colors['gray_l'], s:colors['none'])
call SetHl('shSpecialDQ', s:mods['none'], s:colors['gray_l'], s:colors['none'])
call SetHl('shCtrlSeq', s:mods['none'], s:colors['gray_l'], s:colors['none'])

"================================================ SETUP - SNTHAX - VIM
call SetHl('vimCommand', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('vimUserFunc', s:mods['bold'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('vimSep', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHl('vimLet', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('vimParenSep', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('vimOperParen', s:mods['none'], s:colors['purple_d'], s:colors['none'])
call SetHl('vimFuncBody', s:mods['none'], s:colors['turquoise_d'], s:colors['none'])
call SetHl('vimContinue', s:mods['none'], s:colors['gray'], s:colors['none'])
call SetHl('vimMapMod', s:mods['bold'], s:colors['gray'], s:colors['none'])
call SetHl('vimMapModKey', s:mods['none'], s:colors['gray_l'], s:colors['none'])
call SetHl('vimBracket', s:mods['bold'], s:colors['gray'], s:colors['none'])
call SetHl('vimNotation', s:mods['none'], s:colors['gray_l'], s:colors['none'])

"================================================ SETUP - SNTHAX - MAKEFILE
call SetHl('makeCommands', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('makeTarget', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('makeNextLine', s:mods['none'], s:colors['gray'], s:colors['none'])
call SetHl('makeSpecial', s:mods['none'], s:colors['gray_l'], s:colors['none'])
call SetHl('makeDString', s:mods['italic'], s:colors['white'], s:colors['none'])

"================================================ SETUP - SNTHAX - CSS
call SetHl('cssBraces', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('cssAttrComma', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssSelectorOp', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('cssSelectorOp2', s:mods['none'], s:colors['purple'], s:colors['none'])
call SetHl('cssPseudoClassId', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssTagName', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssClassName', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssClassNameDot', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssIdentifier', s:mods['bold'], s:colors['purple_l'], s:colors['none'])
call SetHl('cssProp', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('cssCustomProp', s:mods['bold'], s:colors['turquoise_l'], s:colors['none'])
call SetHl('cssImportant', s:mods['none'], s:colors['salmon_l'], s:colors['none'])
call SetHl('cssFunctionName', s:mods['none'], s:colors['yellow_l'], s:colors['none'])
call SetHl('cssFunctionComma', s:mods['none'], s:colors['yellow_l'], s:colors['none'])
call SetHl('cssStringQQ', s:mods['italic'], s:colors['white'], s:colors['none'])

"================================================ MISC
hi normal guibg=NONE ctermbg=NONE
