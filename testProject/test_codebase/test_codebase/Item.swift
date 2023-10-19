//
//  Item.swift
//  test_codebase
//
//  Created by JSB on 2023/06/27.
//

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let totalDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case totalDescription = "desc"
        
    }
}
