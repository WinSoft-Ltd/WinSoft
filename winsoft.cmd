@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "version=1.0.0"
set "appname=WinSoft"
set "copyright=© 2026 WinSoft"

set "github-repo=https://github.com/WinSoft-Ltd/WinSoft"
set "website=https://winsoft-ltd.github.io/WinSoft/"
set "telegram=https://t.me/winsoftltd"
set "onlinetestpad=https://winsoft-ltd.github.io/WinSoft/otp.html"

set "color_green=call :ColorTextGreen"
set "color_red=call :ColorTextRed"
set "color_yellow=call :ColorTextYellow"
set "color_white=call :ColorTextWhite"

net session >nul 2>&1
if %errorlevel% neq 0 (
    %color_yellow% "[!] Требуется запуск от имени администратора"
    timeout 2 >nul
    @powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

call :CheckFirstRun
if "%firstrun%"=="yes" call :FirstRunSetup

:MainMenu
cls
echo.
%color_green% "======================================"
%color_green% "      %appname% v%version%"
%color_green% "======================================"
echo.
%color_white% "Главное меню:"
echo.
echo 1. Оценить программу ★
echo 2. Настройки Windows
echo 3. Сайт проекта
echo 4. Telegram-канал
echo 5. GitHub репозиторий
echo 6. О программе
echo 7. Выход
echo.
set /p choice="Выберите пункт (1-7): "

if "%choice%"=="1" start "" "%onlinetestpad%" && goto MainMenu
if "%choice%"=="2" goto WindowsSettings
if "%choice%"=="3" start "" "%website%" && goto MainMenu
if "%choice%"=="4" start "" "%telegram%" && goto MainMenu
if "%choice%"=="5" start "" "%github-repo%" && goto MainMenu
if "%choice%"=="6" goto AboutProgram
if "%choice%"=="7" goto ExitProgram
%color_red% "[Ошибка] Неверный выбор"
timeout 2 >nul
goto MainMenu

:WindowsSettings
cls
echo.
%color_green% "======================================"
%color_green% "      НАСТРОЙКИ WINDOWS"
%color_green% "======================================"
echo.
%color_white% "Быстрые настройки:"
echo.
echo 1. Параметры системы (Win+Pause)
echo 2. Панель управления
echo 3. Параметры Windows (Win+I)
echo 4. Диспетчер задач
echo 5. Командная строка
echo 6. PowerShell
echo 7. Назад в главное меню
echo.
set /p winchoice="Выбор (1-7): "

if "%winchoice%"=="1" start "" "ms-settings:about" && goto WindowsSettings
if "%winchoice%"=="2" start "" "control" && goto WindowsSettings
if "%winchoice%"=="3" start "" "ms-settings:" && goto WindowsSettings
if "%winchoice%"=="4" start "" "taskmgr" && goto WindowsSettings
if "%winchoice%"=="5" start "" cmd /k && goto WindowsSettings
if "%winchoice%"=="6" start "" powershell && goto WindowsSettings
if "%winchoice%"=="7" goto MainMenu
%color_red% "[Ошибка] Неверный выбор"
timeout 2 >nul
goto WindowsSettings

:AboutProgram
cls
echo.
%color_green% "======================================"
%color_green% "          О ПРОГРАММЕ"
%color_green% "======================================"
echo.
echo %appname% v%version%
echo Автор: WinSoft
echo © %copyright%
echo.
echo Совместимость: Windows 10/11
echo.
pause
goto MainMenu

:CheckFirstRun
if exist "%~dp0\.firstrun" (
    set "firstrun=no"
) else (
    set "firstrun=yes"
)
exit /b

:FirstRunSetup
cls
%color_green% "[✓] Первый запуск!"
%color_yellow% "Добро пожаловать в %appname%!"
echo Создаётся файл настроек...
echo First run completed > "%~dp0\.firstrun"
timeout 1 >nul
%color_green% "[✓] Готово"
timeout 1 >nul
exit /b

:ErrorHandler
set "errormsg=%~1"
cls
echo.
%color_red% "======================================"
%color_red% "        ОШИБКА"
%color_red% "======================================"
echo.
%color_red% "%errormsg%"
echo.
%color_yellow% "1. Сообщить о проблеме"
%color_yellow% "2. Вернуться в меню"
echo.
set /p errorchoice="Выбор (1-2): "
if "%errorchoice%"=="1" start "" "https://github.com/WinSoft-Ltd/WinSoft/issues" && goto MainMenu
if "%errorchoice%"=="2" goto MainMenu
goto ErrorHandler

:ColorTextGreen
powershell -NoProfile -Command "Write-Host '%~1' -ForegroundColor Green"
exit /b

:ColorTextRed
powershell -NoProfile -Command "Write-Host '%~1' -ForegroundColor Red"
exit /b

:ColorTextYellow
powershell -NoProfile -Command "Write-Host '%~1' -ForegroundColor Yellow"
exit /b

:ColorTextWhite
powershell -NoProfile -Command "Write-Host '%~1' -ForegroundColor White"
exit /b

:ExitProgram
cls
%color_green% "Спасибо за использование %appname%!"
timeout 2 >nul
exit
