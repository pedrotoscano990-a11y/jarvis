# ═══════════════════════════════════════════════════════════════════════
#   J.A.R.V.I.S. — Traslado del sistema a GitHub (Windows / PowerShell)
#
#   Uso: clic derecho sobre este archivo → «Ejecutar con PowerShell»
#        (o bien:  powershell -ExecutionPolicy Bypass -File SUBIR-A-GITHUB.ps1 [usuario] [repositorio])
#   La primera vez preguntará sus datos y los guardará en «mis-datos.txt»:
#   las siguientes veces ya no pregunta nada.
#
#   Requiere: git instalado → https://git-scm.com
# ═══════════════════════════════════════════════════════════════════════

function C($t){ Write-Host $t -ForegroundColor Cyan }
function O($t){ Write-Host $t -ForegroundColor Yellow }
function E($t){ Write-Host $t -ForegroundColor Red }

C "J.A.R.V.I.S.: iniciando el traslado a GitHub, señor."

# ───────────── 0. Sus datos (se guardan para no volver a preguntar) ─────────────
$datos = "mis-datos.txt"
$usuario = ""; $nombre = ""
if (Test-Path $datos) {
    foreach ($linea in Get-Content $datos) {
        if ($linea -match '^usuario=(.+)$')      { $usuario = $Matches[1] }
        if ($linea -match '^repositorio=(.+)$')  { $nombre  = $Matches[1] }
    }
}
if ([string]::IsNullOrWhiteSpace($usuario)) {
    $usuario = Read-Host "Su usuario de GitHub"
    if ([string]::IsNullOrWhiteSpace($usuario)) { E "Sin usuario no puedo continuar, señor."; exit 1 }
    $resp = Read-Host "Nombre del repositorio [$(if($nombre){$nombre}else{'jarvis'})]"
    if (-not [string]::IsNullOrWhiteSpace($resp)) { $nombre = $resp }
    if ([string]::IsNullOrWhiteSpace($nombre)) { $nombre = "jarvis" }
    "usuario=$usuario`nrepositorio=$nombre" | Set-Content $datos -Encoding UTF8
    C "Datos guardados en $datos (podrá editarlos cuando quiera)."
}
if ([string]::IsNullOrWhiteSpace($nombre)) { $nombre = "jarvis" }

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    E "No encuentro git. Instálelo desde https://git-scm.com y vuelva a intentarlo, señor."
    exit 1
}

if (-not (Test-Path "README.md") -or -not (Test-Path "jarvis.html")) {
    E "Ejecute este archivo desde la carpeta del repositorio, señor."
    exit 1
}

# ───────────── 1. Repositorio local ─────────────
if (-not (Test-Path ".git")) {
    git init | Out-Null
    git config user.email "jarvis@stark.industries"
    git config user.name  "J.A.R.V.I.S."
    C "Repositorio local creado."
}

git add -A
$pendiente = git status --porcelain
if ([string]::IsNullOrWhiteSpace($pendiente)) {
    O "Sin cambios nuevos que registrar."
} else {
    git commit -q -m "J.A.R.V.I.S. — asistente estilo Iron Man (web + PWA + app nativa Android)"
    C "Cambios registrados."
}
git branch -M main 2>$null | Out-Null

# ───────────── 2. Datos del destino ─────────────
git remote remove origin 2>$null | Out-Null
git remote add origin "https://github.com/$usuario/$nombre.git"

$urlNuevo = "https://github.com/new?name=$nombre"
O "Abriendo el navegador para crear el repositorio VACÍO (público, sin README)…"
C "  Si no se abre solo, visite:  $urlNuevo"
Start-Process $urlNuevo

Write-Host ""
O "Cuando el repositorio exista, pulse Intro y empujaré los archivos."
O "(GitHub pedirá usuario y, como contraseña, un token personal:"
O " Settings → Developer settings → Personal access tokens)"
Read-Host "¿Creado? (Intro para continuar)"

C "Empujando los archivos…"
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    C "Traslado completado, señor."
    C "  Repositorio:  https://github.com/$usuario/$nombre"
    Write-Host ""
    C "Último paso — active la aplicación web:"
    C "  Settings → Pages → Source: «Deploy from a branch» → main / (root) → Save"
    C "  En un minuto quedará en:  https://$usuario.github.io/$nombre/"
} else {
    Write-Host ""
    E "El empuje falló. Compruebe que el repositorio existe y repita:"
    E "  git push -u origin main"
    exit 1
}
