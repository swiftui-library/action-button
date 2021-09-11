import SwiftUI

// MARK: - ActionButton

public struct ActionButton: View {

    public typealias TapHandler = (() -> Void)

    // MARK: Lifecycle

    public init(
        state: Binding<ActionButtonState>,
        onTap: @escaping TapHandler,
        backgroundColor: Color,
        foregroundColor: Color = .white) {

        _state = state
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        tapHandler = onTap
    }

    // MARK: Public

    public var body: some View {

        HStack {
            Spacer()

            if state.isLoading {

                ProgressView(shouldAnimate: .constant(true))
                    .colorScheme(.dark)
                    .padding(.leading, 2)
            }

            HStack {

                if !state.isLoading {

                    Image(systemName: state.systemImage)
                }
                Text(state.title)
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(foregroundColor)

            Spacer()
        }
        .frame(height: 22)
        .padding(8)
        .background(background)
        .animation(.fastFade, value: state.enabled)
        .cornerRadius(8)
        .scaleEffect(scale)
        .animation(.easeOut(duration: 0.1), value: isPressing)
        .gesture(longPress)
    }

    // MARK: Internal

    @Binding var state: ActionButtonState

    var longPress: some Gesture {

        DragGesture(minimumDistance: 0.0)
            .onChanged { _ in self.isPressing = true }
            .onEnded { _ in

                self.isPressing = false

                switch state {

                case .enabled: tapHandler()
                default: break
                }
            }
    }

    var scale: CGFloat {

        switch state {

        case .enabled: return isPressing ? 0.95 : 1
        default: return 1
        }
    }

    var background: Color {

        state.enabled ? backgroundColor : Color.gray
    }

    // MARK: Private

    @State private var isPressing = false
    private var tapHandler: TapHandler
    private var backgroundColor: Color
    private var foregroundColor: Color
}

// MARK: - ActionButton_Previews

struct ActionButton_Previews: PreviewProvider {

    static var previews: some View {

        ActionButton(state: .constant(.enabled(.init(
            title: "New Draft",
            systemImage: "plus.circle"))), onTap: {}, backgroundColor: .red)
    }
}
