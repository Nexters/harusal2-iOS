//
//  ListEditViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListEditViewController: BaseViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var desTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        desTextField.addDoneButtonOnDesKeyboard()
        moneyTextField.addDoneButtonOnDesKeyboard()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func onBind() {
        
        hideKeyboard()
        showKeyboard()
        saveInfo()
        
       
    }
    
    private func saveInfo(){
        saveButton.rx.tap
            .subscribe(onNext: {
                //정보 저장
                if let navi = self.navigationController {
                    navi.popViewController(animated: true)
                }else{
                    return
                }
            }).disposed(by: disposeBag)
    }
    
    private func hideKeyboard(){
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
        .subscribe(onNext: { notification in
                self.view.frame.origin.y = .zero
            }).disposed(by: disposeBag)
    }
    
    private func showKeyboard(){
        NotificationCenter.default
            .rx
            .notification(UIResponder.keyboardWillShowNotification)
            .subscribe(onNext: { notification in
                    if let keyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
                    self.desTextField.isEditing == true, self.view.frame.origin.y == 0 {
                        let keyboardHeight = keyboard.cgRectValue.height
                        self.view.frame.origin.y -= keyboardHeight/3
                    } else {
                        return
                    }
                }).disposed(by: disposeBag)
    }
    
    override func setConstraints() {
        moneyTextField.keyboardType = .numberPad
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
