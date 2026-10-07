#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════
#   J.A.R.V.I.S. — Traslado del sistema a GitHub
#
#   Uso:      bash SUBIR-A-GITHUB.sh  [usuario] [repositorio]
#             La primera vez preguntará sus datos y los guardará en
#             «mis-datos.txt»: las siguientes veces ya no pregunta nada.
#   Requiere: git instalado.
#   Opcional: GitHub CLI («gh») para crear el repositorio y activar Pages
#             sin salir de la terminal  →  https://cli.github.com
#
#   Si no tiene gh, el script le abrirá el navegador para crear el
#   repositorio vacío y, a la vuelta, empujará todo solo.
# ═══════════════════════════════════════════════════════════════════════
set -u

C(){ printf '\033[36m%s\033[0m\n' "$*"; }   # cian  — J.A.R.V.I.S.
O(){ printf '\033[33m%s\033[0m\n' "$*"; }   # oro   — advertencia
E(){ printf '\033[31m%s\033[0m\n' "$*" >&2; } # rojo  — error

C "J.A.R.V.I.S.: iniciando el traslado a GitHub, señor."

# ───────────── 0. Sus datos (se guardan para no volver a preguntar) ─────────────
DATOS="mis-datos.txt"
USUARIO=""; NOMBRE=""
if [ -f "$DATOS" ]; then
  USUARIO=$(sed -n 's/^usuario=//p' "$DATOS" | head -1)
  NOMBRE=$(sed -n 's/^repositorio=//p' "$DATOS" | head -1)
fi
if [ -z "$USUARIO" ]; then
  echo
  read -r -p "Su usuario de GitHub: " USUARIO
  [ -z "$USUARIO" ] && { E "Sin usuario no puedo continuar, señor."; exit 1; }
  read -r -p "Nombre del repositorio [${NOMBRE:-jarvis}]: " _n
  NOMBRE="${_n:-${NOMBRE:-jarvis}}"
  printf 'usuario=%s\nrepositorio=%s\n' "$USUARIO" "$NOMBRE" > "$DATOS"
  C "Datos guardados en $DATOS (podrá editarlos cuando quiera)."
fi
[ -z "$NOMBRE" ] && NOMBRE="jarvis"

if [ -n "${1:-}" ]; then USUARIO="$1"; fi
if [ -n "${2:-}" ]; then NOMBRE="$2"; fi

command -v git >/dev/null 2>&1 || {
  E "No encuentro git. Instálelo desde https://git-scm.com y vuelva a intentarlo, señor."
  exit 1
}

if [ ! -f README.md ] || [ ! -f jarvis.html ]; then
  E "Ejecute este archivo desde la carpeta del repositorio"
  E "(donde están README.md y jarvis.html), señor."
  exit 1
fi

# ───────────── 1. Repositorio local ─────────────
if [ ! -d .git ]; then
  git init -q
  git config user.email "jarvis@stark.industries" >/dev/null 2>&1 || true
  git config user.name  "J.A.R.V.I.S." >/dev/null 2>&1 || true
  C "Repositorio local creado."
fi

git add -A
if git diff --cached --quiet 2>/dev/null; then
  O "Sin cambios nuevos que registrar."
else
  git commit -q -m "J.A.R.V.I.S. — asistente estilo Iron Man (web + PWA + app nativa Android)"
  C "Cambios registrados."
fi
git branch -M main >/dev/null 2>&1 || true

# ───────────── 2. Camino automático (GitHub CLI) ─────────────
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  O "Creando el repositorio público «$NOMBRE» y empujando los archivos…"
  gh repo create "$NOMBRE" --public --source=. --remote=origin --push

  USUARIO=$(gh api user -q .login 2>/dev/null || echo "")
  if [ -n "$USUARIO" ]; then
    O "Activando GitHub Pages…"
    if gh api -X POST "repos/$USUARIO/$NOMBRE/pages" \
         -f 'source[branch]=main' -f 'source[path]=/' >/dev/null 2>&1; then
      C "Pages activado."
    else
      O "Active Pages a mano: Settings → Pages → Deploy from a branch → main / (root) → Save"
    fi
    echo
    C "Traslado completado, señor."
    C "  Repositorio:      https://github.com/$USUARIO/$NOMBRE"
    C "  Aplicación web:   https://$USUARIO.github.io/$NOMBRE/"
    C "  (Pages tarda un minuto; después podrá instalarla como app en el teléfono)"
  fi
  exit 0
fi

# ───────────── 3. Camino guiado (sin gh) ─────────────
O "No detecto GitHub CLI autenticado. Seguimos por el camino guiado, señor."

git remote remove origin >/dev/null 2>&1 || true
git remote add origin "https://github.com/$USUARIO/$NOMBRE.git"

URL_NUEVO="https://github.com/new?name=$NOMBRE"
O "Abriendo el navegador para crear el repositorio VACÍO (público, sin README)…"
C "  Si no se abre solo, visite:  $URL_NUEVO"
{ command -v xdg-open >/dev/null 2>&1 && xdg-open "$URL_NUEVO" >/dev/null 2>&1; } || \
{ command -v open     >/dev/null 2>&1 && open     "$URL_NUEVO" >/dev/null 2>&1; } || \
{ command -v powershell >/dev/null 2>&1 && powershell -c "Start-Process '$URL_NUEVO'" >/dev/null 2>&1; } || true

echo
O "Cuando el repositorio exista, pulse Intro y empujaré los archivos."
read -r -p "¿Creado? (Intro para continuar) " _

if git push -u origin main; then
  echo
  C "Traslado completado, señor."
  C "  Repositorio:  https://github.com/$USUARIO/$NOMBRE"
  echo
  C "Último paso — active la aplicación web:"
  C "  Settings → Pages → Source: «Deploy from a branch» → main / (root) → Save"
  C "  En un minuto quedará en:  https://$USUARIO.github.io/$NOMBRE/"
else
  echo
  E "El empuje falló. Causas habituales:"
  E "  · El repositorio aún no existe o el nombre no coincide."
  E "  · Credenciales: GitHub ya no acepta contraseña; use un token personal"
  E "    (Settings → Developer settings → Personal access tokens) como contraseña."
  E "  · Si el repositorio ya tenía contenido, pruebe:  git pull --rebase origin main"
  echo
  E "Cuando lo resuelva, repita:  git push -u origin main"
  exit 1
fi
