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
    var amount = 0
    let viewModel = ListEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        moneyTextField.delegate = self
        
        updateUI()
        
        viewModel.dateChanged = { self.dateTextField.text = $0 }
    }
    
    func updateUI(){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let breakDown = viewModel.breakDown {
            amount = breakDown.amount
            dateTextField.text = breakDown.date
            moneyTextField.text = numberFormatter.string(from: NSNumber(value: breakDown.amount))
            desTextField.text = breakDown.content
            switch breakDown.type{
                case 0:
                    segment.selectedSegmentIndex = 0
                case 1:
                    segment.selectedSegmentIndex = 1
                default:
                    segment.selectedSegmentIndex = 0
            }
        } else {
            return
        }
    }
    
    @IBAction func tappedBG(_ sender: Any) {
        if dateTextField.isEditing == true{
            dateTextField.resignFirstResponder()
        } else if moneyTextField.isEditing == true{
            moneyTextField.resignFirstResponder()
        } else{
            desTextField.resignFirstResponder()
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
        if let navi = self.navigationController {
            var type = 0
            switch segment.selectedSegmentIndex {
            case 0:
                type = 0
            case 1:
                type = 1
            default:
                type = -1
            }
            print(amount)
            viewModel.updateData(date: dateTextField.text, amount: amount, content: desTextField.text, type: type)//업데이트
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
        } else if noti.name == UIResponder.keyboardWillHideNotification {
            self.view.frame.origin.y = .zero
        }
    }
}

extension ListEditViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //replacementString : 방금 입력된 문자 하나 or 붙여넣기 된 문자열
        // return -> 텍스트가 바뀌어야하면 true, 아니면 false
        //이 메소드 내에서 textField.text는 현재 입력된 string이 붙기 전의 string
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        if let removeAllSeprator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: ""){
            var beforeFormattedString = removeAllSeprator + string
            if formatter.number(from: string) != nil{
                if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                    textField.text = formattedString
                    amount = Int(formattedNumber)
                    return false
                }
            }else{ // 숫자가 아닐 때
                if string == "" { //백스페이스일 때
                    let lastIndex = beforeFormattedString.index(beforeFormattedString.endIndex, offsetBy: -1)
                    beforeFormattedString = String(beforeFormattedString[..<lastIndex])
                    if let formattedNumber = formatter.number(from: beforeFormattedString), let formattedString = formatter.string(from: formattedNumber){
                        textField.text = formattedString
                        amount = Int(formattedNumber)
                        return false
                    }
                }else{ //문자일 때
                    return false
                }
            }
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.yellow.cgColor
    }
}
