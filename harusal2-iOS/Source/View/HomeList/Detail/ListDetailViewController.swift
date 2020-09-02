//
//  ListDetailViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/15.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class ListDetailViewController: BaseViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    let viewModel = ListDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBlack()
        updateUI()
    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        if let storyBoard = self.storyboard, let navi = self.navigationController {
            guard let listEditVC = storyBoard.instantiateViewController(withIdentifier: "ListEditViewController") as? ListEditViewController else{
                    return
                }
            //전달할 변수
            listEditVC.viewModel.breakDown = self.viewModel.breakDown
                           
            navi.pushViewController(listEditVC, animated: true)
        } else {
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }

    func updateUI(){
        if let breakDown = viewModel.breakDown {
            
            dateLabel.text = breakDown.date
            moneyLabel.text = "\(breakDown.amount)"
            desLabel.text = breakDown.content
        } else {
            return
        }
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
