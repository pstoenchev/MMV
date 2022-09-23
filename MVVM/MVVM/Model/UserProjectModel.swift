//
//  UserProjectModel.swift
//  MVVM
//
//  Created by Petar Stoenchev on 17.09.22.
//

import Foundation

struct UserProjectModel: Codable {
    
    var name: String?
    var privates: Bool?
    var language: String?
    var description: String?
    var starCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case privates = "private"
        case language = "language"
        case description = "description"
        case starCount = "stargazers_count"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        privates = try values.decodeIfPresent(Bool.self, forKey: .privates)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        starCount = try values.decodeIfPresent(Int.self, forKey: .starCount)
    }
}

