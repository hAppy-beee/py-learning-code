@echo off
title JupyterLab 启动器
echo ========================================
echo      JupyterLab 启动程序
echo ========================================
echo.

:: 设置Anaconda安装路径
set ANACONDA_PATH=D:\anaconda3

:: 设置工作目录
set WORK_DIR=D:\program p

echo 1. 检查Anaconda路径...
if not exist "%ANACONDA_PATH%\Scripts\jupyter.exe" (
    echo ❌ 错误：在 %ANACONDA_PATH%\Scripts\ 找不到 jupyter.exe
    echo 请确认Anaconda安装路径是否正确
    pause
    exit /b 1
)
echo   ✅ 找到jupyter.exe
echo.

echo 2. 检查工作目录...
if not exist "%WORK_DIR%" (
    echo ⚠️ 工作目录不存在，正在创建...
    mkdir "%WORK_DIR%"
    if %errorlevel% neq 0 (
        echo ❌ 无法创建工作目录
        pause
        exit /b 1
    )
    echo   ✅ 已创建目录: %WORK_DIR%
)
echo.

echo 3. 切换到工作目录...
cd /d "%WORK_DIR%"
echo   ✅ 当前目录: %cd%
echo.

echo 4. 正在启动JupyterLab...
echo   📁 工作目录: %cd%
echo   🐍 Python环境: %ANACONDA_PATH%
echo   🌐 访问地址: http://localhost:8888
echo   ⏸️  按 Ctrl+C 停止服务
echo ========================================
echo.

timeout /t 2 /nobreak >nul
"%ANACONDA_PATH%\Scripts\jupyter.exe" lab

echo.
echo ========================================
echo      JupyterLab 已关闭
echo ========================================
pause