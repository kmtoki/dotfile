Set-PSReadLineOption -EditMode Emacs -BellStyle None
Set-PSReadlineKeyHandler -Key Ctrl+v -Function Paste
Set-PSReadlineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-Alias e nvim
Set-Alias v goneovim
Set-Alias c Start-Chrome

chcp 65001 >> 0
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
$env:LESSCHARSET = "utf-8"

function Start-Chrome() {
  start chrome
}

function prompt {
  "`e[34m$($pwd.path)`e[0m`n> "
}

function bin($n) {
  return [convert]::ToString($n,2)
}

function hex($n) {
  return [convert]::ToString($n,16)
}
