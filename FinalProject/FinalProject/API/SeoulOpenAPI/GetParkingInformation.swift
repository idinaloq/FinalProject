//
//  GetParkingInformation.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

import Foundation

struct GetParkingInformation: Decodable {
    let listTotalCount: Int
    let resultCode: ResultCode
    var row: [Row]
    
    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case resultCode = "RESULT"
        case row
    }
}
