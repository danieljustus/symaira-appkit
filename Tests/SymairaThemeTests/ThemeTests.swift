import XCTest
import SwiftUI
@testable import SymairaTheme

final class ThemeTests: XCTestCase {
    func testHexShortAndLongFormsAreEquivalent() {
        XCTAssertEqual(Color(hex: "FFF"), Color(hex: "FFFFFF"))
        XCTAssertEqual(Color(hex: "000"), Color(hex: "000000"))
    }

    func testHexIgnoresHashPrefix() {
        XCTAssertEqual(Color(hex: "#E5C397"), Color(hex: "E5C397"))
    }

    func testBrandGoldMatchesSpec() {
        XCTAssertEqual(SymairaTheme.goldPrimary, Color(hex: "#E5C397"))
    }

    func testLegacyColorAliasesPointToCanonicalTokens() {
        XCTAssertEqual(Color.symairaGold, SymairaTheme.goldPrimary)
        XCTAssertEqual(Color.symairaBg, SymairaTheme.bgDark)
        XCTAssertEqual(Color.symairaText, SymairaTheme.textPrimary)
        XCTAssertEqual(Color.symairaCard, SymairaTheme.bgCard)
    }

    func testMutedTextMeetsUpdatedBrandSpec() {
        XCTAssertEqual(SymairaTheme.textMuted, Color(hex: "837D74"))
    }

    func testAdaptivePaletteFollowsLiquidTopography() {
        XCTAssertEqual(SymairaTheme.backgroundPrimary(for: .dark), Color(hex: "1C1C1B"))
        XCTAssertEqual(SymairaTheme.foregroundPrimary(for: .dark), Color(hex: "EEEDEA"))
        XCTAssertEqual(SymairaTheme.backgroundPrimary(for: .light), Color(hex: "ECECEA"))
        XCTAssertEqual(SymairaTheme.foregroundPrimary(for: .light), Color(hex: "1C1C1A"))
        XCTAssertEqual(SymairaTheme.accent(for: .dark), Color(hex: "C7B89E"))
    }

    func testSemanticTonesAdaptForLightAppearance() {
        XCTAssertEqual(SymairaTone.critical.foreground, SymairaTheme.critical)
        XCTAssertEqual(SymairaTone.critical.foreground(for: .light), Color(hex: "B3261E"))
        XCTAssertEqual(SymairaTone.positive.systemImage, "checkmark.circle.fill")
    }

    @MainActor
    func testFoundationComponentsCanBeConstructed() {
        _ = SymairaBackdrop(gridStyle: .dots)
        _ = SymairaBadge("Ready", tone: .positive)
        _ = SymairaNotice(title: "Connected", message: "The local core is ready.", tone: .positive)
        _ = SymairaEmptyState(systemImage: "tray", title: "No items", message: "Add your first item.")
        _ = SymairaLoadingState("Loading")
        _ = SymairaGlassEffectContainer {
            Button("Refresh") {}
                .symairaButtonStyle(.toolbar)
        }
    }
}
