public enum ActionButtonState {

    case enabled(ActionButtonModel)
    case disabled(ActionButtonModel)
    case loading(ActionButtonModel)

    // MARK: Internal

    var title: String {

        switch self {

        case let .enabled(content):

            return content.title

        case let .disabled(content):

            return content.title

        case let .loading(content):

            return content.title
        }
    }

    var systemImage: String {

        switch self {

        case let .enabled(content):

            return content.systemImage

        case let .disabled(content):

            return content.systemImage

        case let .loading(content):

            return content.systemImage
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
