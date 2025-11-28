// Killer Service Worker
// This SW replaces the Shinylive SW and immediately claims control,
// passing all requests to the network (bypassing cache).

self.addEventListener('install', (event) => {
  // Force this SW to become the active one immediately
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  // Take control of all clients immediately
  event.waitUntil(self.clients.claim());
  
  // Optional: Force reload of all open clients to ensure they get fresh content
  self.clients.matchAll({ type: 'window' }).then(clients => {
    clients.forEach(client => client.navigate(client.url));
  });
});

// No fetch event listener means all network requests go directly to the network.
