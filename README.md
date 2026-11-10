# Symaira AppKit — moved to symaira-corekit

> **This repository is archived.** AppKit was merged into
> [`symaira-corekit`](https://github.com/danieljustus/symaira-corekit) with its
> full history ([ADR 0006](https://github.com/danieljustus/symaira-corekit/blob/main/docs/adr/0006-appkit-merged-into-corekit.md)).
> Sources, tests, GUI rules and scripts now live in
> [`symaira-corekit/appkit/`](https://github.com/danieljustus/symaira-corekit/tree/main/appkit);
> issues were transferred there.

Switch your SwiftPM dependency (first CoreKit release with the package: `v0.20.0`):

```swift
.package(url: "https://github.com/danieljustus/symaira-corekit.git", exact: "0.20.0")
// products: .product(name: "SymairaTheme", package: "symaira-corekit")
```

Packaged apps embed `symaira-corekit_SymairaTheme.bundle` instead of
`symaira-appkit_SymairaTheme.bundle`. Migration notes:
[`docs/migrations.md` § v0.20.0](https://github.com/danieljustus/symaira-corekit/blob/main/docs/migrations.md).

The tags `0.1.0` to `0.18.1` of this repository stay resolvable for existing
pins. Do not commit here; open changes against `symaira-corekit`.
