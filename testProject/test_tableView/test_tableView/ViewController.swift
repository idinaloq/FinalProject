//
//  ViewController.swift
//  test_tableView
//
//  Created by JSB on 2023/06/26.
//
//command shift o = 검색

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier: String = "cell"
    let rowNumber: [Int] = [0, 1, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //섹션에 해당하는 row의 개수가 몇 개여야하는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 50
    }
    
    
    //row마다 해당하는 셀을 반환하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let text: String = "\(indexPath.section), \(indexPath.row)"

        cell.textLabel?.text = text
        
        return cell
    }

    //섹션마다 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    //테이블뷰 얼럿
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row

        let alert = UIAlertController(title: "어머나", message: "날 만졌어\nsection: \(section), row: \(row)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        //segue의 identifier로 구분가능. (여러개인경우)
//        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
//            return
//        }
//
//        guard let cell: UITableViewCell = sender as? UITableViewCell else {
//            return
//        }
//
//        nextViewController.textToSet = cell.textLabel?.text
//    }

}

