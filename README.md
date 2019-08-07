# Símix AHK

Teclas de atalhos, templates e ferramentas para agilizar e padronizar as rotinas do desenvolvimento e suporte, através do [AutoHotkey](https://www.autohotkey.com/).  
Baseado em padrões trazidos pelo [@simix-felipebaltazar](https://github.com/simix-felipebaltazar).

Qualquer sugestão de melhoria ou novas funcionalidades abra um PR. Lembrando que as teclas e hotstrings serão utilizadas por todos da equipe, então tentar evitar potenciais conflitos com outras teclas/softwares. Se você quiser ir para um próximo nível de automação pode criar seus próprios AHKs, como do [@simix-markusviezzer](https://maattdiy.github.io/autohotkey-scripts/).

## Teclas de atalhos

### Ferramentas de captura (Para Git, CRM, tutorias, etc)
<kbd>PrintScreen</kbd> → Print com [Greenshot](https://getgreenshot.org/)  
<kbd>Alt</kbd><kbd>PrintScreen</kbd> → Print com a Ferramenta de captura do Windows (equivalente a <kbd>Win</kbd><kbd>Shift</kbd><kbd>S</kbd>)  
<kbd>Ctrl</kbd><kbd>PrintScreen</kbd> → Vídeo gif com [ScreenToGif](https://www.screentogif.com/)  
<kbd>Ctrl</kbd><kbd>I</kbd> → Com link (`Markdown`) de uma imagem selecionado, gera o código `Html` com bordas e centralizado

### Geral
<kbd>Win</kbd><kbd>F1</kbd> → Abre a base [Todos os links](https://simix.movidesk.com/kb/pt-br/article/60634/todos-links)  
<kbd>Win</kbd><kbd>F2</kbd> → Abre essa página  
<kbd>Win</kbd><kbd>C</kbd> → Executa o cmd como adminitrador  
<kbd>Win</kbd><kbd>S</kbd> → Vai direto para a última mensagem/pesquisa do slack  
<kbd>Win</kbd><kbd>Espaço</kbd> → Abre/volta o foco para o Notepad++  
<kbd>Win</kbd><kbd>Enter</kbd> → Executa o texto selecionado  

## Hotstrings

Para saber mais sobre hotstrings confira a [documentação](https://www.autohotkey.com/docs/Hotstrings.htm).  
Como essas *macros* vão funcionar em qualquer local que você estiver digitando, foram adotados 2 padrões para evitar conflitos:  
`;sigla` → substituições diversas  
`-sigla` → emojis

### Geral
**;ym** → Data no formato yyyymmdd (para usar em arquivos e pastas de backup)  
**;dm** → Data no formato dd/mm/yyyy  
**;az** → http://az01.simix.com.br:81/Arquivos/  
**;releasedoc** → Template para liberação de versão

### Sistemas
**;regpp** → Registra todas as dll/ocx do PcPonto

### SQL
**;sql.** → Template para SELECT sql  
**;sqlcol** → Comando para pesquisar por determinada coluna  

### Git
**;pr** → Template para abrir PR  

🔥 Exemplos de PRs bem documentados e formatados: [#1](https://github.com/simixsistemas/SuperMidia/pull/159), [#2](https://github.com/simixsistemas/SuperMidia.Cloud/pull/108), [#3](https://github.com/simixsistemas/SuperMidia.Web/pull/99), [#4](https://github.com/simixsistemas/PcPonto.Scripts/pull/14), [#5](https://github.com/simixsistemas/PcPonto.Servidor/pull/2)

### Emojis

Atalhos para utilizar emojis mais facilmente no Git, CRM, Slack, etc.

#### Geral
:) ou -0 → 😃  
:D ou -D → 😄  
-P → 😜  
-pin → 📌  
-ok → 👍  
-hey → 📣

#### Dev (ver https://gitmoji.carloscuesta.me)
-ck → ✅  
-fire → 🔥  
-red → 🚨  
-! → ⚠  
-go → 🚀  
-bug → 🐛  
-new → ✨  
-tada → 🎉  
-x → ♻️  
-tool → 🔧  
-doc → 📝  

## Configuração

### Usuário final

Utilize o instalador: [Simix.AHK.100.exe](Inst/Simix.AHK.100.exe)

### Desenvolvedor

* Baixe o repositorio Simix.AHK
<p align="center">
	<kbd>
		<img src="https://user-images.githubusercontent.com/42358163/61240196-0581f480-a717-11e9-84ef-73b39b594361.png" alt="image" style="max-width:100%;"/>
	</kbd>
</p>

* O único pré-requisito é o AutoHotKey. Você pode [baixar](https://www.autohotkey.com/download/) ou instalar pelo script (executando o `cmd` como administrador)  
`@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" && @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "choco feature enable -n allowGlobalConfirmation;cinst autohotkey.install;cinst vscode;cinst vscode-icons;cinst vscode-autohotkey"`

* Execute o script Simix.AHK.ahk
<p align="center">
	<kbd>
		<img src="https://user-images.githubusercontent.com/42358163/61240146-e97e5300-a716-11e9-91f9-dd70c0d0febb.gif" alt="image" style="max-width:100%;"/>
	</kbd>
</p>

* Um atalho para o script deve ser criado, automaticamente, na pasta inicializar
<p align="center">
	<kbd>
		<img src="https://user-images.githubusercontent.com/42358163/61240317-4d088080-a717-11e9-9896-99f487662c90.png" alt="image" style="max-width:100%;"/>
	</kbd>
</p>
<p align="center">
	<kbd>
		<img src="https://user-images.githubusercontent.com/42358163/61240332-58f44280-a717-11e9-8f6c-91488ad67ded.png" alt="image" style="max-width:100%;"/>
	</kbd>
</p>

* Pronto!

## Referências

- https://maattdiy.github.io/autohotkey-scripts/
- https://shortcutworld.com/
