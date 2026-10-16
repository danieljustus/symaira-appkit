import SwiftUI

/// The shared Symaira icon vocabulary.
///
/// Every case names a *meaning*, not a picture, and maps to one SF Symbol so all
/// clients draw the same glyph for the same concept. Fill, circle and slash
/// variants are not separate cases: apply `.symbolVariant(.fill)` /
/// `.symbolVariant(.circle)` / `.symbolVariant(.slash)` at the call site.
///
/// Catalogue derived from every `systemName:`/`systemImage:` used across the
/// Symaira client repos (2026-10, ~230 raw symbols, consolidated by meaning).
public enum SymairaIcon: String, CaseIterable, Sendable {
    // MARK: Products
    case productVault = "lock.shield"
    case productBrain = "brain"
    case productBrowse = "globe"
    case productCockpit = "gauge.with.needle"
    case productDesk = "desktopcomputer"
    case productEraseMe = "person.crop.circle.badge.xmark"
    case productFritz = "network"
    case productWatch = "waveform.path.ecg"

    // MARK: Navigation
    case back = "chevron.left"
    case forward = "chevron.right"
    case expand = "chevron.down"
    case collapse = "chevron.up"
    case sidebarLeft = "sidebar.left"
    case sidebarRight = "sidebar.right"
    case home = "house"
    case dashboard = "square.grid.2x2"
    case list = "list.bullet.rectangle"
    case grid = "rectangle.grid.2x2"
    case fullscreen = "arrow.up.left.and.arrow.down.right"
    case openExternal = "arrow.up.right.square"
    case openApp = "arrow.up.forward.app"
    case more = "ellipsis.circle"
    case menu = "line.3.horizontal"

    // MARK: Actions
    case add = "plus"
    case remove = "minus"
    case close = "xmark"
    case confirm = "checkmark"
    case edit = "pencil"
    case compose = "square.and.pencil"
    case delete = "trash"
    case copy = "doc.on.doc"
    case paste = "clipboard"
    case share = "square.and.arrow.up"
    case importItem = "square.and.arrow.down"
    case download = "arrow.down.to.line"
    case upload = "arrow.up.to.line"
    case refresh = "arrow.clockwise"
    case sync = "arrow.triangle.2.circlepath"
    case undo = "arrow.uturn.backward"
    case restore = "clock.arrow.circlepath"
    case merge = "arrow.triangle.merge"
    case branch = "arrow.triangle.branch"
    case send = "paperplane"
    case search = "magnifyingglass"
    case filter = "line.3.horizontal.decrease.circle"
    case sort = "arrow.up.arrow.down"
    case zoomIn = "plus.magnifyingglass"
    case zoomOut = "minus.magnifyingglass"
    case scan = "doc.viewfinder"
    case qrScan = "qrcode.viewfinder"
    case link = "link"
    case unlink = "personalhotspot.slash"
    case pin = "pin"
    case bookmark = "bookmark"
    case favorite = "star"
    case like = "heart"
    case tag = "tag"
    case highlight = "highlighter"
    case magic = "wand.and.stars"
    case ai = "sparkles"
    case logout = "rectangle.portrait.and.arrow.right"
    case exit = "door.left.hand.open"

    // MARK: Media / process control
    case play = "play"
    case pause = "pause"
    case stop = "stop"
    case record = "record.circle"
    case restart = "restart.circle"
    case run = "bolt"

    // MARK: Status / feedback
    case success = "checkmark.circle"
    case failure = "xmark.circle"
    case warning = "exclamationmark.triangle"
    case error = "exclamationmark.circle"
    case info = "info.circle"
    case help = "questionmark.circle"
    case verified = "checkmark.seal"
    case pending = "hourglass"
    case loading = "progress.indicator"
    case notification = "bell"
    case announcement = "megaphone"
    case live = "dot.radiowaves.left.and.right"
    case blocked = "hand.raised"

    // MARK: Security & identity
    case lock = "lock"
    case unlock = "lock.open"
    case shield = "shield"
    case shieldCheck = "checkmark.shield"
    case shieldAlert = "exclamationmark.shield"
    case key = "key.horizontal"
    case passkey = "person.badge.key"
    case faceID = "faceid"
    case visible = "eye"
    case hidden = "eye.slash"
    case privacy = "hand.raised.square"
    case user = "person.crop.circle"
    case userAdd = "person.badge.plus"
    case userUnknown = "person.crop.circle.badge.questionmark"
    case team = "person.2"
    case group = "person.3"
    case contact = "person.wave.2"

