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
  start 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk'
}

Set-Alias v C:\Users\higum\scoop\apps\goneovim\current\goneovim.exe
#Set-Alias v "C:\Users\higum\scoop\apps\vim-kaoriya\current\gvim.exe"
Set-Alias c Start-Chrome
Set-Alias time Measure-Command

#Install-Module Get-ChildItemColor
Import-Module Get-ChildItemColor
Set-Alias ls Get-ChildItemColor

if (Get-Command "zenhan.exe") {
  zenhan 0
}
