//
//  NetworkService.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/11.
//

import Foundation

final class NetworkService {
    func fetchData(request: URLRequest, completion: @escaping (Data) -> Void ) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error { return }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else { return }
            
            guard let data = data else { return }
            
            completion(data)
        }
        task.resume()
    }
}
