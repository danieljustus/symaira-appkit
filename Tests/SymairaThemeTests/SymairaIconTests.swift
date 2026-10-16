import AppKit
import SwiftUI
import XCTest

@testable import SymairaTheme

@MainActor
final class SymairaIconTests: XCTestCase {
    func testEverySymbolExistsOnDeploymentTarget() {
        let missing = SymairaIcon.allCases.filter { NSImage(systemSymbolName: $0.systemName, accessibilityDescription: nil) == nil }
        XCTAssertEqual(missing, [], "unknown SF Symbols")
    }

    func testViewsRender() {
        for icon in SymairaIcon.allCases {
            ThemeRenderHost.render(SymairaIconView(icon, trigger: 1))
        }
        ThemeRenderHost.render(SymairaIconButton("Delete", icon: .delete) {})
        ThemeRenderHost.render(Label("Sync", symairaIcon: .sync))
    }
}
