public struct ActionButtonModel {

    // MARK: Lifecycle

    public init(title: String, systemImage: String) {

        self.title = title
        self.systemImage = systemImage
    }

    // MARK: Internal

    var title: String
    var systemImage: String
}
