//
//  Orison.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 23.07.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import Foundation

struct Orison {
    let id: UUID
    let text: String
    let title: String
    let shortText: String?
    
    //  MARK: Decoder and encoder
    /*
     enum CodingKeys: String, CodingKey {
     case id
     case text
     case title
     case shortText
     }
     func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(id, forKey: .id)
     try container.encode(text, forKey: .text)
     try container.encode(title, forKey: .title)
     try container.encode(shortText, forKey: .shortText)
     }
     
     init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
     id = try container.decode(UUID.self, forKey: .id)
     text = try container.decode(String.self, forKey: .text)
     title = try container.decode(String.self, forKey: .title)
     shortText = try container.decode(String.self, forKey: .shortText)
     
     }
     */
}
extension Orison: Codable{
    
}

