import AppKit
import SwiftUI
import XCTest

@testable import SymairaTheme

@MainActor
final class SymairaIconTests: XCTestCase {
    func testEveryIconHasRegularAndFilledAsset() {
        let missing = SymairaIcon.allCases.flatMap { [$0.assetName(), $0.assetName(filled: true)] }
            .filter { Bundle.module.image(forResource: $0) == nil }
        XCTAssertEqual(missing, [], "missing vendored assets")
    }

    func testManifestMatchesCatalogue() throws {
        let url = try XCTUnwrap(Bundle.module.url(forResource: "icons", withExtension: "json"))
        let manifest = try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any]
        XCTAssertEqual(Set(manifest?.keys ?? [:].keys), Set(SymairaIcon.allCases.map(\.rawValue)))
    }

    func testViewsRender() {
        for icon in SymairaIcon.allCases {
            ThemeRenderHost.render(SymairaIconView(icon, trigger: 1))
        }
        ThemeRenderHost.render(SymairaIconButton("Delete", icon: .delete, filled: true) {})
        ThemeRenderHost.render(Label("Sync", symairaIcon: .sync))
    }
}
