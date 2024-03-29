//
//  DateHelper.swift
//  App2
//
//  Created by Sam on 6/12/19.
//  Copyright © 2019 WRS. All rights reserved.
//

import Foundation
import CoreData

class NotesDataHelper{
    
}
class DateHelper {
    
    static func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format which type of output you need
        formatter.dateFormat = "EEEE, MMM d, yyyy, hh:mm:ss"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
}
extension Date{
    func toSeconds() -> Int64! {
        return Int64((self.timeIntervalSince1970).rounded())
    }
    init(seconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(Double.init(seconds)))
    }
}
