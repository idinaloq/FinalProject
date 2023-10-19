//
//  HomeViewController.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

import UIKit
import NMapsMap

final class HomeViewController: UIViewController {
    private var parkingData: SeoulParkingInformationModel?
    private var uniqueRows: [Row] = []
    private var visibleMarkerRows: [Row] = []
    private var seoulOpenAPI: SeoulOpenAPI = SeoulOpenAPI()
    private var networkService: NetworkService = NetworkService()
    private var jsonDecoder: JsonDecoder = JsonDecoder()
    private let loadingView: LoadingView = LoadingView()
    private lazy var mapView = NMFMapView(frame: view.frame)
    private var allMarkers: [NMFMarker] = []
    private var visibleMarkers: [NMFMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.show()
        configureViews()
        configureNavigation()
        receiveData()
        
    }
    
    private func configureViews() {
        view.addSubview(loadingView)
        view.addSubview(mapView)
        
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
        getVisibleMarkers()
        let listViewController: ListViewController = ListViewController(visibleMarkerRows: visibleMarkerRows)
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    private func receiveData() {
        DispatchQueue.global().async { [weak self] in
            
            var min: Int = 1
            var max: Int = 1000
            var listCount: Int = 1001
            let dispatchGroup = DispatchGroup()
            
            while max <= listCount {
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
            self?.deleteSameParkingName()
            self?.addMarker()
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

    private func addMarker() {
        DispatchQueue.main.async {

            for rowElement in self.uniqueRows {

                let marker = NMFMarker()
                marker.position = NMGLatLng(lat: rowElement.lat, lng: rowElement.lng)
                marker.isHideCollidedMarkers = true
                marker.isForceShowIcon = true
                marker.captionText = "\(rowElement.parkingName)"
                marker.mapView = self.mapView
                self.allMarkers.append(marker)
                
                let infoWindow = NMFInfoWindow()
                let dataSource = NMFInfoWindowDefaultTextSource.data()
                dataSource.title = "\(rowElement.parkingName)"
                infoWindow.dataSource = dataSource
                
                marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                    infoWindow.open(with: marker)
                    return true
                }
            }
        }
    }
    
    private func getVisibleMarkers() {
        visibleMarkers = allMarkers.filter { marker in
            let markerScreenPosition = mapView.projection.point(from: marker.position)
            
            return mapView.bounds.contains(markerScreenPosition)
        }
        
        var markerRows: [String: Row] = [:]
        
        for row in 0..<uniqueRows.count {
            for index in 0..<visibleMarkers.count {
                if uniqueRows[row].parkingName == visibleMarkers[index].captionText {
                    markerRows[uniqueRows[row].parkingName] = uniqueRows[row]
                }
            }
        }
        visibleMarkerRows = Array(markerRows.values)
    }

    private func deleteSameParkingName() {
        var uniqueRowsDict: [String: Row] = [:]
        
        guard let parkingData = parkingData else { return }
        
        for row in parkingData.getParkingInformation.row {
            if uniqueRowsDict[row.parkingName] == nil {
                uniqueRowsDict[row.parkingCode] = row
            }
        }
        
        uniqueRows = Array(uniqueRowsDict.values)
    }
}

