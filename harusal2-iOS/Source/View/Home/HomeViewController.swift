//
//  HomeViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var menuBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var receiptBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var todayMoneyDescriptionLabel : UILabel!
    @IBOutlet weak var todayMoneyLabel : UILabel!
//    @IBOutlet weak var slideMenuView: UIView!
    
    @IBOutlet weak var breakDownTV: UITableView!
    
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var todayMoneyLabelCenterX: NSLayoutConstraint!
//    @IBOutlet weak var slideMenuCenterX: NSLayoutConstraint!
    
    let headerViewMaxHeight: CGFloat = 280
    let headerViewMinHeight: CGFloat = 140
    let imageViewMaxHeight: CGFloat = 130
    let imageViewMinHeight: CGFloat = 0
    let todayMoneyLabelMinX: CGFloat = -80
    let todayMoneyLabelMaxX: CGFloat = 0
//    var slideMenuMaxX : CGFloat!
//    var slideMenuMinX : CGFloat!
    
    let viewModel = HomeViewModel()
//    let disposeBag = DisposeBag()
    
//    func prepareAnimation(){
//        slideMenuCenterX.constant = slideMenuMinX
//    }
    
//    func openSlideMenu(){
//        slideMenuCenterX.constant = slideMenuMaxX
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
//    }
    
//    func closeSlideMenu(){
//        slideMenuCenterX.constant = slideMenuMinX
//        view.layoutIfNeeded()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakDownTV.delegate = self
        breakDownTV.dataSource = self
        viewModel.getAllData{
            self.breakDownTV.reloadData()
        }
//        breakDownTV.rx.setDelegate(self)
//        .disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setConstraints() {
        self.view.backgroundColor = .orange
        breakDownTV.backgroundColor = .orange
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.breakDownList.count)
        return viewModel.breakDownList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "BreakDownCell") as? BreakDownCell else {
            return UITableViewCell()
        }
        cell.roundView(by: 50)
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.orange.cgColor
        
        let breakDown = viewModel.breakDownList[indexPath.row]
        //UI Update
        cell.update(breakDown)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navi = self.navigationController, let storyBoard = self.storyboard {
            guard let listDetailVC = storyBoard.instantiateViewController(identifier: "ListDetailViewController") as? ListDetailViewController else{
                            return
            }
            //전달할 변수
            listDetailVC.viewModel.breakDown = self.viewModel.breakDownList[indexPath.row]
            navi.pushViewController(listDetailVC, animated: true)
        } else {
            return
        }
        
    }
    
    @IBAction func tappedMenuBarButton(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        self.performSegue(withIdentifier: "slideMenu", sender: self)
    }

}
