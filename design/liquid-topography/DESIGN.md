---
version: alpha
name: Symaira Liquid Topography
description: Graue, ruhige Arbeitsflächen im Codex-Stil. Champagner nur als Akzent. Eine fluide, reaktive Topografie als einziges Markenornament.
colors:
  # Hell (Standardwerte) und Dunkel (Suffix -dark). Jede Rolle existiert in beiden Modi.
  primary: "#76664C"
  primary-dark: "#C7B89E"
  on-primary: "#FFFFFF"
  on-primary-dark: "#1A1814"
  primary-soft: "#E2DED5"
  primary-soft-dark: "#312F2B"
  canvas: "#ECECEA"
  canvas-dark: "#1C1C1B"
  sidebar: "#E4E4E1"
  sidebar-dark: "#171716"
  surface: "#F7F7F5"
  surface-dark: "#242423"
  raised: "#E6E6E3"
  raised-dark: "#2B2B2A"
  selection: "#DADAD6"
  selection-dark: "#2D2D2C"
  line: "#D3D2CE"
  line-dark: "#363634"
  ink: "#1C1C1A"
  ink-dark: "#EEEDEA"
  ink-2: "#4E4D49"
  ink-2-dark: "#B0AEA9"
  ink-3: "#62615D"
  ink-3-dark: "#97958F"
  positive: "#3A7550"
  positive-dark: "#93C49F"
  critical: "#9A4634"
  critical-dark: "#E39C8A"
  critical-soft: "#F2DED8"
  critical-soft-dark: "#3A2925"
  topo: "#282824"
  topo-dark: "#E1E0DA"
typography:
  body:
    fontFamily: SF Pro Text
    fontSize: 13.5px
    fontWeight: 500
    lineHeight: 1.5
  body-lg:
    fontFamily: SF Pro Text
    fontSize: 14.5px
    fontWeight: 500
    lineHeight: 1.5
  label:
    fontFamily: SF Pro Text
    fontSize: 12.5px
    fontWeight: 600
    lineHeight: 1.4
  caption:
    fontFamily: SF Pro Text
    fontSize: 11.5px
    fontWeight: 600
    lineHeight: 1.4
  title:
    fontFamily: SF Pro Text
    fontSize: 14px
    fontWeight: 650
    lineHeight: 1.35
  headline:
    fontFamily: SF Pro Display
    fontSize: 16px
    fontWeight: 700
    lineHeight: 1.3
    letterSpacing: "-0.01em"
  stat:
    fontFamily: SF Pro Display
    fontSize: 22px
    fontWeight: 700
    lineHeight: 1.15
    letterSpacing: "-0.02em"
  mono:
    fontFamily: SF Mono
    fontSize: 12.5px
    fontWeight: 500
    lineHeight: 1.65
rounded:
  sm: 6px
  md: 10px
  lg: 14px
  xl: 20px
  pill: 999px
spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  xxl: 32px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label}"
    rounded: "{rounded.md}"
    padding: 8px 16px
  button-primary-dark:
    backgroundColor: "{colors.primary-dark}"
    textColor: "{colors.on-primary-dark}"
    rounded: "{rounded.md}"
  button-secondary:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    typography: "{typography.label}"
    rounded: "{rounded.md}"
    padding: 7px 15px
  button-secondary-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-dark}"
  pill:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink-2}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: 6px 14px
  pill-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-2-dark}"
  chip:
    backgroundColor: "{colors.primary-soft}"
    textColor: "{colors.ink}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: 4px 12px
  chip-dark:
    backgroundColor: "{colors.primary-soft-dark}"
    textColor: "{colors.ink-dark}"
  sidebar-item:
    backgroundColor: "{colors.sidebar}"
    textColor: "{colors.ink-2}"
    rounded: "{rounded.md}"
    padding: 8px 12px
  sidebar-item-dark:
    backgroundColor: "{colors.sidebar-dark}"
    textColor: "{colors.ink-2-dark}"
  sidebar-item-selected:
    backgroundColor: "{colors.selection}"
    textColor: "{colors.ink}"
  sidebar-item-selected-dark:
    backgroundColor: "{colors.selection-dark}"
    textColor: "{colors.ink-dark}"
  canvas-meta:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink-3}"
    typography: "{typography.caption}"
  canvas-meta-dark:
    backgroundColor: "{colors.canvas-dark}"
    textColor: "{colors.ink-3-dark}"
  card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: 14px 16px
  card-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-dark}"
  user-bubble:
    backgroundColor: "{colors.raised}"
    textColor: "{colors.ink}"
    typography: "{typography.body}"
    rounded: "{rounded.xl}"
    padding: 11px 16px
  user-bubble-dark:
    backgroundColor: "{colors.raised-dark}"
    textColor: "{colors.ink-dark}"
  composer:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    typography: "{typography.body-lg}"
    rounded: "{rounded.xl}"
    padding: 14px 12px 10px 18px
  composer-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-dark}"
  code-block:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    typography: "{typography.mono}"
    rounded: "{rounded.lg}"
  code-block-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-dark}"
  stat-card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    typography: "{typography.stat}"
    rounded: "{rounded.lg}"
  stat-card-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.ink-dark}"
  code-addition:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.positive}"
  code-addition-dark:
    backgroundColor: "{colors.surface-dark}"
    textColor: "{colors.positive-dark}"
  alert-critical:
    backgroundColor: "{colors.critical-soft}"
    textColor: "{colors.critical}"
    typography: "{typography.title}"
    rounded: "{rounded.lg}"
    padding: 16px 18px
  alert-critical-dark:
    backgroundColor: "{colors.critical-soft-dark}"
    textColor: "{colors.critical-dark}"
  divider:
    backgroundColor: "{colors.line}"
    textColor: "{colors.ink}"
  divider-dark:
    backgroundColor: "{colors.line-dark}"
    textColor: "{colors.ink-dark}"
  topo-layer:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.topo}"
  topo-layer-dark:
    backgroundColor: "{colors.canvas-dark}"
    textColor: "{colors.topo-dark}"
---

## Overview

Symaira Liquid Topography ist das gemeinsame Designsystem für alle Symaira-Produkte: Brain, Desktop, Cockpit, Vault, EraseMe, Fritz und symaira.com. Vorbild ist die Codex-Desktop-App. Die Oberfläche besteht aus ruhigen grauen Flächen mit einer zentrierten Inhaltsspalte, einer schwebenden Eingabebox und sehr wenig Dekoration. Eigenständig wird Symaira durch zwei Dinge:

1. **Champagner** als einzige Akzentfarbe, sparsam eingesetzt.
2. **Die Liquid Topography**, eine fluide topografische Hintergrundebene. Sie reagiert auf Zustand, Maus und GUI-Elemente, ohne je die Lesbarkeit zu stören.

Die Wirkung soll ruhig, präzise und hochwertig sein, wie eine Landkarte in einem stillen Raum. Werkzeug geht vor Show.

## Colors

Jede Rolle gibt es hell (Standardwert) und dunkel (Suffix `-dark`). Code nutzt immer die Rolle, nie den Hexwert.

- **canvas / sidebar / surface / raised:** Graustufen mit minimaler Wärme. Von hinten nach vorne: canvas, sidebar, surface (Karten, Eingabebox), raised (Nutzer-Blase, Hover).
- **ink / ink-2 / ink-3:** Haupttext, Sekundärtext, Metadaten. Selbst `ink-3` erreicht auf canvas mindestens 4.5:1. Noch blasseren Text gibt es nicht.
- **primary (Champagner):** nur für Primäraktion, Senden-Knopf, Fokusring, Avatar, aktiven Status. Höchstens eine Primäraktion pro Ansicht.
- **critical / positive:** nur für Status und Diff-Zeilen, immer zusätzlich mit Text oder Symbol, nie allein über die Farbe.
- **topo:** Farbe der Höhenlinien. Sie wird nur mit sehr geringer Deckkraft verwendet (siehe Liquid Topography).

