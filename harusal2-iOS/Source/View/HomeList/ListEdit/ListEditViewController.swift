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
    @IBOutlet weak var desTextView: UITextView!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet weak var doneButtonBottom: NSLayoutConstraint!
    let datePicker = UIDatePicker()
    var amount = 0
    var isEditingTextView = false
    let viewModel = ListEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        self.setNavigationBlack()
        print("aa\(self.view.frame.origin.y)")
        
        NotificationCenter.default.addObserver(self, selector: #selector(didShow), name: UIResponder.keyboardDidShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(willHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        moneyTextField.delegate = self
        desTextView.delegate = self
        
        updateUI()
        
        viewModel.dateChanged = { self.dateTextField.text = $0 }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func updateUI(){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let breakDown = viewModel.breakDown {
            amount = breakDown.amount
            dateTextField.text = breakDown.date
            moneyTextField.text = numberFormatter.string(from: NSNumber(value: breakDown.amount))
            desTextView.text = breakDown.content
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
        self.view.endEditing(true)
        isEditingTextView = false
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
        viewModel.date = Converter.shared.convertDate(datePicker.date)
        self.desTextView.resignFirstResponder()
    }
    
    @IBAction func tappedSelectDateButton(_ sender: Any) {
        self.dateTextField.becomeFirstResponder()
    }
    
    @IBAction func saveInfo(_ sender: Any) {
        if let navi = self.navigationController {
            switch segment.selectedSegmentIndex {
            case 0:
                viewModel.type = 0
            case 1:
                viewModel.type = 1
            default:
                viewModel.type = -1
            }
            viewModel.content = desTextView.text ?? ""
            viewModel.money = moneyTextField.text ?? ""
            
            viewModel.updateData()//업데이트
            
            navi.popViewController(animated: true)
        }else{
            return
        }
    }
    

    override func setConstraints() {
        moneyTextField.keyboardType = .numberPad
        desTextView.addDoneButtonOnDesKeyboard()
        moneyTextField.addDoneButtonOnDesKeyboard()
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: UIControl.State.normal)//세그먼트 Text Color 변경
        dateView.roundView(by: 100)
        dateView.setBorder(thick: CGFloat(1), color: UIColor.black.cgColor)
        desTextView.layer.borderWidth = 1
        desTextView.layer.borderColor = UIColor.gray.cgColor
    }
    

}

extension ListEditViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            //TextView가 포커스를 얻었을 때
            isEditingTextView = true
        print("yes")
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            print("55")
            isEditingTextView = false
            let fixedWidth = textView.frame.size.width
            let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            
            if newSize.height > 87{
                self.textViewHeight.constant = 87
            }
            else if textView.frame.height < 80 {
                //1줄 높이일 때만 증가를 시킨다
                self.textViewHeight.constant = newSize.height
            }
    //        viewModel.content = textView.text
    print("66")
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            //TextView가 포커스를 잃었을 때
            isEditingTextView = false
        }
    
}

extension ListEditViewController {
    @objc private func didShow(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if isEditingTextView == true{
            isEditingTextView = false
            let keyboardHeight = keyboardFrame.height
            let safeInset = self.view.safeAreaInsets.bottom
            
            self.view.bounds.origin.y += (keyboardHeight - safeInset)
            
            
        }
    }
    
    @objc private func willHide(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        
        self.view.bounds.origin.y = .zero
        
        
    }
    
}
