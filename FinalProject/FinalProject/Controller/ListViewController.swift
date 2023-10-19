//
//  ListViewController.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/14.
//

import UIKit

class ListViewController: UIViewController {
    var parkingData: SeoulParkingInformationModel
    
    private let parkingListTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ParkingListCell.self, forCellReuseIdentifier: ParkingListCell.identifier)
        
        return tableView
        
    }()
    
    init(parkingData: SeoulParkingInformationModel) {
        self.parkingData = parkingData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureAutoLayout()
    }
    
    private func configureUI() {
        parkingListTableView.delegate = self
        parkingListTableView.dataSource = self
        view.backgroundColor = .systemBackground
        view.addSubview(parkingListTableView)

    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            parkingListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            parkingListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            parkingListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            parkingListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ParkingListCell.identifier, for: indexPath) as? ParkingListCell else {
            print("셀 반환실패")
            
            return ParkingListCell()
        }
        
        return cell
    }
}
