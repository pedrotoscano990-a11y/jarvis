<div align="center">

# J.A.R.V.I.S.
### Just A Rather Very Intelligent System

*Asistente personal estilo Iron Man — web, PWA y aplicación nativa de Android.*

[![Web](https://img.shields.io/badge/web-en%20vivo-5ad7ff?style=flat-square)](#-versión-web)
[![APK](https://img.shields.io/badge/APK-3.3%20MB-ffb84d?style=flat-square)](#-aplicación-nativa-android)
[![Kotlin](https://img.shields.io/badge/Kotlin-1.9-7f52ff?style=flat-square)](#-aplicación-nativa-android)
[![Licencia](https://img.shields.io/badge/licencia-MIT-0a93c4?style=flat-square)](LICENSE)

</div>

---

## ¿Qué es esto?

J.A.R.V.I.S. es un asistente con voz en español que responde como el de las películas: **cortés, calmado, formal, leal y con ironía sutil**. Siempre le llama *señor*. Nunca dice ser una inteligencia artificial: **es el sistema**.

Funciona de tres maneras:

| Forma | Dónde vive | Qué puede hacer |
|---|---|---|
| **Web** | Cualquier navegador | Voz, clima, noticias, seguridad, memoria |
| **PWA instalable** | Pantalla de inicio | Todo lo anterior + funcionar sin conexión |
| **App nativa Android** | Su teléfono | **Todo lo anterior + gobernar el teléfono** |

---

## 📱 Aplicación nativa (Android)

**Descargue [`JARVIS.apk`](JARVIS.apk)** (3,3 MB · Android 7+).

### Gobierna el teléfono de verdad
- **Llamadas** — «llama a Ana»
- **Mensajes** — «manda un mensaje a mamá diciendo ya voy»
- **Notificaciones** — «qué notificaciones tengo» (lee WhatsApp, correo, banco…)
- **Aplicaciones** — «abre whatsapp» (abre la app real, no la web)
- **Hardware** — linterna, brillo, volumen, batería, archivos, sensores
- **Voz nativa** con **palabra clave**: diga «Jarvis» y acude sin tocar nada
- **Guardia permanente**: servicio en primer plano que sobrevive al cierre y al reinicio

### Automatizaciones
```
«cada día a las 7:30 dame los buenos días y el parte»
«cuando la batería baje del 20 avísame»
«guarda mi casa»            (fija el punto estando allí)
«cuando llegue a casa avísame»
«mis automatizaciones»      «borra la automatización 2»
```
Las de hora y batería se evalúan **incluso con la app cerrada** (desde el servicio en primer plano).

### Núcleo vivo: reescribe su propio código
Su lógica de mando vive en `nucleo_vivo.js`, dentro de su almacenamiento, y se **compila en caliente**:

- **«modo desarrollador»** → abre su propio código fuente en pantalla; usted lo edita y pulsa *Compilar y aplicar* → sube una **generación**.
- **«aprende: cuando diga X, responde Y»** → J.A.R.V.I.S. escribe él mismo la línea en su núcleo.
- **«restaura tu código»** → vuelve atrás (guarda respaldo automático antes de cada cambio).
- Diario y memoria persistentes: «tu diario», «qué recuerdas de mí», «reflexiona».

---

## 🌐 Versión web

Una vez publicado con GitHub Pages, quedará en:
`https://pedrotoscano990-a11y.github.io/jarvis/`

- HUD estilo Stark con reactor Arc animado
- Informe del día: **tiempo real, agenda y noticias de México en vivo**
- Módulo de seguridad lúdico: antivirus, firewall y **Protocolo Viuda** (contravirus que desmantela amenazas)
- Cinta de titulares con 7 secciones (México, mundo, tecnología, economía, deportes, ciencia, espectáculos)
- Temporalizadores, rutinas «buenos días» / «buenas noches», memoria del señor

---

## 🗣️ Frases clave

| Frase | Respuesta |
|---|---|
| «Jarvis, ¿estás ahí?» | *Siempre presente, señor. Aguardo sus instrucciones.* |
| «Jarvis, activar todo» | Reactor a plena potencia |
| «Jarvis, silencio» | *Silencio, señor.* |
| «Jarvis, gracias» | *Un placer, señor.* |
| «Jarvis, apagar» | Modo reposo; solo responde a su nombre |
| «Situación del sistema» | Tiempo + resumen del día + noticias + seguridad |

Al cumplir cualquier tarea: **«Tarea completada. ¿Hay algo más en lo que pueda asistirle?»**

---

## 🚀 Publicar en GitHub (un solo comando)

Este repositorio ya incluye un script que hace **todo** el traslado: inicia el repositorio local, registra los cambios, crea el repositorio remoto y sube los archivos.

**macOS / Linux / Git Bash (Windows):**
```bash
bash SUBIR-A-GITHUB.sh
```

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File SUBIR-A-GITHUB.ps1
```

El script pregunta sus datos **una sola vez** (usuario y nombre del repositorio), los guarda en `mis-datos.txt` y a partir de ahí trabaja sin molestarle. También puede dárselos de entrada:

```bash
bash SUBIR-A-GITHUB.sh TU-USUARIO jarvis
```

Si tiene instalado [GitHub CLI](https://cli.github.com) y ya se autenticó (`gh auth login`), **lo hace aún más solo**: crea el repositorio *y* activa Pages automáticamente, sin abrir el navegador ni pedirle nada.

Después de subirlo, un último clic en GitHub:
**Settings → Pages → Source: `Deploy from a branch` → `main` / `(root)` → Save**
En un minuto: `https://pedrotoscano990-a11y.github.io/jarvis/`

### Sus direcciones (cuando lo suba)

| | Dirección |
|---|---|
| Repositorio | `https://github.com/pedrotoscano990-a11y/jarvis` |
| Aplicación web (tras activar Pages) | `https://pedrotoscano990-a11y.github.io/jarvis/` |

### A mano, si lo prefiere
```bash
git init
git add .
git commit -m "J.A.R.V.I.S. — primera versión"
git branch -M main
git remote add origin https://github.com/pedrotoscano990-a11y/jarvis.git
git push -u origin main
```

### Sin usar la terminal
1. Cree un repositorio en [github.com/new](https://github.com/new) (público, sin README).
2. En la página del repositorio: **Add file → Upload files** → arrastre **todo el contenido** de la carpeta.
3. **Commit changes** → después active Pages como arriba.

> **Alternativa instantánea (sin cuenta):** arrastre la carpeta a [app.netlify.com/drop](https://app.netlify.com/drop) y tendrá una dirección HTTPS en 10 segundos.

---

## 📂 Estructura

```
├── index.html              ← la aplicación (página principal)
├── jarvis.html             ← la misma aplicación (nombre alternativo)
├── manifest.json           ← ficha PWA (iconos, pantalla completa)
├── sw.js                   ← service worker (funciona sin conexión)
├── icono-*.png             ← iconos del reactor Arc
├── JARVIS.apk              ← aplicación nativa Android
├── android/                ← código fuente Kotlin (Android Studio)
├── capturas/               ← imágenes de la interfaz
├── ENLACES.md              ← guía personalizada de publicación en GitHub
├── LEEME-JARVIS.md         ← guía de la versión web / PWA
└── LEEME-JARVIS-ANDROID.md ← guía de la app nativa
```

---

## ⚖️ Aviso honesto

- **Proyecto de aficionado.** J.A.R.V.I.S. y Iron Man son personajes de Marvel / Disney. Este proyecto no está afiliado ni patrocinado por ellos.
- **El módulo de seguridad web es una simulación** de entretenimiento; la verificación de integridad de la terminal que reporta sí es real.
- El APK pide permisos poderosos (SMS, llamadas, notificaciones) porque **usted se lo pidió**. Es una compilación firmada con clave de desarrollo: el código completo es auditable en `android/`.
- El «núcleo vivo» puede reescribir su lógica en caliente, pero **no puede recompilar su propio APK**: eso se hace con Android Studio, y está todo aquí.
- Leer el buzón completo de Gmail requiere una credencial OAuth de Google que solo usted puede crear. Las notificaciones sí se leen.

---

<div align="center">

*Quedo de guardia, señor.*

</div>
