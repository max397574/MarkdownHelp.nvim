"prevent loading the file twice
if existes("g:loaded_markdown_help")
    finish
endif

lua require("markdown_help").init()

let g:loaded_markdown_help = 1
