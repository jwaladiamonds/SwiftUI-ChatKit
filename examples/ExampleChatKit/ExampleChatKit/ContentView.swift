//
//  ContentView.swift
//  ExampleChatKit
//
//  Created by Nikhil John on 26/12/20.
//

import SwiftUI

let user1 = User(name: "Nikz")
let user2 = User(name: "Jon")

struct ContentView: View {
    @State var message = ""
    @State var messages = [Message]()
    var body: some View {
        VStack {
            MessageScrollView(messages: messages) { message in
                ChatBubble(message: message).tag(message.id)
            }
            MessageField(text: $message) {
                messages.append(Message(user: user1, text: message))
            }
        }
        .onAppear {
            var m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
            messages.append(m)
            m = Message(user: user2, text: "Hello wrold 2")
            messages.append(m)
            m = Message(user: user1, text: "Hello wrold")
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
