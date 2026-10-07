> ## ✅ PUBLICADO — 6 de octubre de 2026
> El repositorio ya está en su casa y la aplicación web está **en vivo**:
> **https://pedrotoscano990-a11y.github.io/jarvis/**
> Este documento queda como guía para futuras actualizaciones.

# J.A.R.V.I.S. → GitHub
### Guía personalizada para **pedrotoscano990-a11y**

Su repositorio será **`jarvis`** (está libre, lo comprobé) y la aplicación quedará publicada en:

## 🔗 Sus direcciones

| | Dirección |
|---|---|
| **Repositorio** | `https://github.com/pedrotoscano990-a11y/jarvis` |
| **Aplicación web** (tras activar Pages) | `https://pedrotoscano990-a11y.github.io/jarvis/` |
| Perfil | `https://github.com/pedrotoscano990-a11y` |

> Sus datos ya están escritos en `mis-datos.txt`, así que los scripts **no le preguntarán nada**.

---

## Camino A — Un comando (recomendado)

**macOS / Linux / Git Bash de Windows:**
```bash
bash SUBIR-A-GITHUB.sh
```

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File SUBIR-A-GITHUB.ps1
```

Qué hace por usted:
1. Inicia el repositorio local y registra los 30 archivos.
2. **Comprueba si `https://github.com/pedrotoscano990-a11y/jarvis` ya existe.**
   - Si existe → empuja directamente, sin abrir nada.
   - Si no existe → abre el navegador para crearlo vacío y, a la vuelta, empuja.
3. Crea el remoto `origin` y sube todo a la rama `main`.

**Aún más fácil:** si tiene [GitHub CLI](https://cli.github.com) autenticado (`gh auth login`), el mismo comando **crea el repositorio y activa Pages solo**, sin navegador ni clics.

---

## Camino B — Sin terminal, con el navegador (3 minutos)

1. **Crear el repositorio:** abra `https://github.com/new`
   - *Repository name:* **jarvis**
   - Marque **Public**
   - **No** añada README ni licencia (ya vienen en el paquete)
   - *Create repository*

2. **Subir los archivos:** en la página del repositorio, pulse **Add file → Upload files** y arrastre **todo el contenido** de la carpeta `jarvis-repo` (los archivos y carpetas de dentro, no la carpeta en sí).

3. **Confirmar:** botón verde **Commit changes**.

4. **Activar la aplicación web:** *Settings → Pages → Source:* **Deploy from a branch** → *Branch:* **main** / **(root)** → **Save**.

5. Espere un minuto. Su J.A.R.V.I.S. quedará en:
   **https://pedrotoscano990-a11y.github.io/jarvis/**

---

## Camino C — Sin GitHub, al instante

Si algún día prefiere saltarse GitHub: entre a [app.netlify.com/drop](https://app.netlify.com/drop) y **arrastre la carpeta** `jarvis-repo`. En diez segundos tendrá una dirección HTTPS funcionando (micrófono, cámara y notificaciones incluidos), sin cuenta.

---

## Después de publicarlo

| Quiero… | Cómo |
|---|---|
| Instalarlo en el teléfono | Abra su URL de Pages en Chrome/Safari → menú → **Añadir a pantalla de inicio** |
| El APK de Android | `https://github.com/pedrotoscano990-a11y/jarvis/raw/main/JARVIS.apk` (o descárguelo del repositorio) |
| Actualizarlo más adelante | Edite los archivos, y desde la carpeta: `git add -A && git commit -m "cambios" && git push` |
| Usar otro nombre de repositorio | `bash SUBIR-A-GITHUB.sh pedrotoscano990-a11y otro-nombre` |

---

## Credenciales — lo que GitHub le pedirá

GitHub **ya no acepta contraseñas** para empujar por HTTPS. Cuando el script se lo pida:

1. **Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token**
2. Marque el permiso **`repo`** (y **`workflow`** si quiere usar GitHub Actions)
3. Copie el token (solo se ve una vez)
4. Úselo **como contraseña** cuando git se lo pida. Usuario: `pedrotoscano990-a11y`

Guarde el token en su gestor de contraseñas; y si algún día cree que se filtró, revóquelo desde esa misma pantalla.

---

*Todo listo, señor. A un comando de distancia.*
