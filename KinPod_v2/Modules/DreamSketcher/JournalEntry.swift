//
//  JournalEntry.swift
//  KinPod_v2
//
//  Created by Christopher Castillo on 7/1/25.
//

import Foundation

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date

    init(id: UUID = UUID(), title: String, content: String, date: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
}
