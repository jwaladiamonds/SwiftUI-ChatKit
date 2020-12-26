//
//  ChatBubble.swift
//  ExampleChatKit
//
//  Created by Nikhil John on 26/12/20.
//

import SwiftUI

struct ChatBubble: View {
    var message: Message
    var body: some View {
        VStack(alignment: .leading , spacing: 0) {
            HStack {
                HStack {
                    Image(systemName: "person.crop.square.fill")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.gray)
                        .scaledToFit()
                        .frame(height: 24)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    Text(message.user.name)
                        .fontWeight(.bold)
                }
                .padding(4)
                .background(Color(.systemGroupedBackground))
                .contentShape(RoundedRectangle(cornerRadius: 4))
                .contextMenu(menuItems: {
                    Text("@username")
                    Button(action: {
                        // Action will goes here
                    }) {
                        Text("Reply")
                        Image(systemName: "arrowshape.turn.up.left.circle.fill")
                    }
                    Button(action: {
                        // Action will goes here
                    }) {
                        Text("Copy")
                        Image(systemName: "doc.on.doc.fill")
                    }
                })
                Spacer()
                Text("Today 11:23 PM")
                    .font(.footnote)
                    .opacity(0.5)
            }
            Text(message.text)
                .padding(.leading, 36)
        }
        .padding(.bottom, 10)
    }
}
