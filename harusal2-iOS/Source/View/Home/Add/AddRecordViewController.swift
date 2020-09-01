//
//  AddRecordViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/28.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class AddRecordViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet weak var doneButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var doneButton: UIButton!
    let datePicker = UIDatePicker()
    let viewModel = AddRecordViewModel()
    var isEditingTextView = false
    let converter = Converter.shared
    //내역을 입력하지 않았을 때
    //Keyboard에 Done버튼과 DatePicker 붙히는 것 Extension으로 변경하기 -> 추후
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        createDatePicker()
        
        dateTextField.text = converter.convertDate(Date())
        
        viewModel.dateChanged = {
            //날짜 변경했을 때
            self.dateTextField.text = $0
        }
    }
    
    func updateUI(){
        moneyLabel.text = viewModel.money
    }
    
    override func setConstraints() {
        dateTextField.delegate = self
        descriptionTextView.delegate = self
        
        descriptionTextView.layer.borderColor = UIColor.black.cgColor
        descriptionTextView.layer.borderWidth = 1
        
        //UITextView 는 isEditing이 없어서 DidShowNotification을 사용
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardDidShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor.black.cgColor
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
        //Keyboard Accessory Done
        let date = converter.convertDate(datePicker.date)
        dateTextField.text = date
        self.view.endEditing(true)
    }
    @IBAction func tappedDoneButton(_ sender: Any) {
        var money = moneyLabel.text
        money?.removeLast() // "원" 빼기
        if let amount = money{
            viewModel.money = amount
        }else{
            viewModel.money = "0"
        }
        viewModel.content = self.descriptionTextView.text
        viewModel.date = self.dateTextField.text
        print(viewModel.date)
        viewModel.addData()
            if let navi = self.navigationController{
                let viewControllers = navi.viewControllers
                navi.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
            }else{
                return
            }
        
        
    }
    
    @IBAction func tappedDateButton(_ sender: Any) {
        self.dateTextField.becomeFirstResponder()
    }
    
    @IBAction func tappedBG(_ sender: Any) {
        if dateTextField.isEditing{
            dateTextField.resignFirstResponder()
        }
        else if isEditingTextView{
            descriptionTextView.resignFirstResponder()
            isEditingTextView=false
        }
    }
}

extension AddRecordViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //TextView가 포커스를 얻었을 때
        isEditingTextView = true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        print(newSize.height)
        if textView.frame.height < 80 {
            //1줄 높이일 때만 증가를 시킨다
            self.textViewHeight.constant = newSize.height
        }
//        viewModel.content = textView.text
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        //TextView가 포커스를 잃었을 때
        isEditingTextView = false
    }
}

extension AddRecordViewController{
    @objc func adjustInputView(noti: Notification){
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if noti.name == UIResponder.keyboardDidShowNotification, isEditingTextView==true{
            let keyboardHeight = keyboardFrame.height
            let safeInsets = self.view.safeAreaInsets.bottom
            self.doneButtonBottom.constant = keyboardHeight - safeInsets
        } else if noti.name == UIResponder.keyboardWillHideNotification {
            self.doneButtonBottom.constant = .zero
        }
    }
}
