@echo off
title Simulateur de Production - Serveur Local
echo ==========================================================
echo   DEMARRAGE DU SIMULATEUR DE PRODUCTION (LOGIS-SIM)
echo ==========================================================
echo.

:: Lancer le navigateur en premier pour ouvrir l'URL locale
echo Ouverture du simulateur dans votre navigateur...
start "" "http://localhost:8000/index.html"
echo.

:: Tenter de lancer le serveur avec Python (le plus courant)
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo Serveur lance via Python sur le port 8000...
    echo Laissez cette fenetre ouverte pendant l'utilisation.
    echo.
    python -m http.server 8000
    goto end
)

:: Tenter de lancer le serveur avec Node/npx
where npx >nul 2>nul
if %errorlevel% equ 0 (
    echo Serveur lance via Node (npx serve) sur le port 8000...
    echo Laissez cette fenetre ouverte pendant l'utilisation.
    echo.
    npx serve -l 8000
    goto end
)

echo.
echo [ERREUR] Impossible de trouver Python ou Node.js sur votre systeme.
echo Pour faire fonctionner la synchronisation API, un serveur local est requis.
echo.
echo Options de resolution :
echo 1. Installez Python (cochez "Add python.exe to PATH" lors de l'installation).
echo 2. Installez Node.js.
echo 3. Ouvrez le fichier simulateur-production.html directement (attention, la synchro API sera bloquee par le navigateur).
echo.
pause

:end
