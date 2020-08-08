//
//  HomeViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController{
    
    
    @IBOutlet weak var menuBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var receiptBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var todayMoneyDescriptionLabel : UILabel!
    @IBOutlet weak var todayMoneyLabel : UILabel!
    @IBOutlet weak var addreceiptButton : UIButton!
    
    @IBOutlet weak var breakDownTV: UITableView!
    
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var todayMoneyLabelCenterX: NSLayoutConstraint!
    
    
    let headerViewMaxHeight: CGFloat = 280
    let headerViewMinHeight: CGFloat = 140
    let imageViewMaxHeight: CGFloat = 130
    let imageViewMinHeight: CGFloat = 0
    let todayMoneyLabelMinX: CGFloat = -80
    let todayMoneyLabelMaxX: CGFloat = 0
    
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakDownTV.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func setConstraints() {
        addreceiptButton.roundView(by: 2)
        self.view.backgroundColor = .orange
        breakDownTV.backgroundColor = .orange
        
    }
    
    override func onBind() {
        viewModel.useList.asObservable()
            .bind(to: breakDownTV.rx.items) { tableView, index, data in //RxCocoa를 이용
                if let cell = tableView.dequeueReusableCell(withIdentifier: "BreakDownCell") as? BreakDownCell{
                    cell.update(data)
                    cell.roundView(by: 50)
                    cell.layer.borderWidth = 3
                    cell.layer.borderColor = UIColor.orange.cgColor
                    return cell
                } else{
                   return UITableViewCell()
                }
        }.disposed(by: disposeBag)
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
