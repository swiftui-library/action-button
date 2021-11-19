public enum ActionButtonState {

    case enabled(title: String, systemImage: String)
    case disabled(title: String, systemImage: String)
    case loading(title: String, systemImage: String)

    // MARK: Internal

    var title: String {

        switch self {
            
        case .enabled(let title, _), .disabled(let title, _), .loading(let title, _):
            
            return title
        }
    }

    var systemImage: String {

        switch self {

        case .enabled(_, let systemImage), .disabled(_, let systemImage), .loading(_, let systemImage):

            return systemImage
        }
    }

    var enabled: Bool {

        switch self {

        case .enabled:

            return true

        default:

            return false
        }
    }

    var isLoading: Bool {

        switch self {

        case .loading:

            return true

        default:

            return false
        }
    }
}
