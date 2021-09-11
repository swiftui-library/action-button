import ActionButton
import SwiftUI

// MARK: - ContentView

struct ContentView: View {

    // MARK: Internal

    @State var actionButtonState: ActionButtonState =
        .enabled(.init(title: "Load Something", systemImage: "bolt"))

    var body: some View {

        VStack {

            Text("Just a little button.")
            ActionButton(state: $actionButtonState, onTap: {

                loadSomething()
            }, backgroundColor: .red)
                .frame(maxWidth: 250)
        }
    }

    // MARK: Private

    private func loadSomething() {

        actionButtonState = .loading(.init(title: "Loading", systemImage: "bolt"))

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {

            actionButtonState = .disabled(.init(title: "Loaded", systemImage: "checkmark"))
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
