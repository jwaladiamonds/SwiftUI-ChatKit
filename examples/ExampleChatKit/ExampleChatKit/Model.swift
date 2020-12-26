//
//  Model.swift
//  ExampleChatKit
//
//  Created by Nikhil John on 26/12/20.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
}

struct Message: Identifiable {
    var id = UUID()
    var user: User
    var text: String
}
