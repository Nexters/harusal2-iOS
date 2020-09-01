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
    @IBOutlet weak var todayDateLabel: UILabel!
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
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayDateLabel.text = "오늘의 소비 | \(Converter.shared.convertDate(Date()))"
        breakDownTV.delegate = self
        breakDownTV.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getMonthData{
            self.breakDownTV.reloadData()
        }
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
//        self.navigationController?.isNavigationBarHidden = true
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuNavigation") else{
                    return
                }

                guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true) else { return }
//                vc.view.addSubview(snapshot)
//                self.view.window?.rootViewController = vc
//
//                UIView.animate(withDuration: 0.3, animations: {
//                    snapshot.transform = CGAffineTransform(translationX: -500, y: 0)
//        //            3D 애니메이션
//        //            snapshot.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
//                }, completion: { finish in
//                    snapshot.removeFromSuperview()
//                })
        self.slideLeft(from: snapshot, to: vc)
        
        
//        self.performSegue(withIdentifier: "slideMenu", sender: self)
    }

    @IBAction func tappedReceiptButton(_ sender: Any) {
        if let navi = self.navigationController, let storyBoard = self.storyboard {
            guard let homeListVC = storyBoard.instantiateViewController(identifier: "HomeListViewController") as? HomeListViewController else {
                return
            }
            
            homeListVC.viewModel.breakDownList = self.viewModel.breakDownList
            navi.pushViewController(homeListVC, animated: true)
            
            
        }else{
            
        }
    }
    @IBAction func tappedAddButton(_ sender: Any) {
        
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let addVC = storyBoard.instantiateViewController(identifier: "AddMoneyViewController") as? AddMoneyViewController else {
                return
            }
            
            navi.pushViewController(addVC, animated: true)
            
        }
        
    }
}
