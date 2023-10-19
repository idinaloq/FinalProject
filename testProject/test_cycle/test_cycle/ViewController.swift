//
//  ViewController.swift
//  test_cycle
//
//  Created by JSB on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        myView.frame = view.bounds
        view.addSubview(myView)

        class MyView: UIView {
            override func draw(_ rect: CGRect) {
                // Do nothing
            }
        }
    }
    
}

