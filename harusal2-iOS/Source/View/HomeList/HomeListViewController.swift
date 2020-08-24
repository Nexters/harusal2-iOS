//
//  HomeListViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class HomeListViewController: BaseViewController{
    
    

    @IBOutlet weak var dayTV : UITableView!
    var viewModel: HomeListViewModel = HomeListViewModel()
   
    // CVCell의 하단버튼 누르면 펼쳐보기 Animation
    // 펼쳐보기 내의 List의 Cell 누르면 수정화면으로 넘어가기
    // 수정화면으로 넘어가면서 해당 Data 전달
    // dayCV 아래로 내리면 맨위로 보내는 Floating Button 생성
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.dayTV.rowHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
    }
    
    override func setConstraints() {
        
        self.dayTV.rowHeight = 180
    }
    
    
    override func onBind() {
        
//        viewModel.dayList.asObservable()
//            .bind(to: dayTV.rx.items) { tableView, index, data in //RxCocoa를 이용해서 Emit 된 [Money]를 dayTV.items 에 바인딩
//                let cell = self.dayTV.dequeueReusableCell(withIdentifier: "cell") as! DayTVCell
//                cell.dayLabel.text = String(data.day)
//                cell.totalExpenseLabel.text = String(data.expense)
//                cell.totalIncomeLabel.text = String(data.income)
//                return cell
//        }.disposed(by: disposeBag)
        
    }

}


