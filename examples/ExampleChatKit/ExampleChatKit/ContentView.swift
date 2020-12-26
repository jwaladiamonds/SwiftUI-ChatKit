//
//  ContentView.swift
//  ExampleChatKit
//
//  Created by Nikhil John on 26/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var messages = [Message]()
    var body: some View {
        MessageScrollView(messages: messages) { message in
            ChatBubble(message: message).tag(message.id)
        }
        .onAppear {
            let user1 = User(name: "Nikz")
            let user2 = User(name: "Jon")
            var m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
