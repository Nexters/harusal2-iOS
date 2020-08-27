//
//  HomeListViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class HomeListViewController: BaseViewController{
    
    

    @IBOutlet weak var firstCV : UICollectionView!
    var viewModel: HomeListViewModel = HomeListViewModel()
   
    // CVCell의 하단버튼 누르면 펼쳐보기 Animation
    // 펼쳐보기 내의 List의 Cell 누르면 수정화면으로 넘어가기
    // 수정화면으로 넘어가면서 해당 Data 전달
    // dayCV 아래로 내리면 맨위로 보내는 Floating Button 생성
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.dayTV.rowHeight = UITableView.automaticDimension
        firstCV.dataSource = self
        firstCV.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func setConstraints() {
        
        
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

extension HomeListViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //UI Update
        
        return cell
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            // TODO: 헤더 구성하기
//
//            guard let item = trackManager.todaysTrack else {
//                return UICollectionReusableView()
//            }
            //SupplementaryView -> 헤더 or 푸터
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FirstHeaderView", for: indexPath) as? FirstHeaderView else {
                return UICollectionReusableView()
            }
            
//            header.update(with: item)
//            header.tapHandler = {item -> Void in
//                //Player를 띄운다
//                let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil) // 스토리보드 가져오기
//                guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else{
//                    return
//                }
//                playerVC.simplePlayer.replaceCurrentItem(with: item)
//                self.present(playerVC, animated: true, completion: nil)
//            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeListViewController: UICollectionViewDelegateFlowLayout{
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 363)
    }
    
}




