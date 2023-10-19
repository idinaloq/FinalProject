//
//  SecondViewController.swift
//  SampleUiKit
//
//  Created by JSB on 2023/05/14.
//

//delegate = 이벤트 전달자
//이벤트 함수 구현시 주로 사용
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var textViewData: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //텍스트필드의 이벤트 대리자는 나다
        textFieldData.delegate = self
        
    }
    
    //textField에 글자가 입력될때마다 호출되어지는 함수
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(textField.text!)
        textViewData.text = textField.text!
        
        return true
    }
    
    //글자입력 완료될 때 한 번 호출됨
    //키보드 완료버튼이나 포커스가 바뀔 때
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldSholdEndEditing")
        return true
    }
    
    //키보드 완료 혹은 다음버튼부분을 누르면 return 반환
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }
    
}
