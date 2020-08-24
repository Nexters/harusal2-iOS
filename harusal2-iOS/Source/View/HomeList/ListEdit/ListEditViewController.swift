//
//  ListEditViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class ListEditViewController: BaseViewController {

    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var desTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    let datePicker = UIDatePicker()
    let viewModel = ListEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        updateUI()
        
        viewModel.dateChanged = { str in
            self.dateTextField.text = str
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        if let breakDown = viewModel.breakDown {
            dateTextField.text = breakDown.date
            moneyTextField.text = "\(breakDown.amount)"
            desTextField.text = breakDown.content
        } else {
            return
        }
    }
    
    private func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        //assign toolbar
        dateTextField.inputAccessoryView = toolbar
        
        dateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressed(){
        
        let converter = Converter()
        let date = converter.convertDate(datePicker.date)
        
        viewModel.date = date
        self.view.endEditing(true)
    }
    @IBAction func tappedSelectDateButton(_ sender: Any) {
        self.dateTextField.becomeFirstResponder()
    }
    
    @IBAction func saveInfo(_ sender: Any) {
        // Todo : 이전화면으로 이동하면서 데이터 전달
        if let navi = self.navigationController {
            viewModel.updateData()
            navi.popViewController(animated: true)
        }else{
            return
        }
    }
    

    override func setConstraints() {
        moneyTextField.keyboardType = .numberPad
        desTextField.addDoneButtonOnDesKeyboard()
        moneyTextField.addDoneButtonOnDesKeyboard()
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: UIControl.State.normal)//세그먼트 Text Color 변경
        dateView.roundView(by: 100)
        dateView.setBorder(thick: CGFloat(1), color: UIColor.black.cgColor)
    }
    

}
extension ListEditViewController {
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if noti.name == UIResponder.keyboardWillShowNotification, desTextField.isEditing==true{
            let keyboardHeight = keyboardFrame.height
            self.view.frame.origin.y -= keyboardHeight/3
        } else if desTextField.isEditing == true {
            self.view.frame.origin.y = .zero
        }
    }
}
