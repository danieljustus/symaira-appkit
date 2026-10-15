import XCTest
import SwiftUI
@testable import SymairaTheme

/// Liquid Topography: Shader liegt im Bundle, rendert sichtbar, Schutzzonen bleiben frei.
@MainActor
final class LiquidTopographyTests: XCTestCase {
    func testShaderLibraryIsBundled() throws {
        let url = try XCTUnwrap(Bundle.module.url(forResource: "default", withExtension: "metallib"),
                                "default.metallib fehlt im SymairaTheme-Bundle")
        XCTAssertGreaterThan(try Data(contentsOf: url).count, 1_000)
    }

    func testTopoParametersRespectReadabilityCap() {
        XCTAssertLessThanOrEqual(SymairaTokens.Topo.maxAlpha, 0.26)
        XCTAssertLessThanOrEqual(SymairaTokens.Topo.indexAlpha, SymairaTokens.Topo.maxAlpha)
        XCTAssertEqual(SymairaTokens.Topo.pointerRadius, 70)
        XCTAssertLessThanOrEqual(SymairaTokens.Topo.fps, 30)
    }

    func testStatesDifferInTempo() {
        XCTAssertGreaterThan(SymairaTopoState.thinking.target.speed, SymairaTopoState.idle.target.speed)
        XCTAssertLessThan(SymairaTopoState.problem.target.speed, SymairaTopoState.idle.target.speed)
        XCTAssertTrue(SymairaTopoState.problem.target.tintIsCritical)
    }

    func testRippleThrottlesKeyedSources() {
        let m = SymairaTopoModel()
        m.ripple(at: .zero, key: "a")
        m.ripple(at: .zero, key: "a")
        XCTAssertEqual(m.ripples.count, 1)
        m.ripple(at: .zero)
        XCTAssertEqual(m.ripples.count, 2)
    }

    func testLayoutChangeAboveThresholdEmitsRipple() {
        let m = SymairaTopoModel()
        m.layoutChanged(id: "card", rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        m.layoutChanged(id: "card", rect: CGRect(x: 5, y: 0, width: 100, height: 100))
        XCTAssertTrue(m.ripples.isEmpty, "kleine Bewegung darf keine Welle auslösen")
        m.layoutChanged(id: "card", rect: CGRect(x: 0, y: 0, width: 100, height: 160))
        XCTAssertEqual(m.ripples.count, 1)
    }

    #if os(macOS)
    /// Rendert die echte View offscreen: Linien sichtbar außerhalb, keine Linien in der Schutzzone.
    func testShaderRendersLinesAndKeepsProtectedZoneClear() throws {
        let model = SymairaTopoModel()
        let size = CGSize(width: 480, height: 320)
        let zone = CGRect(x: 160, y: 110, width: 160, height: 100)
        model.rects["zone"] = (zone, false)
        let view = SymairaTopoView(model: model)
            .frame(width: size.width, height: size.height)
            .coordinateSpace(name: SymairaTopo.space)
            .environment(\.colorScheme, .dark)
        let renderer = ImageRenderer(content: view)
        renderer.scale = 1
        let cg = try XCTUnwrap(renderer.cgImage, "ImageRenderer lieferte kein Bild")
        let px = try pixels(cg)
        let canvas = (r: 0x1C, g: 0x1C, b: 0x1B)
        func deviates(_ x: Int, _ y: Int) -> Bool {
            let i = (y * cg.width + x) * 4
            return abs(Int(px[i]) - canvas.r) + abs(Int(px[i + 1]) - canvas.g) + abs(Int(px[i + 2]) - canvas.b) > 6
        }
        var outside = 0, inside = 0
        for y in 0..<cg.height { for x in 0..<cg.width where deviates(x, y) {
            if zone.insetBy(dx: 6, dy: 6).contains(CGPoint(x: x, y: y)) { inside += 1 } else { outside += 1 }
        } }
        XCTAssertGreaterThan(outside, 500, "keine Höhenlinien gerendert")
        XCTAssertEqual(inside, 0, "Linien in der Schutzzone")
    }

    private func pixels(_ cg: CGImage) throws -> [UInt8] {
        var buf = [UInt8](repeating: 0, count: cg.width * cg.height * 4)
        let ctx = try XCTUnwrap(CGContext(data: &buf, width: cg.width, height: cg.height, bitsPerComponent: 8,
                                          bytesPerRow: cg.width * 4, space: CGColorSpace(name: CGColorSpace.sRGB)!,
                                          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue))
        ctx.draw(cg, in: CGRect(x: 0, y: 0, width: cg.width, height: cg.height))
        return buf
    }
    #endif
}
