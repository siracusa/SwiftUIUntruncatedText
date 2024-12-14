//
//  ContentView.swift
//  SwiftUIUntruncatedText
//
//  Created by John Siracusa on 12/14/24.
//

import SwiftUI

// The goal of this demo is to have all three lines of text visible in the
// green box (which is within the red box) even as the window is resized. Also,
// toggling the number of lines in the text should shrink and grow the both the
// green and the red boxes so that they are just big enough to contain all the
// lines of text.
//
// (Ideally, the window itself would also shrink and grow in response to the
// number of lines itself changing, but one thing at a time.)
//
// As you can see, the only way I've found to accomplish this is with the (very
// janky, IMO) use of PreferenceKeys. There has got to be a better way!

let text1 = try! AttributedString(markdown: """
**All three lines of text should be visible.**

*Even when the window is resized.*

The red box should be just tall enough to contain the text.
"""
   , options: AttributedString.MarkdownParsingOptions(
       interpretedSyntax: .inlineOnlyPreservingWhitespace
   )
)

let text2 = AttributedString("This text has only one line.")

struct ContentView: View {
    @State private var textToggle : Bool = true
    @State private var textHeight: CGFloat = 0

    var body: some View {
        VStack {
            HStack {
                Text(textToggle ? text1 : text2)
                    .background(Color.green)
                    .background(GeometryReader { geometry in
                        Color.clear.preference(key: TextHeightKey.self, value: geometry.size.height)
                    })
            }
            .frame(maxWidth: .infinity, minHeight: textHeight)
            .background(Color.red)
            .layoutPriority(1)
            .onPreferenceChange(TextHeightKey.self) { height in
                self.textHeight = height
            }

            HStack {
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .background(Color.blue)

            HStack {
                Button(action: {
                    textToggle.toggle()
                }) {
                    Text("Toggle Text")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TextHeightKey : PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
