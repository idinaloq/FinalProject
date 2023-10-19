//
//  SeoulParkingInformationModel.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

struct SeoulParkingInformationModel: Decodable {
    var getParkingInformation: GetParkingInformation

    enum CodingKeys: String, CodingKey {
        case getParkingInformation = "GetParkingInfo"
    }
    
    mutating func appendData(newRow: SeoulParkingInformationModel) {
        self.getParkingInformation.row.append(contentsOf: newRow.getParkingInformation.row)
    }
}
