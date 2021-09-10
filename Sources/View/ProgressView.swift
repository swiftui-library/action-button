import Foundation
import SwiftUI

struct ProgressView: UIViewRepresentable {

    @Binding var shouldAnimate: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {

        let progressView = UIActivityIndicatorView()
        progressView.style = .medium
        return progressView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

        if shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
