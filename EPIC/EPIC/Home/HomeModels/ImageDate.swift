//
//  ImageDate.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Foundation

//struct ImageDates: Decodable {
//    let dates: [ImageDate]
//}

struct ImageDate: Decodable, Identifiable, Hashable {
    var id: UUID {
        return UUID()
    }
    
    let date: String
}
