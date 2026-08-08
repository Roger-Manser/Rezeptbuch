const CACHE_NAME='rezeptbuch-'+Date.now();

console.log('🔄 [SW] Cache initialized:', CACHE_NAME);

// Install - minimal cachen
self.addEventListener('install',(e)=>{
  console.log('[SW] Install');
  self.skipWaiting();
});

// Activate - alle alten Caches löschen
self.addEventListener('activate',(e)=>{
  console.log('[SW] Activate - deleting all old caches');
  e.waitUntil(
    caches.keys().then(names=>{
      return Promise.all(names.map(name=>{
        if(name!==CACHE_NAME){
          console.log('[SW] Delete:', name);
          return caches.delete(name);
        }
      }));
    })
  );
  self.clients.claim();
});

// Fetch - HTML NIEMALS Cache, CSS auch nicht, nur JS+Assets
self.addEventListener('fetch',(e)=>{
  const url=new URL(e.request.url);
  
  // Nur rezeptbuch-Scope
  if(!url.pathname.startsWith('/rezeptbuch/')) return;
  
  // HTML + CSS: NETWORK ONLY! (keine Cache!)
  if(e.request.mode==='navigate' || url.pathname.includes('.html') || url.pathname.includes('.css')){
    e.respondWith(
      fetch(e.request)
        .then(res=>{
          console.log('[SW] Fetched from network:', url.pathname);
          return res;
        })
        .catch(err=>{
          console.log('[SW] Network failed, offline:', err);
          return new Response('Offline - Netzwerk nicht erreichbar', {status: 503});
        })
    );
  } else {
    // Nur JS + Assets: Cache first
    e.respondWith(
      caches.match(e.request).then(cached=>{
        if(cached){
          console.log('[SW] From cache:', url.pathname);
          return cached;
        }
        return fetch(e.request).then(res=>{
          if(res && res.status===200){
            const clone=res.clone();
            caches.open(CACHE_NAME).then(c=>c.put(e.request,clone));
          }
          return res;
        }).catch(()=>new Response('Offline'));
      })
    );
  }
});
