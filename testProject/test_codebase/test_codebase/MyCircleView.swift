//
//  MyCircleView.swift
//  test_codebase
//
//  Created by JSB on 2023/06/27.
//

import Foundation
import UIKit

class MyCircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView - layoutSubviews() callsed")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
