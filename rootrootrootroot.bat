@echo off
setlocal enabledelayedexpansion

:: Defina o limite de janelas a serem fechadas
set limit=10
set count=0

:: Loop infinito que monitora e fecha as janelas
:loop
    :: Verifique se o número de janelas fechadas atingiu o limite
    if %count% geq %limit% (
        echo Limite de janelas atingido. Fechando programa...
        exit /b
    )

    :: Encontre processos de janelas abertas e feche-os
    for /f "tokens=1,2 delims=," %%i in ('tasklist /fi "status eq running" /fo csv ^| findstr /i "Console"') do (
        set process=%%i
        :: Remover aspas do nome do processo
        set process=!process:"=!

        :: Fechar a janela
        taskkill /f /im !process!
        set /a count+=1
        echo Fechando janela: !process!
    )

    :: Atraso antes de verificar novamente
    timeout /t 2 >nul
goto loop
