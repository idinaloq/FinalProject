import Foundation

//
//  KakaoAPI.swift
//  BoxOffice
//
//  Created by Idinaloq, MARY on 2023/08/09.
//

import Foundation

var a = KakaoAPI()

print(a.receiveURLRequest(queryItems: ["query": "aa"]))


struct KakaoAPI {
    private let baseURL: URLComponents = {
        var components: URLComponents = URLComponents()
        
        components.scheme = Components.scheme
        components.host = Components.host
        components.path = Components.path
        components.queryItems = []
        
        return components
    }()
    
    func receiveURLRequest(queryItems: [String: String]) -> URLRequest {
        var components: URLComponents = baseURL
        
        queryItems.forEach { item in
            let queryItem: URLQueryItem = URLQueryItem(name: item.key, value: item.value)
            
            components.queryItems?.append(queryItem)
        }
        

        
        var urlRequest: URLRequest = URLRequest(url: components.url!)
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(APIKey.value, forHTTPHeaderField: APIKey.key)
    
        return urlRequest
    }
    
    func receiveData() {
        guard let url = receiveURL() else { return }
        
        NetworkService().fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.decodeData(data)
                self.reloadCollectionView()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private enum APIKey {
        static let key: String = "Authorization"
        static let value: String = "KakaoAK 5a5bed59f416826d3b667c6d97eac62a"
    }
    
    private enum Components {
        static let scheme: String = "https"
        static let host: String = "dapi.kakao.com"
        static let path: String = "/v2/search/image"
    }
}

struct ImageSerch {
    let documents: [Document]
//    let meta
}

struct Document {
//    let collection: String
//    let datetime: String
//    let display_sitename: String
//    let doc_url: String
//    let height: String
    let imageURL: String
//    let thumbnail_url: String
//    let width: Int
//    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

func receiveURL() -> URLRequest? {
    do {
        let url = try kobisOpenAPI.receiveURL(serviceType: .dailyBoxOffice, queryItems: ["targetDt": dateManager.getYesterdayDate(format: "yyyyMMdd")])
        return url
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

func receiveData() {
    guard let url = receiveURL() else { return }
    
    NetworkService().fetchData(url: url) { result in
        switch result {
        case .success(let data):
            self.decodeData(data)
            self.reloadCollectionView()
        case .failure(let error):
            print(error)
        }
    }
}

//
//  NetworkService.swift
//  BoxOffice
//
//  Created by Idinaloq, MARY on 2023/07/27.
//

import Foundation

final class NetworkService {
    typealias NetworkResult = (Result<Data, NetworkError>) -> Void
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchData(url: URLRequest, completion: @escaping NetworkResult) {
        let task: URLSessionDataTask  = session.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFail))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.responseFail))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCodeNotSuccess(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataIsNil))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
