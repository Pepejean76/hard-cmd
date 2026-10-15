@echo off
:: window.bat - Fenetre coloree qui execute "dir /s" en boucle
:: %1 = code couleur CMD (ex: 0A, 0B, 0C...)
:: %2 = texte/titre a afficher
:: Se ferme automatiquement quand stop.flag existe (voir README.txt),
:: ou a tout moment normalement via le bouton X / Ctrl+C.

color %1
title %2
setlocal enabledelayedexpansion

:loop
if exist "%~dp0stop.flag" goto end

echo ==== %2 ====
dir /s

if exist "%~dp0stop.flag" goto end
timeout /t 1 /nobreak >nul
goto loop

:end
echo.
echo [%2] Arret demande. Fermeture...
timeout /t 1 >nul
exit
