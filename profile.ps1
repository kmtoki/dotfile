Set-PSReadLineOption -EditMode Emacs -BellStyle None
Set-PSReadlineKeyHandler -Key Ctrl+v -Function Paste
Set-PSReadlineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-Alias v gvim

function prompt {
  "`e[34m$($pwd.path)`e[0m`n> "
}
