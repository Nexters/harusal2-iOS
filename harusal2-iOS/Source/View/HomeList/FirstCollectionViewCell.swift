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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondCV.dataSource = self
        secondCV.delegate = self
    }
    
}

//Second Item이 2개 이상일 때 First Cell 크기 조절해야함

extension FirstCollectionViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SecondHeaderView", for: indexPath) as? SecondHeaderView else {
                    return UICollectionReusableView()
                }
                
                header.frame.size.width = collectionView.bounds.size.width
                
                
                return header
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SecondFooterView", for: indexPath) as? SecondFooterView else {
                    return UICollectionReusableView()
                }
            
                return footer
            default:
                return UICollectionReusableView()
        }
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 100)
        
    }
}
    