## Typography

Systemschrift von Apple: SF Pro Text für UI, SF Pro Display ab 16px, SF Mono für Code. Im Web lautet die Kette `-apple-system, BlinkMacSystemFont, "SF Pro Text", "Inter", system-ui, sans-serif`. Inter (selbst gehostet, Variable Font) ist der Ersatz für Nicht-Apple-Geräte.

Die Schrift ist bewusst kräftiger als üblich. Fließtext hat 500, Labels und Buttons 600, Titel 650, Überschriften 700. Auf Plattformen ohne variable Gewichte wird 650 als Semibold dargestellt.

## Layout

- App-Fenster: Sidebar mit 272px, Hauptbereich mit Kopfzeile von 56px, Inhaltsspalte maximal 640 bis 720px, zentriert.
- Großzügige Innenabstände: Buttons 7–8px × 15–16px, Pills 6×14px, Sidebar-Einträge 8×12px, Eingabebox 14/12/10/18px.
- Abstandsraster in 4px-Schritten, gängig sind 8, 12, 16, 20 und 24px.
- Touch-Ziele mindestens 44pt auf iOS und 32px bei Mausbedienung.

## Elevation & Depth

Tiefe entsteht fast nur durch Flächenstufen und 1px-Linien (`line`). Schatten gibt es nur bei schwebenden Elementen (Eingabebox, Panels, Menüs): `0 1px 2px rgba(0,0,0,.05), 0 10px 28px rgba(0,0,0,.10)`. Kein Glas über Text. Die Topografie liegt immer auf der untersten Ebene.

### Liquid Glass (nur Apple-Plattformen)

Zwei Ebenen mit getrennten Aufgaben: **Liquid Glass ist die Bedienschicht, Liquid Topography der Hintergrund.**

- **Glas:** Seitenleiste, Toolbar, Tab-Leiste, schwebende Bedienelemente (z. B. Senden, Zustandsauswahl). Native APIs (`NavigationSplitView`, Toolbars, `glassEffect`, `GlassEffectContainer`) auf macOS 26 / iOS 26 und neuer, darunter Systemmaterial. Die Topografie darf unter dem Glas leicht durchscheinen.
- **Deckend:** alle Inhaltsflächen mit Text: Karten, Code, Nutzer-Blasen, Eingabebox, Tabellen, Meldungen. Sie bleiben `surface`/`raised`.
- **Web und andere Plattformen:** nur deckende Flächen, keine Glas-Imitation per `backdrop-filter`.
- „Transparenz reduzieren“ ersetzt Glas durch deckendes `sidebar`.

## Shapes

Radien: 6px für Code-Inline, 10px für Buttons und Einträge, 14px für Karten, 20px für Eingabebox und Blasen sowie 999px für Pills und Chips. Icons sind Linien-Icons mit 2.0 Strichstärke, runden Enden und 16–17px Größe. Der Senden-Pfeil hat 2.4. Auf Apple-Plattformen werden SF Symbols mit Gewicht `.semibold` verwendet.

## Components

Siehe `components:` oben. Varianten sind eigene Einträge (`button-primary-dark`). Fokus wird immer mit einem 2px-Ring in `primary` und 2px Abstand dargestellt (`:focus-visible`), nie nur durch eine Farbänderung.

## Liquid Topography (Topografie-Ebene)

Die Hintergrundebene ist ein Shader. Im Web läuft er über WebGL2 (`web/symaira-topo.js`), auf macOS und iOS über Metal (`apple/SymairaTopo.metal`). Beide nutzen denselben Algorithmus. Parameter stehen in `topo.json`.

**Bild:** 16 Höhenstufen aus Rauschen mit Domain-Warp. Jede fünfte Linie ist eine weiche Zähllinie. Die Zwischenflächen sind minimal abgestuft, der Talkessel um den Inhalt wird zu 70 % freigestellt.

**Reaktionen:**

