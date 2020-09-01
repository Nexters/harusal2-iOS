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
    
    var firstCellSize = CGFloat(230) // 처음 Cell Size
    var nowExpandCellSize = CGFloat(230) // 현재 Expand 버튼이 눌린 Cell에 설정할 크기
    var nowExpandCellNum = 0 // 현재 Expand 버튼이 눌린 Cell 번호
    var viewModel: HomeListViewModel = HomeListViewModel()
    var day = 0
    var expandDic : [Int : CGFloat] = [:]
    
    // CVCell의 하단버튼 누르면 펼쳐보기 -> OK
    // Animation
    // 펼쳐보기 내의 List의 Cell 누르면 수정화면으로 넘어가기
    // 수정화면으로 넘어가면서 해당 Data 전달
    // dayCV 아래로 내리면 맨위로 보내는 Floating Button 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let zeroCellSize : CGFloat = firstCellSize + CGFloat(65 * viewModel.getDailyData(day: viewModel.today).count)
        expandDic[0] = zeroCellSize
        firstCV.dataSource = self
        firstCV.delegate = self
        
    }
}

extension HomeListViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //오늘 날짜가 21일 21개
        return 31
//        return self.viewModel.today
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //Cell Reuse될 때 초기화 -> 초기화 안했을 시 cell에 남아있던 cellCount 때문에 SecondCV의 Cell이 생김
        cell.cellCount = 0
        //SecondCV의 HeaderView 데이터 입력
        cell.viewModel.headerData = (viewModel.today - indexPath.item,
                                     viewModel.getDailyOutCome(day: viewModel.today - indexPath.item),
                                     viewModel.getDailyInCome(day: viewModel.today - indexPath.item))
        //SecondCV에 넣은 데이터 입력
        cell.viewModel.dayList = self.viewModel.getDailyData(day: (cell.viewModel.headerData.0))        
        
        if self.expandDic[indexPath.item] != nil{
            // Expand되었던 Cell 저장해서 Reuse되었을 때 복구
            self.nowExpandCellSize = self.firstCellSize + CGFloat(65 * cell.viewModel.dayList.count)
            cell.cellCount = cell.viewModel.dayList.count

            collectionView.performBatchUpdates({
                collectionView.collectionViewLayout.invalidateLayout()
            }, completion: nil)
        }
        
        cell.expandFromFirstCollectionViewHandler = {() -> Void in
                    
        //          SecondCollectionViewCell 갯수 * 크기 만큼
                    
            //다른 Cell들을 클릭했을 때를 위해 초기화
            self.nowExpandCellSize = self.firstCellSize
            //클릭한 FirstCollectionViewCell Num 가져오기
            self.nowExpandCellNum = indexPath.item //indexPath.item --> 날짜
                    
        //            해당 날짜에 있는 데이터 갯수 * 65 만큼 nowExpandCellSize 증가
            self.nowExpandCellSize += CGFloat(65 * (cell.viewModel.dayList.count))
            self.expandDic[self.nowExpandCellNum] = self.nowExpandCellSize
                    
        //            self.firstCV.reloadData() 데이터를 리로드하기보다는 layout만 건드리는 것으로 변경

        //            애니메이션 처리 -> OK
        //            CollectionView Cell 의 애니메이션은 performBatchUpdates로 해결
        //            TableView의 CEll은 tableview.beginUpdates(), tableview.endUpdates() 로 해결 가능?
            collectionView.performBatchUpdates({
                collectionView.collectionViewLayout.invalidateLayout()
            }, completion: nil)
        }
        cell.contractFromFirstCollectionViewHandler = {() -> Void in
            self.nowExpandCellNum = indexPath.item
            self.expandDic[self.nowExpandCellNum] = nil
            collectionView.performBatchUpdates({
                collectionView.collectionViewLayout.invalidateLayout()
            }, completion: nil)
        }
        
        //여기서 Reload하지 않으면 내부 UI(날짜)가 바뀌지 않음
        cell.secondCV.reloadData()
        
        return cell
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FirstHeaderView", for: indexPath) as? FirstHeaderView else {
                    return UICollectionReusableView()
                }
                
                //FirstCV 헤더 updateUI
                
                return header
            default:
                return UICollectionReusableView()
        
        }
    }
}



extension HomeListViewController: UICollectionViewDelegateFlowLayout{
 
    //Cell들이 보이기 직전에 크기 계산을 새로 한다
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if self.expandDic[indexPath.item] != nil{
            
            return CGSize(width: collectionView.bounds.size.width, height: self.expandDic[indexPath.item] ?? self.firstCellSize)
        }else{
            
            return CGSize(width: collectionView.bounds.size.width, height: self.firstCellSize)
        }
        
    }
    
}




