//
//  ListDetailViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ListDetailViewController: BaseViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func onBind() {
        
        editButton.rx.tap
            .subscribe(onNext: {
                if let storyBoard = self.storyboard, let navi = self.navigationController {
                    let listDetailVC = storyBoard.instantiateViewController(withIdentifier: "ListEditViewController")
                    navi.pushViewController(listDetailVC, animated: true)
                } else {
                    return
                }
            }).disposed(by: disposeBag)
        
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
