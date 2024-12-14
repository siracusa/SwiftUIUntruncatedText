![Screenshot](https://github.com/siracusa/SwiftUIUntruncatedText/blob/main/screenshot.png?raw=true)

The goal of this demo is to have all three lines of text visible in the
reen box (which is within the red box) even as the window is resized. Also,
oggling the number of lines in the text should shrink and grow the both the
reen and the red boxes so that they are just big enough to contain all the
ines of text.

*Ideally*, the window itself would also shrink and grow in response to the
umber of lines itself changing, but one thing at a time.)

As you can see, the only way I've found to accomplish this is with the (very
janky, IMO) use of PreferenceKeys. There has got to be a better way!
