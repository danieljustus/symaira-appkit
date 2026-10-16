import SwiftUI

/// The shared Symaira icon vocabulary.
///
/// Every case names a *meaning*, not a picture, so all clients draw the same
/// glyph for the same concept. Glyphs are vendored Phosphor Icons (MIT, see
/// `Resources/PHOSPHOR-LICENSE`) and may be used on any platform and
/// commercially. Non-Swift clients read `Resources/icons.json` for the SVGs.
/// Every icon ships a regular and a filled weight.
///
/// Catalogue derived from every SF Symbol used across the Symaira client repos
/// (2026-10, ~230 raw symbols, consolidated by meaning). Regenerate the assets
/// with `scripts/vendor-phosphor-icons.py`.
public enum SymairaIcon: String, CaseIterable, Sendable {
    // MARK: Products
    case productVault
    case productBrain
    case productBrowse
    case productCockpit
    case productDesk
    case productEraseMe
    case productFritz
    case productWatch

    // MARK: Navigation
    case back
    case forward
    case expand
    case collapse
    case sidebarLeft
    case sidebarRight
    case home
    case dashboard
    case list
    case grid
    case fullscreen
    case openExternal
    case openApp
    case more
    case menu

    // MARK: Actions
    case add
    case remove
    case close
    case confirm
    case edit
    case compose
    case delete
    case copy
    case paste
    case share
    case importItem
    case download
    case upload
    case refresh
    case sync
    case undo
    case restore
    case merge
    case branch
    case send
    case search
    case filter
    case sort
    case zoomIn
    case zoomOut
    case scan
    case qrScan
    case link
    case unlink
    case pin
    case bookmark
    case favorite
    case like
    case tag
    case highlight
    case magic
    case ai
    case logout
    case exit

    // MARK: Media / process control
    case play
    case pause
    case stop
    case record
    case restart
    case run

    // MARK: Status / feedback
    case success
    case failure
    case warning
    case error
    case info
    case help
    case verified
    case pending
    case loading
    case notification
    case announcement
    case live
    case blocked

    // MARK: Security & identity
    case lock
    case unlock
    case shield
    case shieldCheck
    case shieldAlert
    case key
    case passkey
    case faceID
    case visible
    case hidden
    case privacy
    case user
    case userAdd
    case userUnknown
    case team
    case group
    case contact

    // MARK: Documents & data
    case document
    case documentText
    case documentSearch
    case documentImage
    case documentRich
    case documentAdd
    case documentUpload
    case documentDownload
    case documentSettings
    case note
    case folder
    case folderAdd
    case folderSettings
    case inbox
    case inboxImport
    case archive
    case library
    case book
    case stack
    case table
    case checklist
    case chart
    case report
    case calendar
    case schedule
    case time
    case history
    case number
    case image
    case film
    case music
    case audio
    case microphone
    case camera
    case package

    // MARK: Communication
    case chat
    case message
    case mail
    case mailUnread
    case phone

    // MARK: System & infrastructure
    case settings
    case advancedSettings
    case tune
    case tools
    case build
    case diagnose
    case terminal
    case code
    case server
    case cpu
    case memory
    case storage
    case network
    case offline
    case wifi
    case cloud
    case cloudUpload
    case cloudDownload
    case window
    case device
    case handoff
    case keyboard
    case tap
    case workflow
    case integration
    case fan
    case temperature
    case power
    case battery
    case appearance
    case lightMode
    case darkMode
    case energy

    /// Asset name inside SymairaTheme's bundle.
    public func assetName(filled: Bool = false) -> String {
        filled ? rawValue + ".fill" : rawValue
    }

    /// Template image, tinted by `foregroundStyle`, sized like text.
    public func image(filled: Bool = false) -> Image {
        Image(assetName(filled: filled), bundle: .module).renderingMode(.template)
    }

    /// Direction `.slide` nudges towards.
    var slideOffset: CGSize {
        switch self {
        case .back, .undo, .logout: CGSize(width: -3, height: 0)
        case .collapse, .upload, .cloudUpload, .documentUpload, .share, .send: CGSize(width: 0, height: -3)
        case .expand, .download, .cloudDownload, .documentDownload, .importItem: CGSize(width: 0, height: 3)
        default: CGSize(width: 3, height: 0)
        }
    }

    /// The micro-animation this icon plays on click / when its trigger changes.
    public var motion: SymairaIconMotion {
        switch self {
        case .refresh, .sync, .restore, .history, .restart, .loading,
             .settings, .advancedSettings, .fan:
            .rotate
        case .delete, .notification, .announcement, .warning, .error,
             .shieldAlert, .failure, .blocked, .mailUnread:
            .wiggle
        case .record, .live, .ai, .magic, .productBrain, .audio, .microphone,
             .pending, .energy:
            .pulse
        case .back, .forward, .expand, .collapse, .send, .upload, .download,
             .openExternal, .openApp, .logout, .exit, .cloudUpload, .cloudDownload,
             .documentUpload, .documentDownload, .handoff, .importItem, .share:
            .slide
        default:
            .bounce
        }
    }
}

