//
//  Todo.swift
//  todolist
//
//  Created by Sean on 19/6/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import Foundation
let dateFormatter = DateFormatter()

class Todo: Encodable, Decodable {
    var name: String
    var description: String
    var date: String
    var imageName: String
    init(name: String, description: String, date: String, imageName: String) {
        self.name = name
        self.description = description
        self.date = date
        self.imageName = imageName
    }
    static func getArchiveURL() -> URL {
        let plistName = "todos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(todos: [Todo]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(todos)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Todo]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedTodosData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedTodos = try? propertyListDecoder.decode(Array<Todo>.self, from: retrievedTodosData) else { return nil }
        return decodedTodos
    }
}
