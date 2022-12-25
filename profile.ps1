chcp 65001 > nul
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
$env:LESSCHARSET = "utf-8"

Set-PSReadLineOption -EditMode Emacs -BellStyle None
Set-PSReadlineKeyHandler -Key Ctrl+v -Function Paste
Set-PSReadlineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

function prompt {
  "`e[34m$($pwd.path)`e[0m`n> "
}

function Start-Chrome() {
  start chrome
}

Set-Alias v C:\Users\higum\scoop\apps\goneovim\current\goneovim.exe
Set-Alias c Start-Chrome

#Install-Module Get-ChildItemColor
Import-Module Get-ChildItemColor
Set-Alias ls Get-ChildItemColor
