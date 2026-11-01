# StarterApp PWA

A small installable web app starter. It can be added to an iPhone Home Screen from Safari and can cache its core files for offline use after the first successful load.

## Files

- `index.html` — app structure
- `style.css` — visual design
- `app.js` — button behavior and service-worker registration
- `manifest.json` — install metadata
- `service-worker.js` — offline cache
- `icon-192.png`, `icon-512.png` — app icons

## Run locally

A PWA's service worker requires localhost or HTTPS. From this folder, run:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000` on the Mac. This is for local preview; it does not make the site available to your iPhone over the internet.

## Publish it

Upload the contents of this folder to a static hosting provider that serves HTTPS, such as GitHub Pages, Netlify, or Cloudflare Pages. Keep the files together at the site root (or adjust the manifest and service-worker paths if deploying in a subfolder).

After deployment, open the HTTPS URL in Safari on the iPhone.

## Install on iPhone

1. Open the published HTTPS website in Safari (not an in-app browser).
2. Tap the Share button.
3. Choose **Add to Home Screen**.
4. If shown, enable **Open as Web App**.
5. Tap **Add**.

The icon should appear on the Home Screen. This is a web app, not a signed native `.ipa`.

## Customize

- Change visible text in `index.html`.
- Change colors and layout in `style.css`.
- Add app behavior in `app.js`.
- If you change cached filenames, update `APP_FILES` in `service-worker.js`.
- Increment `CACHE_NAME` in `service-worker.js` when you want existing installations to refresh their cache.
