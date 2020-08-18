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
import RealmSwift

class HomeViewController: BaseViewController{
    
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
    let disposeBag = DisposeBag()
    
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
        breakDownTV.rx.setDelegate(self)
        .disposed(by: disposeBag)
        
        let formatter = Converter()
//        print("asd\(formatter.convertDate(Date()))")
        let data :BreakDown = BreakDown()
        data.id = data.autoIncrementKey()
        data.amount = 100
        data.date = formatter.convertDate(Date())
        data.content = "zzz"
        data.type = 1
        let data2 :BreakDown = BreakDown()
        data2.id = data2.autoIncrementKey()
        data2.amount = 100
        data2.date = formatter.convertDate(Date())
        data2.content = "zzz"
        data2.type = 2
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(data, update: .all)
            realm.add(data2, update: .all)
        }
        

                

                // Realm파일이 생성되는 위치 출력

        let aa = realm.objects(BreakDown.self)
        print("aa = \(aa)")


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        closeSlideMenu()
//        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func setConstraints() {
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
        
        breakDownTV.rx.itemSelected.subscribe(onNext: { indexPath in
            if let navi = self.navigationController, let storyBoard = self.storyboard {
                let listDetailVC = storyBoard.instantiateViewController(identifier: "ListDetailViewController")
                navi.pushViewController(listDetailVC, animated: true)
            } else {
                return
            }
        }).disposed(by: disposeBag)
        
        menuBarButtonItem.rx.tap
            .subscribe( onNext:
                {
//                    self.navigationController?.isNavigationBarHidden = true
//                    self.openSlideMenu()
//                    let slideMenu = self.storyboard?.instantiateViewController(withIdentifier: "slideMenu")
//                    if let menu = slideMenu{
//                        self.present(menu, animated: true, completion: nil)
//                    } else{
//                        return
//                    }
                    self.performSegue(withIdentifier: "slideMenu", sender: self)
                })
            .disposed(by: disposeBag)
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
