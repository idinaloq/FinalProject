//
//  ViewController.swift
//  SampleUiKit
//
//  Created by JSB on 2023/05/14.
//
//스토리보드 UI에 대응하기 위한 컨트롤소스
//한 화면 - 스토리보드 화면 1개 - 뷰 컨트롤러 소스 1개

import UIKit

class ViewController: UIViewController {

    //아웃렛 변수가 들어가는 곳
    //IB = interface builder
    //weak = 메모리전략을위해
    //@ = 컴파일지시어
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //뷰가 로딩되었을 때 자동 호출
        //초기화 코드들 작성
        
        labelTitle.backgroundColor = UIColor.cyan
        labelTitle.text = "타이틀입니다."
        labelTitle.textColor = UIColor.orange
        
        btn1.backgroundColor = UIColor.red
        
        for btn in buttons {
            btn.backgroundColor = UIColor(red: 255/255, green: 100/255, blue: 10, alpha: 1)
        }
        
    }
    
    //액션함수가 들어가는 곳
    @IBAction func onBtn1Click(_ sender: UIButton) {
        print("btn1 클릭됨")
        labelTitle.text = "btn1 클릭됨"
    }
    
    
    @IBAction func onBtnInput(_ sender: UIButton) {
        let titleText = textFieldInput.text
        labelTitle.text = titleText
    }
    
}

