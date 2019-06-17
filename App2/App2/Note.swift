//
//  Note.swift
//  App2
//
//  Created by Sam on 6/12/19.
//  Copyright © 2019 WRS. All rights reserved.
//

import Foundation


class MyNotes {
    private(set) var note_ID        : UUID
    private(set) var note_title     : String
    private(set) var note_text      : String
    private(set) var note_timestamp : Int64
    
    init(note_title:String, note_text:String, note_timestamp:Int64) {
        self.note_ID        = UUID()
        self.note_title     = note_title
        self.note_text      = note_text
        self.note_timestamp = note_timestamp
    }
    
    init(note_ID: UUID, note_title:String, note_text:String, note_timestamp:Int64) {
        self.note_ID        = note_ID
        self.note_title     = note_title
        self.note_text      = note_text
        self.note_timestamp = note_timestamp
    }
}
