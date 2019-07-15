# Símix AHK

Teclas de atalhos, templates e ferramentas para agilizar e padronizar as rotinas do desenvolvimento e suporte, através do AutoHotkey.  
Baseado em padrões trazidos pelo [@simix-felipebaltazar](https://github.com/simix-felipebaltazar).

## Teclas de atalhos
<kbd>PrintScreen</kbd> → Substitui o PrintScreen padrão por <kbd>Win</kbd><kbd>Shift</kbd><kbd>S</kbd> (Ferramenta de captura)  
<kbd>Ctrl</kbd><kbd>PrintScreen</kbd> → [ScreenToGif](https://www.screentogif.com/)

## Hotstrings
**;d** → Data no formato yyyymmdd  
**;pr** → Template para abrir PR

🔥 Exemplos de PRs bem documentados e formatados: [#1](https://github.com/simixsistemas/SuperMidia/pull/159), [#2](https://github.com/simixsistemas/SuperMidia.Cloud/pull/108), [#3](https://github.com/simixsistemas/SuperMidia.Web/pull/99)

## Hotstrings para emojis

### Geral
:) ou -0 → 😃  
:D ou -D → 😄  
-pin → 📌  
-ok → 👍  

### Dev (ver https://gitmoji.carloscuesta.me)
-ck → ✅  
-fire → 🔥  
-! → 🚨  
-go → 🚀  
-bug → 🐛  
-new → ✨  
-tada → 🎉  
-x → ♻️  
-tool → 🔧  

## Configuração

* Instale os pré-requisitos (cmd como admin):
`@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" && @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "choco feature enable -n allowGlobalConfirmation;cinst autohotkey.install;cinst screentogif;cinst greenshot"`
* Baixe o repo e execute o Simix.AHK.ahk
* Crie um atalho no shell:startup
* Copie o arquivo [Greenshot.ini](Templates/Greenshot.ini) com as configurações otimizadas para a pasta C:\Users\%USERNAME%\AppData\Roaming\Greenshot\

## Referências

- https://maattdiy.github.io/autohotkey-scripts/
