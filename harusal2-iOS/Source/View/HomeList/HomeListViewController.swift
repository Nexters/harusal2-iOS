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
    
    // CVCell의 하단버튼 누르면 펼쳐보기 -> OK
    // Animation
    // 펼쳐보기 내의 List의 Cell 누르면 수정화면으로 넘어가기
    // 수정화면으로 넘어가면서 해당 Data 전달
    // dayCV 아래로 내리면 맨위로 보내는 Floating Button 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCV.dataSource = self
        firstCV.delegate = self
    }
}

extension HomeListViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //오늘 날짜가 21일 21개
        return 2
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.expandFromFirstCollectionViewHandler = {() -> Void in
            
//          SecondCollectionViewCell 갯수 * 크기 만큼
            
            //다른 Cell들을 클릭했을 때를 위해 초기화
            self.nowExpandCellSize = self.firstCellSize
            //클릭한 FirstCollectionViewCell Num 가져오기
            self.nowExpandCellNum = indexPath.item //indexPath.item --> 날짜
            
//            해당 날짜에 있는 데이터 갯수 * 65 만큼 nowExpandCellSize 증가
            self.nowExpandCellSize += 65
            
//            self.firstCV.reloadData() 데이터를 리로드하기보다는 layout만 건드리는 것으로 변경

//            애니메이션 처리 -> OK
//            CollectionView Cell 의 애니메이션은 performBatchUpdates로 해결
//            TableView의 CEll은 tableview.beginUpdates(), tableview.endUpdates() 로 해결 가능?
            collectionView.performBatchUpdates({
                collectionView.collectionViewLayout.invalidateLayout()
            }, completion: nil)
            
        }
        
        //UI Update
        
        return cell
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FirstHeaderView", for: indexPath) as? FirstHeaderView else {
                    return UICollectionReusableView()
                }
                
                return header
            default:
                return UICollectionReusableView()
        
        }
    }
}

extension HomeListViewController: UICollectionViewDelegateFlowLayout{
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == self.nowExpandCellNum{
            return CGSize(width: collectionView.bounds.size.width, height: self.nowExpandCellSize)
        }else{
            return CGSize(width: collectionView.bounds.size.width, height: collectionView.cellForItem(at: indexPath)?.frame.height ?? self.firstCellSize)
        }
        
    }
    
}




