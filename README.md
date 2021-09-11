# ActionButton

`Button` alternative providing built-in states for `.enabled`, `.disabled`, and `.loading`.

https://user-images.githubusercontent.com/8763719/132947434-86b066fb-81e6-4d94-b029-74d71cd60319.mov

## How to Use

1. Import `ActionButton`
2. Create a state or binding variable of type `ActionState`. This will drive the content of `ActionButton`
3. Add `ActionButton` to your view and configure it. 

Below is a an example of the code used in the video demo above. So how do we animate between states?

```swift
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
``` 
**Animating between states.**

Animating between states is handled automatically. Take a look at our `loadSomething()` function.

```swift
private func loadSomething() {

    actionButtonState = .loading(.init(title: "Loading", systemImage: "bolt"))

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {

        actionButtonState = .disabled(.init(title: "Loaded", systemImage: "checkmark"))
    }
}
```
In our example, we use a delay to simply change the state variable `actionButtonState`. The view responds accordingly. k

## Configuration

`ActionButton` takes in a handful of parameters in its initialization. 

- `state`: `ActionButtonState` - This is an enum (enabled, loading, disabled) with an associated value of type `ActionButtonModel` which allows you to set the SFSymbol and text of the button. 
- `onTap`: `(() -> Void)` - A callback to handle any taps. This is required since `ActionButton` handles its own tap animation. Your own `onTapGesture` won't work here.
- `backgroundColor`: `Color` - the background color for the button during its `enabled` state.
- `foregroundColor`: `Color` - the foreground color for the button during all states.
