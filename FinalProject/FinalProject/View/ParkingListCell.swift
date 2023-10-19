//
//  ParkingListCell.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/11.
//

import UIKit

final class ParkingListCell: UITableViewCell {
    static let identifier: String = "ParkingListCell"
    
    private let parkingNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "주차장이름"
        
        return label
    }()
    
    private let payNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "유료 무료구분여부"
        
        return label
    }()
    
    private let weekdayTimeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(평일/주말)00:00 ~ 24:00/00:10 ~ 24:00"
        
        return label
    }()

    private let currentParkingLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "현재 주차가능대수 00대 "
        
        return label
    }()
    
    private let parkingNameStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let payNameStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let weekdayTimeStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private let currentParkingStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        parkingNameStackView.addArrangedSubview(parkingNameLabel)
        payNameStackView.addArrangedSubview(payNameLabel)
        weekdayTimeStackView.addArrangedSubview(weekdayTimeLabel)
        currentParkingStackView.addArrangedSubview(currentParkingLabel)
        
        contentView.addSubview(parkingNameStackView)
        contentView.addSubview(payNameStackView)
        contentView.addSubview(weekdayTimeStackView)
        contentView.addSubview(currentParkingStackView)
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            parkingNameStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            parkingNameStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            parkingNameStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            parkingNameStackView.bottomAnchor.constraint(equalTo: payNameStackView.topAnchor),
            
            payNameStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            payNameStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            payNameStackView.bottomAnchor.constraint(equalTo: weekdayTimeStackView.topAnchor),
            
            weekdayTimeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weekdayTimeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weekdayTimeStackView.bottomAnchor.constraint(equalTo: currentParkingStackView.topAnchor),

            currentParkingStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            currentParkingStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            currentParkingStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        parkingNameLabel.text = ""
        payNameLabel.text = ""
        weekdayTimeLabel.text = ""
        currentParkingLabel.text = ""
    }
    
    func configureLabel(parkingName: String, payName: String, weekStart: String, weekEnd: String,weekendStart: String, weekendEnd: String, remainParking: Int) {
        parkingNameLabel.text = "주차장 이름: \(parkingName)"
        payNameLabel.text = "유/무료 구분: \(payName)"
        weekdayTimeLabel.text = "운영시간: 평일\(weekStart)~\(weekEnd) / 주말\(weekendStart)~\(weekendEnd)"
        currentParkingLabel.text = "주차가능대수: \(remainParking)"
    }
}