    // MARK: Documents & data
    case document = "doc"
    case documentText = "doc.text"
    case documentSearch = "doc.text.magnifyingglass"
    case documentImage = "doc.text.image"
    case documentRich = "doc.richtext"
    case documentAdd = "doc.badge.plus"
    case documentUpload = "doc.badge.arrow.up"
    case documentDownload = "arrow.down.doc"
    case documentSettings = "doc.badge.gearshape"
    case note = "note.text"
    case folder = "folder"
    case folderAdd = "folder.badge.plus"
    case folderSettings = "folder.badge.gearshape"
    case inbox = "tray"
    case inboxImport = "tray.and.arrow.down"
    case archive = "archivebox"
    case library = "books.vertical"
    case book = "book"
    case stack = "square.stack.3d.up"
    case table = "tablecells"
    case checklist = "checklist"
    case chart = "chart.bar"
    case report = "chart.bar.doc.horizontal"
    case calendar = "calendar"
    case schedule = "calendar.badge.clock"
    case time = "clock"
    case history = "clock.arrow.2.circlepath"
    case number = "number"
    case image = "photo"
    case film = "film"
    case music = "music.note"
    case audio = "waveform"
    case microphone = "mic"
    case camera = "camera"
    case package = "shippingbox"

    // MARK: Communication
    case chat = "bubble.left.and.bubble.right"
    case message = "bubble.left"
    case mail = "envelope"
    case mailUnread = "envelope.badge"
    case phone = "phone"

    // MARK: System & infrastructure
    case settings = "gearshape"
    case advancedSettings = "gearshape.2"
    case tune = "slider.horizontal.3"
    case tools = "wrench.and.screwdriver"
    case build = "hammer"
    case diagnose = "stethoscope"
    case terminal = "terminal"
    case code = "chevron.left.forwardslash.chevron.right"
    case server = "server.rack"
    case cpu = "cpu"
    case memory = "memorychip"
    case storage = "internaldrive"
    case network = "point.3.connected.trianglepath.dotted"
    case offline = "network.slash"
    case wifi = "wifi"
    case cloud = "icloud"
    case cloudUpload = "icloud.and.arrow.up"
    case cloudDownload = "icloud.and.arrow.down"
    case window = "macwindow"
    case device = "iphone"
    case handoff = "iphone.and.arrow.forward"
    case keyboard = "keyboard"
    case tap = "hand.tap"
    case workflow = "flowchart"
    case integration = "puzzlepiece.extension"
    case fan = "fanblades"
    case temperature = "thermometer.medium"
    case power = "power"
    case battery = "battery.75percent"
    case appearance = "circle.lefthalf.filled"
    case lightMode = "sun.max"
    case darkMode = "moon"
    case energy = "flame"

    /// SF Symbol name for `Image(systemName:)` / `Label(_:systemImage:)`.
    public var systemName: String { rawValue }

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
    private let trigger: Trigger
    @State private var isHovered = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    public init(_ icon: SymairaIcon, trigger: Trigger) {
        self.icon = icon
        self.trigger = trigger
    }

    public var body: some View {
        Image(systemName: icon.systemName)
            .symbolEffect(.scale.up, isActive: isHovered && !reduceMotion)
            .modifier(SymairaIconMotionEffect(motion: icon.motion, trigger: trigger, enabled: !reduceMotion))
            .onHover { isHovered = $0 }
            .accessibilityHidden(true)
    }
}

extension SymairaIconView where Trigger == Int {
    /// Hover-only icon (no click trigger).
    public init(_ icon: SymairaIcon) {
        self.init(icon, trigger: 0)
    }
}

/// A plain icon button that plays the icon's motion on every press.
public struct SymairaIconButton: View {
    private let title: LocalizedStringKey
    private let icon: SymairaIcon
    private let action: () -> Void
    @State private var taps = 0

    public init(_ title: LocalizedStringKey, icon: SymairaIcon, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button {
            taps += 1
            action()
        } label: {
            SymairaIconView(icon, trigger: taps)
        }
        .buttonStyle(.borderless)
        .accessibilityLabel(Text(title))
        .help(Text(title))
    }
}

extension Label where Title == Text, Icon == Image {
    /// `Label("Delete", symairaIcon: .delete)`
    public init(_ title: LocalizedStringKey, symairaIcon icon: SymairaIcon) {
        self.init(title, systemImage: icon.systemName)
    }
}

extension Image {
    /// `Image(symairaIcon: .vault)`
    public init(symairaIcon icon: SymairaIcon) {
        self.init(systemName: icon.systemName)
    }
}

struct SymairaIconMotionEffect<Trigger: Equatable>: ViewModifier {
    let motion: SymairaIconMotion
    let trigger: Trigger
    let enabled: Bool

    func body(content: Content) -> some View {
        if !enabled {
            content
        } else if #available(macOS 15, iOS 18, *) {
            switch motion {
            case .bounce: content.symbolEffect(.bounce, value: trigger)
            case .rotate: content.symbolEffect(.rotate.byLayer, value: trigger)
            case .wiggle: content.symbolEffect(.wiggle, value: trigger)
            case .pulse: content.symbolEffect(.pulse, value: trigger)
            case .slide: content.symbolEffect(.wiggle.forward, value: trigger)
            }
        } else {
            // ponytail: macOS 14 lacks rotate/wiggle; everything bounces/pulses there.
            switch motion {
            case .pulse: content.symbolEffect(.pulse, value: trigger)
            default: content.symbolEffect(.bounce, value: trigger)
            }
        }
    }
}
