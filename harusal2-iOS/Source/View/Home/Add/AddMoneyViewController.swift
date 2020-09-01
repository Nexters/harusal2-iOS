//
//  AddViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/28.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class AddMoneyViewController: BaseViewController {
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonBottom: NSLayoutConstraint!
    
    //금액을 입력하지 않았을 때
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        moneyTextField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func setConstraints() {
        
        moneyTextField.delegate = self
        moneyTextField.tintColor = UIColor.clear//커서 색 투명
        
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: UIControl.State.selected)//세그먼트 Text Color 변경
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], for: UIControl.State.normal)
        segment.backgroundColor = .white
        segment.layer.borderColor = UIColor.gray.cgColor
        
    }
    @IBAction func tappedNextButton(_ sender: Any) {
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let addRecordVC = storyBoard.instantiateViewController(identifier: "AddRecordViewController") as? AddRecordViewController else{
                return
            }
            
            
            
            if let text = self.moneyTextField.text{
                addRecordVC.viewModel.money = text
                
                switch segment.selectedSegmentIndex {
                case 0:
                    addRecordVC.viewModel.type = 0
                case 1:
                    addRecordVC.viewModel.type = 1
                default:
                    addRecordVC.viewModel.type = -1
                }
            }else{
                return
            }
            
            navi.pushViewController(addRecordVC, animated: true)
        }else{
            return
        }
    }
    
}

extension AddMoneyViewController{
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if noti.name == UIResponder.keyboardWillShowNotification{
            let keyboardHeight = keyboardFrame.height
            let safeInsets = self.view.safeAreaInsets.bottom
            self.nextButtonBottom.constant = keyboardHeight - safeInsets // nextButtonBottom Constraint constant 변경
        } else if noti.name == UIResponder.keyboardWillHideNotification {
            self.nextButtonBottom.constant = .zero
        }
    }
}
