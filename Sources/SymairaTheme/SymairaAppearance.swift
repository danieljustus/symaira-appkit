import SwiftUI

#if os(macOS)
import AppKit
#endif

/// Shared appearance vocabulary. Hosts own persistence keys and preview isolation.
public enum SymairaAppearance: String, CaseIterable, Sendable {
    case system, light, dark

    public var title: String {
        switch self {
        case .system: "System"
        case .light: "Light"
        case .dark: "Dark"
        }
    }

    /// Use with preferredColorScheme on iOS. Nil follows system changes live.
    public var colorScheme: ColorScheme? {
        switch self {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }

    #if os(macOS)
    @MainActor public var nativeAppearance: NSAppearance? {
        switch self {
        case .system: nil
        case .light: NSAppearance(named: .aqua)
        case .dark: NSAppearance(named: .darkAqua)
        }
    }

    /// Apply to every existing/new native window, popover and control. System
    /// clears the override; it must not freeze a snapshot of the current mode.
    @MainActor public func apply() { NSApplication.shared.appearance = nativeAppearance }
    #endif
}

/// Native toolbar settings entry. Appearance is a setting, not a separate
/// chrome control; the host supplies its existing full-settings action.
public struct SymairaSettingsMenu: View {
    @Binding private var selection: SymairaAppearance
    private let openSettings: () -> Void

    public init(selection: Binding<SymairaAppearance>, openSettings: @escaping () -> Void) {
        _selection = selection
        self.openSettings = openSettings
    }

    public var body: some View {
        Menu {
            Picker("Appearance", selection: $selection) {
                ForEach(SymairaAppearance.allCases, id: \.self) { option in
                    Text(option.title).tag(option)
                }
            }
            .pickerStyle(.inline)
            Divider()
            Button("All Settings…", action: openSettings)
        } label: {
            Label("Settings", systemImage: "gearshape")
        }
        .labelStyle(.iconOnly)
        .menuIndicator(.hidden)
        .accessibilityLabel("Settings")
        .help("Settings")
    }
}

public struct SymairaAppearanceMenu: View {
    @Binding private var selection: SymairaAppearance

    public init(selection: Binding<SymairaAppearance>) { _selection = selection }

    public var body: some View {
        Menu {
            Picker("Appearance", selection: $selection) {
                ForEach(SymairaAppearance.allCases, id: \.self) { option in
                    Text(option.title).tag(option)
                }
            }
            .pickerStyle(.inline)
        } label: {
            Label("Appearance", systemImage: "circle.lefthalf.filled")
                .labelStyle(.titleAndIcon)
        }
        .help("Appearance: System, Light or Dark")
    }
}
