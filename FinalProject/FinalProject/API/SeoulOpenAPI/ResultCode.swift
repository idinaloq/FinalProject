//
//  ResultCode.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

struct ResultCode: Decodable {
    let code: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}
