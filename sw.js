/* J.A.R.V.I.S. — service worker
   Cachea la aplicación para que funcione sin conexión. */
const CACHE = "jarvis-v1";
const ARCHIVOS = ["./","./index.html","./jarvis.html","./manifest.json","./icono-192.png","./icono-512.png","./icono-180.png","./icono-maskable-512.png"];

self.addEventListener("install", (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(ARCHIVOS)).then(() => self.skipWaiting()));
});

self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then((claves) => Promise.all(claves.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener("fetch", (e) => {
  const url = new URL(e.request.url);
  /* la aplicación se sirve de caché; los datos (clima, noticias) siempre frescos */
  if(url.origin === location.origin){
    e.respondWith(
      caches.match(e.request).then((r) => r || fetch(e.request).then((resp) => {
        if(e.request.method === "GET" && resp.ok){
          const copia = resp.clone();
          caches.open(CACHE).then((c) => c.put(e.request, copia));
        }
        return resp;
      }).catch(() => caches.match("./jarvis.html")))
    );
  }
});
