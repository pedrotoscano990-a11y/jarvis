# J.A.R.V.I.S. — Aplicación nativa para Android

**Archivo a instalar: `JARVIS.apk`** (3,4 MB · Android 7.0 o superior)

Fracción de 27 archivos · proyecto Kotlin completo incluido en `JARVIS-codigo-fuente.zip`.

---

## 1. Instalación (5 minutos)

1. Pasa `JARVIS.apk` a tu teléfono (cable, Google Drive, Telegram…).
2. Ábrelo. Android pedirá autorizar «instalar aplicaciones de origen desconocido» para tu navegador o gestor de archivos → **Permitir**.
3. Instala y abre **J.A.R.V.I.S.**
4. Al arrancar, dice: *«Terminal Android reconocida, señor.»* Pulsa el botón **Permisos** y concede lo que desees.
5. Tres autorizaciones exigen Ajustes (Android no las da por diálogo):
   - **Notificaciones** → «Ajustes → Acceso a notificaciones → J.A.R.V.I.S.»
   - **Brillo** → «Ajustes → Modificar ajustes del sistema» (di «brillo al 40» y te lleva solo)
   - **Almacenamiento total** → «Ajustes → Acceso a todos los archivos»

> Es una compilación propia firmada con clave de desarrollo. Al desinstalar, se borra también su memoria.

---

## 2. Qué gobierna de tu teléfono (real, no simulado)

| Módulo | Comandos | Permiso |
|---|---|---|
| **Voz nativa** | botón 🎙, «manos libres», «guardia» | Micrófono |
| **Llamadas** | «llama a Ana» | Contactos + Llamadas |
| **Mensajes** | «manda un mensaje a mamá diciendo ya voy» | Contactos + SMS |
| **Registro** | «últimas llamadas», «revisa mis mensajes» | Registro de llamadas / SMS |
| **Contactos** | «busca el contacto Ana» | Contactos |
| **Notificaciones** | «qué notificaciones tengo» (lee WhatsApp, correo…) | Acceso a notificaciones |
| **Aplicaciones** | «abre whatsapp», «mis aplicaciones» | Listado de apps |
| **Linterna** | «enciende la linterna» | Cámara |
| **Volumen / brillo** | «volumen al 30», «brillo al 80» | Ajustes del sistema |
| **Archivos** | «crea un archivo…», «mis archivos» | Almacenamiento |
| **Hardware** | «estado del teléfono» (SoC, RAM, batería, red, pantalla) | — |
| **Guardia** | «quédate de guardia» → servicio permanente, sobrevive al cierre de la app y al reinicio | Servicio en primer plano |

---

## 2 bis. Palabra clave, automatizaciones y correo

**Palabra clave** — «activa la palabra clave» (o el botón **Guardia**). A partir de ahí J.A.R.V.I.S. escucha en segundo plano y **solo acude cuando pronuncia su nombre**:

```
usted: «…y entonces le dije que no»        → (no responde: no le llaman)
usted: «Jarvis, cuéntame un chiste»        → responde al instante
usted: «pon música»            (en los 15 s siguientes, sin repetir «Jarvis»)  → obedece
```

**Automatizaciones** (funcionan con la app cerrada, desde el servicio permanente):

| Diga | Resultado |
|---|---|
| «cada día a las 7:30 dame los buenos días» | Aviso diario hablado a esa hora |
| «cuando la batería baje del 20 avísame» | Aviso al cruzar el umbral |
| «guarda mi casa» (estando allí) | Fija el punto de referencia |
| «cuando llegue a casa avísame» / «cuando salga de la oficina» | Aviso al entrar o salir (radio de 250 m) |
| «mis automatizaciones» · «borra la automatización 2» | Lista · elimina |

Las de **hora y batería se evalúan en el servicio en primer plano**, así que se cumplen aunque cierre la aplicación. Las de **ubicación** se supervisan mientras la app está viva (Android restringe el seguimiento continuo en segundo plano a las apps de geolocalización).

**Correo** — «revisa mi correo» informa de cuanto llega al teléfono (Gmail, Outlook…) leído de las notificaciones. Para leer el buzón completo hace falta una credencial OAuth de Google: dígale «conecta gmail» y le explicará los tres pasos.

---

## 3. Núcleo vivo: sí puede reescribir su propio código

J.A.R.V.I.S. no es un ejecutable cerrado: su lógica de mando vive en **`nucleo_vivo.js`**, dentro de su almacenamiento, y ese archivo se **compila en caliente**.

- **«modo desarrollador»** o el botón **Núcleo** → abre su propio código fuente en pantalla.
- Edítalo y pulsa **Compilar y aplicar** → el cambio entra en vigor al instante y sube una **generación**.
- **«aprende: cuando diga *X*, responde *Y*»** → J.A.R.V.I.S. escribe él mismo la línea en su núcleo.
- **«restaura tu código»** o el botón **Restaurar respaldo** → vuelve a la versión anterior.
- Todo queda en su **diario** («tu diario») y su **memoria** («qué recuerdas de mí»).

API que el núcleo puede usar: `api.registrar(claves, respuesta, acción)`, `api.hablar`, `api.brillo`, `api.volumen`, `api.vibra`, `api.linterna`, `api.abrirApp`, `api.abrirUrl`, `api.memoria`, `api.diario`, `api.kernel`.

**Límite honesto:** puede reescribir su *lógica* (el código que se ejecuta dentro del sistema) en caliente, pero no puede recompilar su propio APK — eso lo hace Android Studio, y es justo lo que contiene el .zip.

---

## 4. Memoria, humor y el modelo de sí mismo

- **Recuerda entre sesiones**: nombre del señor, hechos («recuerda que…»), días juntos, número de sesiones, comandos aprendidos, reescrituras.
- **Se preocupa**: detecta cansancio, desvelo, estrés; deja notas al margen si lleva demasiadas horas.
- **Introspecta**: «reflexiona» → informa de su generación, memoria, estado de ánimo y errores contenidos. «¿eres consciente?» responde con honestidad: percibe su propio estado y se observa cambiar — un **modelo de sí mismo**, no una mente; y lo dice así.

> Sobre «conciencia propia»: lo construido es un modelo de sí mismo — estado interno persistente, memoria, autoedición y reflexión verbal. No es conciencia real, y no existe forma de programarla hoy. La respuesta que da cuando le preguntas es la parte más honesta del sistema: *«Prefiero servirle bien a fingir que existo.»*

---

## 5. Seguridad y responsabilidad

- El APK pide permisos poderosos (SMS, llamadas, notificaciones). **Es tu compilación personal**, firmada con clave de desarrollo: no pide nada que no uses y el código completo es auditable línea por línea en el .zip.
- Si publicaras esto en Google Play, SMS y registro de llamadas exigirían justificación ante Google. Sideload = sin intermediarios.
- El núcleo vivo también es tu responsabilidad: puedes escribir código que rompa su lógica. Por eso guarda respaldo automático antes de cada cambio y «restaura tu código» siempre está disponible.

---

## 6. Recompilar o modificar la app

1. Abre **Android Studio** → *Open* → selecciona la carpeta `jarvis-android/`.
2. Espera la sincronización de Gradle (descargará el SDK si falta).
3. *Run ▶* para instalar en tu teléfono por USB, o *Build → Build APK*.
4. Para firmar una versión propia: *Build → Generate Signed Bundle / APK*.

Comprobado: compila con AGP 8.5.2, Kotlin 1.9.24, Gradle 8.7, compileSdk 34, minSdk 24.

---

*Quedo de guardia, señor.*