| Eingang | Wirkung |
|---|---|
| Zustand `idle` | fließend, Tempo 0.03 |
| Zustand `thinking` | Tempo 0.09, stärkerer Warp, Atmen, Welle alle 1.4s vom Statuspunkt |
| Zustand `problem` | fast Stillstand, körnige Unruhe, leichte Tönung in `critical` |
| Zustand `input` | Ringe laufen auf das Element zu, das eine Eingabe braucht, Tönung in `primary` |
| Zeiger | Linien weichen in kleinem Radius (70px) linsenartig aus, stärker bei schneller Bewegung |
| Klick / Halten / Ziehen | Klick: kleine Welle. Halten: Mulde, die Linien ziehen sich ringförmig um den Zeiger zusammen. Ziehen: Wellenspur alle 70px |
| GUI-Ereignis | Element bewegt oder vergrößert sich um mehr als 24px (Aufklappen, Verschieben): Welle vom Element. Fokus, Tippen: Welle vom Feld |
| Layout | Seitenleiste auf/zu bzw. Fensterbereich verschoben: Welle läuft von der Kante über die Fläche |
| GUI-Elemente | Inhaltsflächen wirken als Hügel, um den sich die Linien legen |

**Lesbarkeitsgarantien (nicht verhandelbar):**

1. Jedes Element mit Text oder Bedienfunktion ist eine Schutzzone. Dort wird keine Linie gezeichnet, mit 6–22px weichem Rand.
2. Die Deckkraft der Linien ist hart auf 0.26 begrenzt. Zustände, Wellen und Zeiger können sie nicht überschreiten.
3. Zustände ändern Tempo, Form und Tönung, aber keine Information. Die Information steht immer im Text (`role="status"` / `role="alert"`).
4. Bei `prefers-reduced-motion` bzw. „Bewegung reduzieren“ bleibt das Bild statisch, ohne Wellen und ohne Zeigerreaktion. Gleiches gilt für den Stromsparmodus unter iOS.
5. Höchstens 30 fps, auf Apple-Geräten 20 fps. Der Shader pausiert, wenn das Fenster verdeckt oder die App im Hintergrund ist. Höchstens 20 Schutzzonen werden gleichzeitig übergeben, es zählen nur die sichtbaren.

**Einsatz:** In Apps liegt die Ebene hinter der Hauptansicht, nicht hinter Einstellungen, Tabellen oder dichten Listen. Auf symaira.com liegt sie hinter dem Hero und den Leerflächen.

## Do's and Don'ts

- ✅ Rollen statt Hexwerte. ✅ Eine Primäraktion pro Ansicht. ✅ Status immer als Text.
- ✅ Neue Elemente mit Text bekommen `data-topo="protect"` (Web) bzw. `.topoProtected()` (SwiftUI).
- ❌ Keine weiteren Akzentfarben, keine Verläufe auf Flächen, kein Glas über Text.
- ❌ Die Topografie nie heller, dichter oder schneller einstellen als in `topo.json` festgelegt.
- ❌ Keine Bilder oder Texturen als Hintergrundersatz für die Topografie.

## Iteration Guide

1. `DESIGN.md` und `topo.json` sind die einzige Quelle. Nach jeder Änderung `python3 build.py` ausführen. Es erzeugt `dist/` und prüft Kontraste.
2. `npx -y @google/design.md lint DESIGN.md` muss ohne Fehler durchlaufen.
3. Komponenten einzeln ändern und über ihren Namen in `components:` referenzieren.
4. Generierte Dateien in `dist/` nie von Hand bearbeiten.

## Known Gaps

- Energieverbrauch des Metal-Shaders ist noch nicht mit Instruments gemessen.
- Tabellen, Menüs, Einstellungen, Onboarding und Fehlerseiten sind noch nicht gestaltet.
- Logo und App-Icons (A3 „Verzahnt“) sind noch nicht an die graue Palette angepasst.
- Inter ist als Web-Ersatz festgelegt, aber noch nicht als Datei eingebunden.
