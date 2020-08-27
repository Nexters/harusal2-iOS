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
    
    var firstCellSize = CGFloat(230)
    
    var viewModel: HomeListViewModel = HomeListViewModel()
   
    // CVCell의 하단버튼 누르면 펼쳐보기 Animation
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
            self.firstCellSize += 100
            self.firstCV.reloadData()
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
        return CGSize(width: collectionView.bounds.size.width, height: self.firstCellSize)
    }
    
}




