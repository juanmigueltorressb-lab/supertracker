# SuperTracker v4 — PWA

App de seguimiento de gastos de supermercado con análisis por IA.

## Archivos necesarios
```
supertracker/
├── index.html       ← app principal
├── manifest.json    ← configuración PWA
├── sw.js            ← service worker (modo offline)
└── icons/           ← íconos de la app
    ├── icon-192x192.png
    └── icon-512x512.png
    (+ otros tamaños)
```

## Cómo instalar en tu celular Android

### Opción A — GitHub Pages (gratis, recomendada)
1. Creá una cuenta en https://github.com
2. Nuevo repositorio → nombre: `supertracker` → público
3. Subí todos los archivos (index.html, manifest.json, sw.js, carpeta icons/)
4. Ir a Settings → Pages → Source: main / root → Save
5. Tu app va a estar en: `https://TU-USUARIO.github.io/supertracker`
6. Abrí esa URL en Chrome Android
7. Chrome va a mostrar "Agregar a pantalla de inicio" → tocá Instalar
8. ¡Listo! Aparece como app nativa en tu celular

### Opción B — Netlify (gratis, arrastrar y soltar)
1. Ir a https://netlify.com → Log in con Google
2. "Deploy manually" → arrastrá la carpeta `supertracker/`
3. Te da una URL pública al instante
4. Abrila en Chrome Android → instalar

### Opción C — Servidor propio
Cualquier servidor web nginx/apache sirve.
El Service Worker requiere HTTPS (o localhost).

## Configuración de API Key
La primera vez que uses la app en la pestaña "Cargar",
pedirá tu API Key de Anthropic.
Obtenela en: https://console.anthropic.com/api-keys
Formato: sk-ant-...
Se guarda solo en tu dispositivo.

## Funcionalidades v4
- Recorte de ticket con 4 puntos arrastrables
- Pre-procesamiento de imagen (contraste + nitidez)
- Análisis IA con nivel de confianza por campo
- Validación automática total vs suma de productos
- Edición completa de cualquier ticket
- Modo oscuro automático
- Funciona sin internet (datos guardados localmente)
- Instalable como app nativa Android/iOS
