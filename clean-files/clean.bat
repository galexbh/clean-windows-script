:: batch-file
@echo off
 
set Exten=pdf docx xlsx pptx txt jpg jpeg png gif mp3 mp4 accdb mbd
set Direc=Downloads Pictures Documents Desktop
 
echo. %USERPROFILE%
PUSHD %USERPROFILE%
 
:Paso-1
    for %%a in (%Direc%) do call :Paso-2 %%a
    POPD
    goto :EOF
 
:Paso-2
    echo Directorio %CD%\%1
    cd %1
    for %%b in (%Exten%) do call :Paso-3 %%b
    CD ..
    goto :EOF
 
:Paso-3
    echo       Ext. %CD%\*.%1
    dir *.%1 /s /B >temporal.tmp 2>nul
    for /F "delims=: tokens=2" %%c in (Temporal.tmp) do call :Paso-4 %%c
    del Temporal.tmp
    goto :EOF
 
:Paso-4
    echo del %1
    goto :EOF