/// Animation vocabulary for `SymairaIcon`. Kept deliberately tiny so every
/// client feels the same.
public enum SymairaIconMotion: Sendable {
    /// Short spring hop — default for most actions.
    case bounce
    /// Quarter-to-full turn — refresh, sync, settings.
    case rotate
    /// Side-to-side shake — delete, alerts, notifications.
    case wiggle
    /// Opacity breath — live, recording, AI.
    case pulse
    /// Nudge in the glyph's direction — navigation and transfer.
    case slide
}

// MARK: - Views

/// An icon with Symaira micro-interactions: grows slightly on hover (macOS /
/// iPad pointer) and plays its `motion` whenever `trigger` changes.
/// Honours Reduce Motion by rendering a static glyph.
public struct SymairaIconView<Trigger: Equatable>: View {
    private let icon: SymairaIcon
    private let filled: Bool
    private let size: CGFloat
    private let trigger: Trigger
    @State private var isHovered = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    public init(_ icon: SymairaIcon, filled: Bool = false, size: CGFloat = 18, trigger: Trigger) {
        self.icon = icon
        self.filled = filled
        self.size = size
        self.trigger = trigger
    }

    public var body: some View {
        let glyph = icon.image(filled: filled)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .scaleEffect(isHovered && !reduceMotion ? 1.1 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isHovered)
            .onHover { isHovered = $0 }
            .accessibilityHidden(true)
        if reduceMotion {
            glyph
        } else {
            glyph.keyframeAnimator(initialValue: IconPose(), trigger: trigger) { view, pose in
                view
                    .scaleEffect(pose.scale)
                    .rotationEffect(.degrees(pose.angle))
                    .offset(x: icon.slideOffset.width * pose.shift, y: icon.slideOffset.height * pose.shift)
                    .opacity(pose.opacity)
            } keyframes: { _ in
                IconPose.keyframes(for: icon.motion)
            }
        }
    }
}

extension SymairaIconView where Trigger == Int {
    /// Hover-only icon (no click trigger).
    public init(_ icon: SymairaIcon, filled: Bool = false, size: CGFloat = 18) {
        self.init(icon, filled: filled, size: size, trigger: 0)
    }
}

/// A plain icon button that plays the icon's motion on every press.
public struct SymairaIconButton: View {
    private let title: LocalizedStringKey
    private let icon: SymairaIcon
    private let filled: Bool
    private let action: () -> Void
    @State private var taps = 0

    public init(_ title: LocalizedStringKey, icon: SymairaIcon, filled: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.filled = filled
        self.action = action
    }

    public var body: some View {
        Button {
            taps += 1
            action()
        } label: {
            SymairaIconView(icon, filled: filled, trigger: taps)
        }
        .buttonStyle(.borderless)
        .accessibilityLabel(Text(title))
        .help(Text(title))
    }
}

extension Label where Title == Text, Icon == Image {
    /// `Label("Delete", symairaIcon: .delete)`
    public init(_ title: LocalizedStringKey, symairaIcon icon: SymairaIcon, filled: Bool = false) {
        self.init { Text(title) } icon: { icon.image(filled: filled) }
    }
}

extension Image {
    /// `Image(symairaIcon: .productVault)`
    public init(symairaIcon icon: SymairaIcon, filled: Bool = false) {
        self = icon.image(filled: filled)
    }
}

struct IconPose {
    var scale = 1.0
    var angle = 0.0
    var shift = 0.0
    var opacity = 1.0

    @KeyframesBuilder<IconPose>
    static func keyframes(for motion: SymairaIconMotion) -> some Keyframes<IconPose> {
        KeyframeTrack(\IconPose.scale) {
            if motion == .bounce {
                SpringKeyframe(0.82, duration: 0.08)
                SpringKeyframe(1.15, duration: 0.14)
                SpringKeyframe(1.0, duration: 0.2)
            } else {
                LinearKeyframe(1.0, duration: 0.01)
            }
        }
        KeyframeTrack(\IconPose.angle) {
            switch motion {
            case .rotate:
                CubicKeyframe(360, duration: 0.5)
                LinearKeyframe(0, duration: 0.001)
            case .wiggle:
                CubicKeyframe(-14, duration: 0.07)
                CubicKeyframe(12, duration: 0.09)
                CubicKeyframe(-7, duration: 0.08)
                CubicKeyframe(0, duration: 0.08)
            default:
                LinearKeyframe(0, duration: 0.01)
            }
        }
        KeyframeTrack(\IconPose.shift) {
            if motion == .slide {
                SpringKeyframe(1, duration: 0.12)
                SpringKeyframe(0, duration: 0.22)
            } else {
                LinearKeyframe(0, duration: 0.01)
            }
        }
        KeyframeTrack(\IconPose.opacity) {
            if motion == .pulse {
                CubicKeyframe(0.35, duration: 0.18)
                CubicKeyframe(1, duration: 0.18)
                CubicKeyframe(0.35, duration: 0.18)
                CubicKeyframe(1, duration: 0.18)
            } else {
                LinearKeyframe(1, duration: 0.01)
            }
        }
    }
}
