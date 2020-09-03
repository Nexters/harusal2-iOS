//
//  FirstCVCell.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/24.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var secondCV: UICollectionView!
    
    var cellCount = 0 // SecondCV의 보여질 Cell의 개수 -> ViewModel의 List는 모든 데이터를 갖고 있으므로 따로 선언
    var expandFromFirstCollectionViewHandler : (() -> Void)?
    var contractFromFirstCollectionViewHandler : (() -> Void)?
    var isTodayCellHandler: (() -> Bool)?
    var selectedSecondCell: (() -> Void)?
    var firstReload: (() -> Void)?
    let viewModel : FirstCellViewModel = FirstCellViewModel()
    var resizeHandler: (() -> Void)?
    var firstFooterFlag = true
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstFooterFlag = true
        secondCV.dataSource = self
        secondCV.delegate = self
        secondCV.roundView(by: 50)
        secondCV.reloadData()
        
    }
}

//Second Item이 2개 이상일 때 First Cell 크기 조절해야함

extension FirstCollectionViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if self.viewModel.dayList.count > 0{
            cell.updateUI(self.viewModel.dayList[indexPath.item])
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SecondHeaderView", for: indexPath) as? SecondHeaderView else {
                    return UICollectionReusableView()
                }
                //HomeListViewController에서 self.cell.secondCV.reloadData()를 하기 때문에
                //이곳 Flow를 진행
                header.updateUI(data: viewModel.headerData)
                
                return header
            
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SecondFooterView", for: indexPath) as? SecondFooterView else {
                    return UICollectionReusableView()
                }
                
                if self.isTodayCellHandler?() == true && self.firstFooterFlag{
                    //첫 Cell만 Expand 버튼 Up 버튼으로
                    DispatchQueue.main.async {
                        footer.expandButton.setImage(UIImage(named: "btn_dropup_24"), for: .normal)
                        self.firstFooterFlag = false
                    }
                }
                
                if self.viewModel.dayList.count > 0{
                    //데이터가 있을 때만 Footer Handler 초기화
                    footer.expandHandler = { () -> Void in
                        self.cellCount = self.viewModel.dayList.count
                        self.expandFromFirstCollectionViewHandler?()
                        self.secondCV.reloadData()
                    }
                    footer.contractHandler = { () -> Void in
                        self.cellCount = 0
                        self.contractFromFirstCollectionViewHandler?()
                        self.secondCV.reloadData()
                    }
                }else{
                    footer.expandHandler = nil
                    footer.contractHandler = nil
                }
                //여기서 헤더와 푸터의 크기를 설정하니 -> 보이기가 이상함...
                //Cell의 갯수를 0으로 해도 헤더와 푸터가 붙지않고 사이에 공간이 남는 현상 생김
//                footer.frame.size.width = collectionView.bounds.size.width
//                footer.frame.size.height = 65
                
                return footer
            
            default:
                return UICollectionReusableView()
        }
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedSecondCell?()
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegateFlowLayout{
    
    //cell Size 65
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 65)
        
    }
    
    //Header Size 100
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 100)
    }
    
    //Footer Size 65
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 65)
    }
    
}
    

