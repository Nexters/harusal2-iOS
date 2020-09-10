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
        addDeleteButton()
        updateUI()
    }
    
    func addDeleteButton(){
        let btn = UIBarButtonItem(image: UIImage(named: "icn_list delete_24"), style: .plain, target: self, action: #selector(self.tappedDelete))
        self.navigationItem.rightBarButtonItem = btn
    }
    
    @objc func tappedDelete(){
        viewModel.deleteBreakDown()
        self.navigationController?.popViewController(animated: true)
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
            
            dateLabel.text = Converter.shared.convertDate(breakDown.date)
            moneyLabel.text = "\(breakDown.amount)"
            desLabel.text = breakDown.content
        } else {
            return
        }
    }

}
