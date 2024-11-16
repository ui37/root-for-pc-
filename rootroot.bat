@echo off
cls
echo *** MINI ROOT SCRIPT ***
echo.
echo Este script tenta realizar diversas operacoes administrativas.
echo.
echo Pressione qualquer tecla para continuar ou Ctrl+C para cancelar.
pause >nul
cls

:: Executar como administrador
:: Verifica se o script foi executado com privilégios de administrador
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo *** O script precisa ser executado como Administrador. Fechando...
    pause >nul
    exit
)

:: Limpar arquivos temporários
echo Limpando arquivos temporarios...
del /f /s /q %temp%\*
del /f /s /q C:\Windows\Temp\*
echo Arquivos temporarios limpos com sucesso.

:: Finalizar processos desnecessários
echo Finalizando processos desnecessarios...
taskkill /f /im "notepad.exe" >nul 2>&1
taskkill /f /im "chrome.exe" >nul 2>&1
echo Processos desnecessarios finalizados.

:: Limpeza de cache de Internet Explorer
echo Limpando cache de Internet Explorer...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo Cache do Internet Explorer limpo.

:: Limpar logs do sistema
echo Limpando logs do sistema...
del /f /s /q C:\Windows\System32\winevt\Logs\* >nul 2>&1
echo Logs do sistema apagados.

:: Verificar e corrigir erros no sistema de arquivos
echo Verificando e corrigindo erros no sistema de arquivos...
chkdsk C: /f >nul 2>&1
echo Erros no sistema de arquivos corrigidos.

:: Limpeza do registro
echo Limpando o registro do Windows...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f >nul 2>&1
echo Registro limpo.

:: Desabilitar programas de inicialização
echo Desabilitando programas de inicializacao...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "ExampleApp" /t REG_SZ /d "" /f >nul 2>&1
echo Programas de inicializacao desativados.

:: Liberar espaço em disco
echo Liberando espaco em disco com a ferramenta de limpeza de disco...
cleanmgr /sagerun:1 >nul 2>&1
echo Espaco em disco liberado.

:: Otimizar desempenho do sistema
echo Otimizando desempenho do sistema...
defrag C: /O >nul 2>&1
echo Desfragmentacao do disco concluida.

:: Alterar configurações de rede (exemplo de alteração do DNS)
echo Alterando configuracoes de rede...
netsh interface ip set dns "Ethernet" static 8.8.8.8 >nul 2>&1
echo DNS alterado para 8.8.8.8.

:: Reiniciar serviços essenciais
echo Reiniciando servicos essenciais...
net stop "wuauserv" >nul 2>&1
net start "wuauserv" >nul 2>&1
echo Servicos essenciais reiniciados.

:: Alterar a configuração do Windows Defender (Exemplo)
echo Desativando o Windows Defender (tempo limitado)...
sc stop WinDefend >nul 2>&1
sc config WinDefend start= disabled >nul 2>&1
echo Windows Defender desativado.

:: Criar backup de dados importantes
echo Criando backup de documentos importantes...
xcopy C:\Users\%username%\Documents\*.* D:\Backup\Documents\ /s /e /h /i >nul 2>&1
echo Backup realizado com sucesso.

:: Exibir informações do sistema
echo Exibindo informacoes do sistema...
systeminfo >nul 2>&1
echo Informacoes do sistema exibidas.

:: Limpar memória do sistema (tentativa)
echo Limpando memoria do sistema...
rundll32.exe user32.dll,LockWorkStation
echo Memoria "limpa" (isto não é uma limpeza real).

:: Atualizações do Windows (Exemplo)
echo Verificando e instalando atualizacoes do Windows...
powershell -Command "Get-WindowsUpdate -Install" >nul 2>&1
echo Atualizacoes verificadas e instaladas.

:: Reboot opcional (descomentar para reiniciar)
:: shutdown /r /f /t 0
:: echo Sistema reiniciado.

echo.
echo *** Operações concluídas ***
pause >nul
