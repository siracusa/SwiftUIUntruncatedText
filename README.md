The goal of this demo is to have all three lines of text visible in the green
box (which is within the red box) even as the window is resized. Also, toggling
the number of lines of text should shrink and grow the both the green and the
red boxes so that they are just big enough to contain all the lines of text.

(*Ideally*, the window itself would also shrink and grow in response to the
number of lines of text changing, but one thing at a time.)

As you can see in the `ContentView`, the only way I've found to accomplish this
is with the (very janky, IMO) use of `PreferenceKey`s. **There has got to be a
better way!**

Oh, and when I tried to used `.fixedSize(…)` to solve this problem, it interfered
with the `.windowResizability(.contentSize)` modifier and allowed the window to be
resized such that it cut off the button and other stuff.

<img src="https://github.com/siracusa/SwiftUIUntruncatedText/blob/main/screenshot.png?raw=true" width=677 height=543 alt="Screenshot">
