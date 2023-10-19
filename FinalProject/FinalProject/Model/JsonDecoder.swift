//
//  JsonDecoder.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/11.
//

import Foundation

struct JsonDecoder {
    
    func decodeData(data: Data) -> SeoulParkingInformationModel? {
        var decodedData: SeoulParkingInformationModel?
        
        do {
            decodedData = try JSONDecoder().decode(SeoulParkingInformationModel.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let decodedData = decodedData else { return nil }
        
        return decodedData
    }
    
}
