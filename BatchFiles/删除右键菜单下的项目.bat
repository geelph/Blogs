@echo off
:: 
:: 
mode con lines=25
title “新建”菜单内容删除器
color 1f

:input
cls
call :display
echo
echo.
echo.
set input=
set /p input=           请输入后缀名：
if "%input%"=="" goto input
if "%input%"=="0" exit
if "%input%"=="1" goto fouce
for /f %%i ("%input%") do (reg delete HKCR\.%%i\ShellNew /f)
goto continue

:fouce
cls
call :display
set input=
set /p input=           请输入后缀名(强行删除):
if "%input%"=="" goto fouce
if "%input%"=="0" exit
for /f %%i in ("%input%") do (reg delete HKCR\.%%i /f)

:continue
cls
call :display
echo.
set choice=
set /p choice=           还要继续清除吗?（y/n）
if "%choice%"=="" goto continue
if "%choice%"=="y" goto input
if "%choice%"=="n" goto :eof

:display
echo.
echo.
echo.
echo.
echo.
echo.
echo         本程序能删除右键菜单中“新建”项目下的多余内容，为“新建”菜单减肥！
echo.
echo            如果想让某种类型的文件不再出现在右键的“新建”菜单中，请直接
echo.
echo                       输入该文件类型的后缀名。例：rar。
echo.
echo                                             退出请选0
echo.

:: 需要管理员权限才能运行