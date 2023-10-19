//
//  ViewController.swift
//  test_CoreGraphics
//
//  Created by JSB on 2023/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawNormalCircle()
        
        // Do any additional setup after loading the view.
    }
    
    func drawNormalCircle() {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        //normalCricle
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        
        context?.addEllipse(in: CGRect(x: 80, y: 250, width: 200, height: 200))
        context?.strokePath()
        
        //selectedCircle
        context?.setLineWidth(8.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setLineCap(.round)
        
        context?.move(to: CGPoint(x: 120, y: 350))
        context?.addLine(to: CGPoint(x: 170, y: 400))
        context?.strokePath()
        
        context?.move(to: CGPoint(x: 170, y: 400))
        context?.addLine(to: CGPoint(x: 240, y: 320))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    


}

