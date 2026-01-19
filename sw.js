self.addEventListener("install", e => {
  e.waitUntil(
    caches.open("voddic-esp").then(cache =>
      cache.addAll([
        "/",
        "/index.html",
        "/app.html",
        "/manifest.json"
      ])
    )
  );
});
