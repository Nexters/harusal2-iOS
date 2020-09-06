//
//  EditMoneyViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditMoneyViewController: UIViewController {

    @IBOutlet weak var bugetPreDayLabel: UILabel!
    @IBOutlet weak var editMoneyText: UITextField!
    @IBOutlet weak var doneButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "이번 달 생활비 수정"
        self.setNavigationBlack()
        
        editMoneyText.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.editMoneyText.becomeFirstResponder()
    }
    
}

extension EditMoneyViewController{
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if noti.name == UIResponder.keyboardWillShowNotification{
            let keyboardHeight = keyboardFrame.height
            let safeInsets = self.view.safeAreaInsets.bottom
            self.doneButtonBottom.constant = keyboardHeight - safeInsets // nextButtonBottom Constraint constant 변경
        } else if noti.name == UIResponder.keyboardWillHideNotification {
            self.doneButtonBottom.constant = .zero
        }
    }
}
