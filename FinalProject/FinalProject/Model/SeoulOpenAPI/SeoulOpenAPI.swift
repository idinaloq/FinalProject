//
//  SeoulOpenAPI.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/11.
//

import Foundation

struct SeoulOpenAPI {
        private var baseUrl: URLComponents = {
        var components: URLComponents = URLComponents()
        components.scheme = "http"
        components.host = "openapi.seoul.go.kr"
        components.port = 8088
        components.path = "/61416856556372653639464a4e716d/json/GetParkingInfo/"
        
        return components
    }()
    
    mutating func receiveUrlRequest(min: Int, max: Int) throws -> URLRequest {
        setBaseUrlPath(min: min, max: max)
        
        guard let url = baseUrl.url else {
            throw URLError.urlIsNil
        }
        
        return URLRequest(url: url)
    }
    
    private mutating func setBaseUrlPath(min: Int, max: Int) {
        baseUrl.path = "/61416856556372653639464a4e716d/json/GetParkingInfo/"
        baseUrl.path = baseUrl.path + "\(min)" + "/" + "\(max)" + "/"
    }
    
    
}

enum URLError: LocalizedError {
    case urlIsNil
    
    var errorDescription: String? {
        switch self {
        case .urlIsNil:
            return "URL이 Nil 입니다."
        }
    }
}
// http://openapi.seoul.go.kr:8088/61416856556372653639464a4e716d/json/GetParkingInfo/1/1/

