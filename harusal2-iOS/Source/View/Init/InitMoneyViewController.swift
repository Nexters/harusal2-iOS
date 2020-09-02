//
//  InitMoneyViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitMoneyViewController: UIViewController {
    
    @IBOutlet weak var monthBudgetText : UITextField!
    @IBOutlet weak var budgetPerDayLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    let monthDay = MonthDay()
    var money: Int = 0
    
    @IBOutlet weak var doneButtonBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBlack()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
               
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.monthBudgetText.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.monthBudgetText.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        if self.monthBudgetText.text == ""{
            self.showToast(vc: self, msg: "금액을 입력해주세요.", sec: 2.0)
        }
        else{
            if let navi = self.navigationController, let storyBoard = self.storyboard{
                guard let dayVC = storyBoard.instantiateViewController(identifier: "InitDayViewController") as? InitDayViewController else{
                    return
                }
                dayVC.viewModel.budget?.money = self.money
                navi.pushViewController(dayVC, animated: true)
            }else{
                return
            }
        }
    }
    
    @IBAction func tappedCloseButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigation") else{
            return
        }
        
        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
        
//        self.showToast(vc: self, msg: "hello", sec: 2.0)
        self.popLeft(from: snapshot, to: vc, toastMessage: "나중에 예산을 작성해주세요.", sec: 1.0)
    }
}
extension InitMoneyViewController {
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // 키보드 높이에 따른 인풋뷰 위치 변경
        
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        if noti.name == UIResponder.keyboardWillShowNotification{
            let keyboardHeight = keyboardFrame.height
            let safeInsets = self.view.safeAreaInsets.bottom
            self.doneButtonBottom.constant = keyboardHeight - safeInsets
        } else if noti.name == UIResponder.keyboardWillHideNotification {
            self.doneButtonBottom.constant = .zero
        }
    }
}
