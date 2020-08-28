//
//  CalendarViewController.swift
//  ADLogger_v2
//
//  Created by 助川友理 on 2020/08/27.
//  Copyright © 2020 助川友理. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UIPickerViewDelegate {
    
    var times = 0
    var bool = 0
    
    @IBOutlet weak var taskname: UITextField!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var sec: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tseg: UISegmentedControl!
    @IBAction func timebool(_ sender: Any) {
        let selectedIndex = tseg.selectedSegmentIndex
        let tbool = tseg.titleForSegment(at: selectedIndex)!
        if tbool == "開始" {
            bool = 0
        } else {
            bool = 1
        }
        print(bool)
    }
    
    @IBAction func addCalendar(_ sender: Any) {
        
    }
    
    // MARK: - ADLoggerの時間表示
    
    func timeappend(){
        hour.text = String(format: "%02d", times/3600)
        min.text = String(format: "%02d", times/60 % 60)
        sec.text = String(format: "%02d", times % 60)
    }
    
    // MARK: - DatePicker関連
       
       var datePicker: UIDatePicker = UIDatePicker()
       
      override func viewDidLoad() {
        timeappend()
           super.viewDidLoad()
           
           // ピッカー設定
           datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
           datePicker.timeZone = NSTimeZone.local
           datePicker.locale = Locale.current
           textField.inputView = datePicker
           
           // 決定バーの生成
           let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
           let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
           let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
           toolbar.setItems([spacelItem, doneItem], animated: true)
           
           // インプットビュー設定
           textField.inputView = datePicker
           textField.inputAccessoryView = toolbar
           
           // デフォルト日付
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy/MM/dd HH:mm"
           textField.text = "\(formatter.string(from: Date()))"
       }
       
       // 決定ボタン押下
       @objc func done() {
           textField.endEditing(true)
           
           // 日付のフォーマット
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy/MM/dd HH:mm"
           textField.text = "\(formatter.string(from: datePicker.date))"
           view.endEditing(true)
       }
    
    
}
