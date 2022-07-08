//
//  MyDateFormatter.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 6/25/22.
//

import Foundation

class MyDateFormatter {
    let formatter = DateFormatter()
    static let formatterString = "YYYY-MM-DD"
    
    init() {
        formatter.dateFormat = MyDateFormatter.formatterString
    }
}
