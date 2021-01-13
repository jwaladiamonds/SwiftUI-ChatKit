//
//  ExampleChatKitApp.swift
//  ExampleChatKit
//
//  Created by Nikhil John on 26/12/20.
//

import SwiftUI

@main
struct ExampleChatKitApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            Scroller()
        }
    }
}

struct ScrollingView: View {
    @State var message = ""
    @State var messages = [String]()
    var body: some View {
        ScrollViewReader { proxy in
            Button("Scroll to bottom".lowercased()) {
                proxy.scrollTo(99, anchor: .center)
            }
            ScrollView {
                ForEach(1 ..< 101) { index in
                    Text("Message \(index)")
                }
//                ForEach(messages, id: \.self) { message in
//                    Text(message)
//                }
            }
            .onAppear {
                for index in 1...100 {
                    messages.append("Message \(index)")
                }
            }
        }
    }
}


struct Scroller: View {
    var body: some View {
        ScrollViewReader { proxy in
            Button("Scroll to bottom") {
                proxy.scrollTo(100, anchor: .center)
            }
            ScrollView {
                ForEach(1..<101) { index in
                    Text(String(index))
                        .id(index)
                }
            }
        }
    }
}
