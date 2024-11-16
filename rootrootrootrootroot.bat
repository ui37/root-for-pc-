@echo off
setlocal enabledelayedexpansion

:: Define o caminho do arquivo que contém o comando PowerShell
set ""C:\Users\dsrtyrsdtdrdty\Downloads\wnwecpçwkj.txt""

:: Lê o conteúdo do arquivo e armazena na variável "comando"
for /f "delims=" %%a in (%arquivo%) do set comando=%%a

:: Executa o comando PowerShell
powershell -Command "!comando!"

endlocal
