self.addEventListener("install", e => {
  e.waitUntil(
    caches.open("voddic-esp-app").then(cache =>
      cache.addAll([
        "/app.html",
        "/manifest.json",
        "/assets/images/resources/voddic-ltd2.png",
        "/assets/images/resources/voddic-ltd2.png"
      ])
    )
  );
});

self.addEventListener("fetch", e => {
  if (!e.request.url.includes("192.168.4.1")) {
    e.respondWith(
      caches.match(e.request).then(res => res || fetch(e.request))
    );
  }
});
