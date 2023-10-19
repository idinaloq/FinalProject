//
//  ViewController.swift
//  test_codebase
//
//  Created by JSB on 2023/06/27.
//

import UIKit

class ViewController: UIViewController {

    var mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var myThirdView: MyCircleView = {
       let circleView = MyCircleView()
        circleView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 50)
        ])
        
        self.view.addSubview(myThirdView)
        NSLayoutConstraint.activate([
            myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5),
            myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5),
            myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50),
            myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }


}

