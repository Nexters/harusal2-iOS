//
//  HomeViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/07/31.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var animationView: AnimationView!
    private var animation : AnimationView?
    @IBOutlet weak var menuBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var receiptBarButtonItem : UIBarButtonItem!
    @IBOutlet weak var todayMoneyDescriptionLabel : UILabel!
    @IBOutlet weak var todayMoneyLabel : UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var todayDateSubLabel: UILabel!
    //    @IBOutlet weak var slideMenuView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var breakDownTV: UITableView!
    
    @IBOutlet weak var moneyTop: NSLayoutConstraint!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerViewTop: NSLayoutConstraint!
    @IBOutlet weak var todayMoneyLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    //    @IBOutlet weak var slideMenuCenterX: NSLayoutConstraint!
    var str : String = ""
    let headerViewMaxHeight: CGFloat = 280
    let headerViewMinHeight: CGFloat = 140
    let headerViewTopMax: CGFloat = 40
    
    let minX : CGFloat = 0
    let maxX : CGFloat = 100
    let todayMoneyLabelMinX: CGFloat = -100
    let todayMoneyLabelMaxX: CGFloat = 0
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateHeaderUI = { (todayMoney: String, todayBreakDown: String) -> Void in
            self.todayMoneyLabel.text = todayBreakDown
            self.todayMoneyDescriptionLabel.text = "오늘의 생활비 \(todayMoney)"
        }
        todayDateLabel.text = "\(Converter.shared.convertDate(Date()))"
        breakDownTV.delegate = self
        breakDownTV.dataSource = self
        self.breakDownTV.separatorStyle = .none
        todayMoneyDescriptionLabel.roundView(by: 50)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animation?.removeFromSuperview()
        viewModel.getTodayData {
            self.breakDownTV.reloadData()
        }
        viewModel.getLatestBudget()
        
        str = viewModel.getMode()
        setColor()
        startLottie()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func changeTextColor(color: UIColor){
        if color == UIColor(named: "NormalMain"){
            todayDateLabel.textColor = UIColor(named: "NormalText")
            todayMoneyLabel.textColor = UIColor(named: "NormalText")
            todayMoneyDescriptionLabel.textColor = UIColor(named: "NormalText")
            todayDateSubLabel.textColor = UIColor(named: "NormalText")
        }else{
            todayDateLabel.textColor = UIColor.white
            todayMoneyLabel.textColor = UIColor.white
            todayMoneyDescriptionLabel.textColor = UIColor.white
            todayDateSubLabel.textColor = UIColor.white
        }
    }
    
    func startLottie(){
        animation = AnimationView(name: "\(str)")
        animation?.contentMode = .scaleAspectFit
        if let ani = self.animation{
            self.animationView.addSubview(ani)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                ani.play()
            })
            
        }else{
            return
        }
       
        
    }
    
    func setColor(){
        var mainColor : UIColor
        var bgColor : UIColor
        
        mainColor = UIColor(named: "\(str)Main") ?? UIColor.white
        bgColor = UIColor(named: "\(str)Background") ?? UIColor.white
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = mainColor
        self.view.backgroundColor = mainColor
        self.topView.backgroundColor = mainColor
        self.breakDownTV.backgroundColor = mainColor
        self.todayMoneyDescriptionLabel.backgroundColor = bgColor
        
        
        changeTextColor(color: mainColor)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.breakDownList.count == 0 {
            tableView.setHomeEmptyView(width: tableView.frame.width, height: tableView.frame.height, color: UIColor(named: "\(str)Main") ?? UIColor.white)
            return 0
        }else{
            tableView.backgroundView = nil
            return viewModel.breakDownList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //각 Cell을 어떻게 보여줄 것인가?
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "BreakDownCell") as? BreakDownCell else {
            return UITableViewCell()
        }
        cell.roundView(by: 30)
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor(named: "\(str)Main")?.cgColor
        
        let breakDown = viewModel.breakDownList[indexPath.row]
        //UI Update
        cell.update(breakDown)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Cell을 선택했을 때
        if let navi = self.navigationController, let storyBoard = self.storyboard {
            guard let listDetailVC = storyBoard.instantiateViewController(identifier: "ListDetailViewController") as? ListDetailViewController else{
                            return
            }
            //전달할 변수
            listDetailVC.viewModel.breakDown = self.viewModel.breakDownList[indexPath.row]
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            navi.pushViewController(listDetailVC, animated: true)
        } else {
            return
        }
        
    }
    
    @IBAction func tappedMenuBarButton(_ sender: Any) {
//        self.navigationController?.isNavigationBarHidden = true
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuNavigation") else{ return }

        guard let snapshot = self.view.window?.snapshotView(afterScreenUpdates: true)
            else { return }
        
        self.slideLeft(from: snapshot, to: vc)
//        self.performSegue(withIdentifier: "slideMenu", sender: self)
    }

    @IBAction func tappedReceiptButton(_ sender: Any) {
        if let navi = self.navigationController, let storyBoard = self.storyboard {
            guard let homeListVC = storyBoard.instantiateViewController(identifier: "HomeListViewController") as? HomeListViewController else {
                return
            }
            
//            homeListVC.viewModel.breakDownList = self.viewModel.breakDownList
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            navi.pushViewController(homeListVC, animated: true)
            
            
        }else{
            
        }
    }
    @IBAction func tappedAddButton(_ sender: Any) {
        
        if let navi = self.navigationController, let storyBoard = self.storyboard{
            guard let addVC = storyBoard.instantiateViewController(identifier: "AddMoneyViewController") as? AddMoneyViewController else {
                return
            }
            
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            navi.pushViewController(addVC, animated: true)
            
        }
        
    }
}


