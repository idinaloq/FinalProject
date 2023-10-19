//
//  LoadingView.swift
//  FinalProject
//
//  Created by JSB on 2023/10/14.
//

import UIKit

class LoadingView: UIView {
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.color = .systemRed
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureAutoLayout()
        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func show() {
        DispatchQueue.main.async { [weak self] in
            self?.layer.zPosition = 1
            self?.activityIndicator.startAnimating()
        }
    }
    
    func hide() {
        DispatchQueue.main.async { [weak self] in
            self?.layer.zPosition = 0
            self?.activityIndicator.stopAnimating()
        }
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.zPosition = 1
        backgroundColor = .systemBackground
        addSubview(activityIndicator)
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
}
