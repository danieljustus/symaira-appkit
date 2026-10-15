# Symaira Design Kit · „Liquid Topography“

Gemeinsame Designquelle für alle Symaira-Apps (macOS, iOS) und symaira.com.

## Inhalt

| Pfad | Zweck | Bearbeiten? |
|---|---|---|
| `DESIGN.md` | Farben, Schrift, Radien, Abstände, Komponenten und Regeln (Google-DESIGN.md-Format) | ✅ Quelle |
| `topo.json` | Parameter der Topografie: Linien, Deckkraft, Zustände, fps | ✅ Quelle |
| `build.py` | erzeugt `dist/` und prüft 34 Kontrastpaare (hell und dunkel) | – |
| `dist/tokens.css` | CSS-Variablen `--sym-*`, hell/dunkel über `prefers-color-scheme` oder `data-theme` | ❌ generiert |
| `../../Sources/SymairaTheme/SymairaTokens.swift` | adaptive SwiftUI-Farben, Radien, Abstände, Topo-Parameter (auch in `dist/`) | ❌ generiert |
| `dist/tokens.json` | flache Token-Liste für andere Tools | ❌ generiert |
| `web/symaira-topo.js` | reaktive Topografie für das Web (WebGL2, ohne Abhängigkeiten) | ✅ |
| `web/demo.html` | Demo, die nur Kit-Dateien nutzt | – |
| `../../Sources/SymairaTheme/Resources/SymairaTopo.metal` | dieselbe Topografie als Metal-Shader | ✅ |
| `../../Sources/SymairaTheme/SymairaTopoView.swift` | SwiftUI-View und `.topoProtected()`-Modifier | ✅ |

## Ablauf nach Änderungen

```bash
python3 build.py                              # dist/ neu erzeugen + Kontraste prüfen (Exit 1 bei Verstoß)
npx -y @google/design.md lint DESIGN.md       # Struktur + Referenzen + WCAG
```

## Web

```html
<link rel="stylesheet" href="dist/tokens.css">
<main id="app"> <section data-topo="hill">…</section> <span data-topo-status role="status">…</span> </main>
<script type="module">
  import { mountTopo } from "./web/symaira-topo.js";
  const topo = mountTopo(document.getElementById("app"), { params: await (await fetch("topo.json")).json() });
  topo.setState("thinking");
</script>
```

## SwiftUI

```swift
@State var topo = SymairaTopoModel()
ZStack {
    SymairaTopoView(model: topo)
    ContentView().topoProtected(in: topo, hill: true)
}
.coordinateSpace(name: SymairaTopo.space)
// topo.state = .thinking
```

Die `.metal`-Datei muss im App- bzw. Package-Target liegen, damit `ShaderLibrary` sie findet.

## Status

Siehe `DESIGN.md` → *Known Gaps*. SwiftUI-Clients nutzen `import SymairaTheme`; die Web-Komponente wird nach `symaira.com` vendored.

## Native Demos

```bash
zsh design/liquid-topography/apple/Demo/build-ios.sh <ausgabeordner>   # iOS-Simulator
```

### macOS

```bash
zsh design/liquid-topography/apple/Demo/build.sh <ausgabeordner>   # baut .app mit swiftc + metallib, ohne Xcode-Projekt
```
