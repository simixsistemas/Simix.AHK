;S�mix Sistemas - Instala��o do S�mix AHK
;�ltima modifica��o: 03/08/2019

!define VERSAO "1.0.0"
!define VERSAORESUMIDA "100"
OutFile "Simix.AHK.${VERSAORESUMIDA}.exe"

SetCompressor lzma

;Includes
!include "LogicLib.nsh"
!include "FileFunc.nsh"
!include "MUI.nsh"
!include "MultiUser.nsh"

;Constantes
!define PRODUTO "S�mix AHK"
!define EMPRESA "S�mix Sistemas"
!define URL "http://www.simix.com.br"
!define MULTIUSER_EXECUTIONLEVEL Power

;===============================================================================================================

;Configura��es gerais
Caption "${PRODUTO} ${VERSAO} - ${PRODUTO}"
BrandingText "${EMPRESA}"
ShowInstDetails show
InstallColors /windows

;Nome do instalador
Name "${PRODUTO} ${VERSAORESUMIDA}"

;Destino padr�o
InstallDir "C:\S�mix\AHK\"
InstallDirRegKey HKLM "SOFTWARE\S�mix\AHK\Settings" "DirInst"

;== Configura��o do arquivo ====================================================================================

VIProductVersion "${VERSAO}.0"
VIAddVersionKey ProductName "${PRODUTO}"
VIAddVersionKey ProductVersion "${VERSAO}"
VIAddVersionKey CompanyName "${EMPRESA}"
VIAddVersionKey Website "${URL}"
VIAddVersionKey FileVersion "${VERSAO}"
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright ""

;== Configura��o da interface =================================================================================

XPStyle on
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-full.ico"
!define MUI_COMPONENTSPAGE_CHECKBITMAP "${NSISDIR}\Contrib\Graphics\Checks\modern.bmp"
!define MUI_ABORTWARNING

!define MUI_COMPONENTSPAGE_NODESC
!define MUI_HEADERIMAGE

;== P�ginas ==================================================================================================
  
;!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;== Idioma ===================================================================================================

!insertmacro MUI_LANGUAGE "PortugueseBR"

;== Se��es ===================================================================================================

Section ""
    SetDetailsPrint none
    SetShellVarContext all
    SetOverwrite on
    
    SetOutPath $INSTDIR
    
    SetDetailsPrint both
    DetailPrint "Copiando arquivos..."
    SetDetailsPrint none
	
    Call AtualizarArquivos
	Call CopiarInst
	Call InstalarChocolatey
	
	SetDetailsPrint both
SectionEnd

;== Fun��es ==================================================================================================

Function AtualizarArquivos
	SetOverwrite ifdiff
    
    SetOutPath "$INSTDIR"
    File "..\Simix.AHK.ahk"
	File "..\Icon.ico"
	
	SetOutPath "$INSTDIR\Libs"
    File /r "..\Libs\*.*"
	
	SetOutPath "$INSTDIR\Scripts"
    File /r "..\Scripts\*.*"
	
	SetOutPath "$INSTDIR\Templates"
    File /r "..\Templates\*.*"
	
	SetOutPath "$INSTDIR\Inst"
	File "Chocolatey.bat"
	
	SetOutPath "$INSTDIR\Temp"
FunctionEnd

Function CopiarInst
	SetDetailsPrint both
    DetailPrint "Copiando instalador..."
    SetDetailsPrint none
	
    SetOverwrite try
    CopyFiles /SILENT $EXEPATH "$INSTDIR\Inst"    
FunctionEnd

Function InstalarChocolatey
	SetDetailsPrint both
    DetailPrint "Instalando Chocolatey..."
    SetDetailsPrint none
	
    ExecWait "$INSTDIR\Inst\Chocolatey.bat"
FunctionEnd

;== Eventos ==================================================================================================

Function .onInit
    !insertmacro MULTIUSER_INIT
FunctionEnd

Function .onInstSuccess
	SetDetailsPrint none
	;ExecShell "open" "$INSTDIR\Simix.AHK.ahk"
	Exec "explorer $INSTDIR"
FunctionEnd

Function un.onInit
    !insertmacro MULTIUSER_UNINIT
FunctionEnd
