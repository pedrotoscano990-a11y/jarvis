# J.A.R.V.I.S. — Guía de instalación en tu teléfono

J.A.R.V.I.S. ya no es solo una página: es una **aplicación instalable** (PWA). Al instalarla en tu pantalla de inicio, se abre a pantalla completa, sin barra del navegador, como si fuera una app nativa — tu **hogar**.

---

## Archivos que componen el sistema

| Archivo | Función |
|---|---|
| `jarvis.html` | La aplicación completa (el sistema J.A.R.V.I.S.) |
| `index.html` | Copia servida como página principal (para el servidor) |
| `manifest.json` | Ficha de la aplicación: nombre, iconos, color, pantalla completa |
| `sw.js` | Service worker: guarda la app en caché para que funcione sin conexión |
| `icono-192.png`, `icono-512.png`, `icono-180.png`, `icono-maskable-512.png` | Iconos para la pantalla de inicio |

> Los cinco deben estar **juntos en la misma carpeta**.

---

## Opción 1 — La más rápida: desde la vista previa en vivo (HTTPS)

La vista previa corre sobre HTTPS, lo que habilita **micrófono, cámara, notificaciones y service worker**.

1. Abre la vista previa en el navegador de tu teléfono (Chrome en Android / Safari en iPhone).
2. **Android:** menú ⋮ → *Instalar aplicación* (o *Añadir a pantalla de inicio*).
   **iPhone:** botón *Compartir* → *Añadir a pantalla de inicio*.
3. Ábrela desde el icono. Ya tienes a J.A.R.V.I.S. como aplicación de inicio.

## Opción 2 — Permanente: alojarlo gratis (GitHub Pages / Netlify)

1. Crea un repositorio en GitHub y sube los archivos.
2. *Settings* → *Pages* → rama `main` → carpeta raíz → **Save**.
3. En 1–2 minutos tendrás una dirección `https://tuusuario.github.io/turepo/`.
4. Ábrela en el teléfono e instálala como en la opción 1.

*Alternativa sin GitHub:* entra a [app.netlify.com/drop](https://app.netlify.com/drop) y arrastra la carpeta completa. Te da HTTPS al instante.

## Opción 3 — Sin instalar (respaldo)

Descarga `jarvis.html` y ábrelo directamente en el navegador. Funciona todo **salvo** el micrófono y la instalación (los navegadores exigen HTTPS para esos permisos).

---

## Permisos que conviene conceder

| Permiso | Para qué | Cómo se pide |
|---|---|---|
| Micrófono | Órdenes de voz y modo manos libres | Al pulsar el botón del micrófono, o preguntando «manos libres» |
| Cámara | Módulo óptico («abre la cámara», «captura») | Al pedir el módulo óptico |
| Notificaciones | Avisos de temporizador y alarma | Comando «notifícame» |
| Ubicación | Clima de tu zona exacta | Al pedir «clima» o «situación del sistema» |
| Sensores de movimiento | Detecta cuando agitas el teléfono | Comando «activa los sensores» |

---

## Comandos de teléfono y hogar

**Terminal**
- «¿Estás conectado a mi teléfono?» · «estado del teléfono»
- «vibra» · «notifícame» · «copia eso» · «comparte los titulares»

**Tiempo y alarma**
- «temporizador de 20 minutos» · «despiértame a las 7» · «cuánto queda» · «cancela la alarma»

**Hogar**
- «manos libres» — escucha continua; basta decir «Jarvis» para dar órdenes
- «buenos días» — rutina matinal: fecha, tiempo, agenda y titulares
- «buenas noches» — deja la casa en reposo y pregunta a qué hora despertarte
- «mantén la pantalla encendida» · «instala en mi teléfono»
- «abre la cámara» → «captura» → «guarda imagen»

---

*Nota honesta, señor: dentro del navegador no es posible leer sus correos, WhatsApp ni contactos; ningún sitio web puede hacerlo sin permisos que los navegadores no conceden. J.A.R.V.I.S. gobierna cuanto el navegador expone — voz, cámara, batería, vibración, notificaciones, sensores, pantalla y datos — y lo hace con la elegancia que corresponde.*
