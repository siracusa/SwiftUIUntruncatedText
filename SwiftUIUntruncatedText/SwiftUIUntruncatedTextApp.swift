//
//  SwiftUIUntruncatedTextApp.swift
//  SwiftUIUntruncatedText
//
//  Created by John Siracusa on 12/14/24.
//

import SwiftUI


@main
struct SwiftUIUntruncatedTextApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 400, minHeight: 90, alignment: .top)
        }
        .defaultSize(width: 512, height: 342)
        .windowResizability(.contentSize)
    }
}
