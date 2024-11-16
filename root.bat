@echo off
title Mini Root

:: Menu de opções
:MENU
cls
echo ===========================================
echo             Mini Root - CMD
echo ===========================================
echo 1. Informacoes do Sistema
echo 2. Gerenciar Processos
echo 3. Acessar Programas
echo 4. Abrir Arquivos e Pastas
echo 5. Sair
echo ===========================================
set /p option=Escolha uma opcao: 

if "%option%"=="1" goto SYSTEMINFO
if "%option%"=="2" goto PROCESSES
if "%option%"=="3" goto PROGRAMS
if "%option%"=="4" goto FILES
if "%option%"=="5" exit

:: Informações do Sistema
:SYSTEMINFO
cls
echo Exibindo informacoes do sistema...
systeminfo
pause
goto MENU

:: Gerenciar Processos
:PROCESSES
cls
echo Gerenciando processos...
tasklist
echo ===========================================
set /p kill=Digite o nome do processo para matar (ex: notepad.exe): 
taskkill /IM %kill% /F
pause
goto MENU

:: Acessar Programas
:PROGRAMS
cls
echo Acessando programas...
echo 1. Calculadora
echo 2. Bloco de Notas
echo 3. Internet Explorer
echo ===========================================
set /p prog=Escolha um programa para abrir: 
if "%prog%"=="1" start calc
if "%prog%"=="2" start notepad
if "%prog%"=="3" start iexplore
pause
goto MENU

:: Abrir Arquivos e Pastas
:FILES
cls
echo 1. Abrir Documentos
echo 2. Abrir Area de Trabalho
echo ===========================================
set /p folder=Escolha uma pasta para abrir: 
if "%folder%"=="1" start explorer %userprofile%\Documents
if "%folder%"=="2" start explorer %userprofile%\Desktop
pause
goto MENU
