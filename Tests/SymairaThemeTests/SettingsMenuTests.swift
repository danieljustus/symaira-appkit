import SwiftUI
import XCTest

@testable import SymairaTheme

#if os(macOS)
import AppKit

@MainActor
final class SettingsMenuTests: XCTestCase {
    func testNativeSettingsMenuRoutesAppearanceAndFullSettings() async throws {
        guard #available(macOS 14.4, *) else { throw XCTSkip("NSHostingMenu requires macOS 14.4") }
        _ = NSApplication.shared
        var selection = SymairaAppearance.system
        var settingsOpened = false
        let root = SymairaSettingsMenu(
            selection: Binding(get: { selection }, set: { selection = $0 }),
            openSettings: { settingsOpened = true })
        // Exercise the production SwiftUI menu through Apple's public menu
        // host, not a guessed private NSPopUpButton implementation or AX grant.
        let menu = NSHostingMenu(rootView: root)
        menu.update()
        try await Task.sleep(for: .milliseconds(150))

        func descendants(_ menu: NSMenu) -> [NSMenuItem] {
            menu.update()
            return menu.items.flatMap { item in
                [item] + (item.submenu.map(descendants) ?? [])
            }
        }
        let items = descendants(menu)
        XCTAssertEqual(items.filter { $0.title == "All Settings…" }.count, 1)
        for choice in SymairaAppearance.allCases {
            let item = try XCTUnwrap(items.first { $0.title == choice.title }, "Items: \(items.map(\.title))")
            let parent = try XCTUnwrap(item.menu)
            parent.performActionForItem(at: parent.index(of: item))
            XCTAssertEqual(selection, choice)
        }
        let settings = try XCTUnwrap(items.first { $0.title == "All Settings…" })
        let parent = try XCTUnwrap(settings.menu)
        parent.performActionForItem(at: parent.index(of: settings))
        XCTAssertTrue(settingsOpened)
    }
}
#endif
