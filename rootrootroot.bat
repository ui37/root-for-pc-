Start "C:\Users\dsrtyrsdtdrdty\Downloads\r djhiohwrivrfkj.bat"


@echo off
echo Iniciando otimização do sistema...

:: Limpar o cache de arquivos temporários
del /q /f /s %TEMP%\*

:: Limpar o cache do Windows Update
del /q /f /s C:\Windows\SoftwareDistribution\Download\*

:: Limpar arquivos do sistema e otimizar o disco
cleanmgr /sagerun:1

:: Reparo de arquivos de sistema
sfc /scannow

:: Otimizar o desempenho do disco
defrag C: /O

:: Fechar a janela CMD após a execução
@echo off
echo Iniciando limpeza de pastas do sistema...

:: Limpar o cache de arquivos temporários do usuário
del /q /f /s %TEMP%\*

:: Limpar o cache do Windows Update
del /q /f /s C:\Windows\SoftwareDistribution\Download\*

:: Limpar o cache de pré-busca do Windows
del /q /f /s C:\Windows\Prefetch\*

:: Limpar o cache de logs de instalação de atualizações
del /q /f /s C:\Windows\Logs\*

:: Limpar a pasta de arquivos temporários do sistema
del /q /f /s C:\Windows\Temp\*

:: Limpar a pasta de Mini Dumps (arquivos de erros do sistema)
del /q /f /s C:\Windows\Minidump\*

:: Limpar a pasta de arquivos de log do sistema
del /q /f /s C:\Windows\System32\LogFiles\*

:: Limpar a pasta de arquivos antigos do sistema
del /q /f /s C:\Windows\System32\DriverStore\FileRepository\*

:: Limpar a pasta de cache do navegador (caso esteja em C:\Users)
del /q /f /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\*

:: Limpar a pasta de cache do Internet Explorer (caso ainda esteja presente)
del /q /f /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History\*

:: Limpar a pasta de cookies do navegador
del /q /f /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Cookies\*

:: Limpar a pasta de cache de aplicativos
del /q /f /s C:\Users\%USERNAME%\AppData\Local\Temp\*

:: Limpar o conteúdo da lixeira (pode ser útil para liberar espaço)
rd /s /q C:\$Recycle.Bin

echo Limpeza concluída.
:: Fechar o CMD após a execução
exit
