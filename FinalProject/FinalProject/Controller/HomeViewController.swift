//
//  HomeViewController.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

import UIKit

final class HomeViewController: UIViewController {
    private var parkingData: SeoulParkingInformationModel?
    private var seoulOpenAPI: SeoulOpenAPI = SeoulOpenAPI()
    private var networkService: NetworkService = NetworkService()
    private var jsonDecoder: JsonDecoder = JsonDecoder()
    private let loadingView: LoadingView = LoadingView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.show()
        configureLoadingView()
        configureNavigation()
        receiveData()
    }
    
    private func configureLoadingView() {
        view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureNavigation() {
        navigationItem.title = "서울시 주차장 실시간 주차정보"
        let moreButton: UIBarButtonItem = UIBarButtonItem(title: "목록보기", style: .done, target: self, action: #selector(tappedMoreButton))
        navigationItem.rightBarButtonItem = moreButton
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.white
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = UIColor.blue
        }
    }

    @objc private func tappedMoreButton() {
        guard let parkingData = parkingData else { return }
        
        let listViewController: ListViewController = ListViewController(parkingData: parkingData)
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    private func receiveData() {
        DispatchQueue.global().async { [weak self] in
            
            var min: Int = 1
            var max: Int = 100
            var listCount: Int = 1001
            let dispatchGroup = DispatchGroup()
            
            while max <= 1000 {
                dispatchGroup.enter()
                
                guard let urlRequest = self?.receiveUrlRequest(min: min, max: max) else {
                    dispatchGroup.leave()
                    return
                }

                self?.networkService.fetchData(request: urlRequest) { [weak self] data in
                    guard let decodedData = self?.jsonDecoder.decodeData(data: data) else { return }
                    
                    if let _ = self?.parkingData {
                        self?.parkingData?.appendData(newRow: decodedData)
                    } else {
                        self?.parkingData = decodedData
                        listCount = decodedData.getParkingInformation.listTotalCount
                    }
                    
                    min += 1000
                    max += 1000
                    dispatchGroup.leave()
                }
                dispatchGroup.wait()
            }
            self?.loadingView.hide()
        }
    }
    
    private func receiveUrlRequest(min: Int, max: Int) -> URLRequest? {
        do {
            let urlRequest = try seoulOpenAPI.receiveUrlRequest(min: min, max: max)
            
            return urlRequest
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
}

