//
//  HomeListViewController.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/03.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class HomeListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellIdentifier = "dayCell"
    let firstCellIdentifier = "firstCell"
    @IBOutlet weak var dayCV : UICollectionView!
    var dayList : [Money] = []
   
    func setDummyData(){
        dayList.append(Money(day: 1, income: 1, expense: 1))
        dayList.append(Money(day: 2, income: 2, expense: 2))
        dayList.append(Money(day: 3, income: 3, expense: 3))
        print(dayList.count)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 170)
        
        self.dayCV.collectionViewLayout = flowLayout
        
        self.setDummyData()
        
        self.dayCV.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dayList.count + 1 // firstCell 때문에 + 1
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if indexPath.row == 0{
            let cell : FirstCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.firstCellIdentifier, for: indexPath) as! FirstCollectionViewCell
            
            //날짜, 예산, 이미지 아이콘 등록
            return cell
        }
        else{
            let cell: DayCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! DayCVCell
            
            let dayData: Money = self.dayList[indexPath.row - 1] // firstCell 이 0을 차지하므로 - 1
            
            cell.dayLabel?.text = String(dayData.day)
            cell.totalExpenseLabel?.text = "\(dayData.expense)원"
            cell.totalIncomeLabel?.text = "\(dayData.income)원"
            
            print("\(indexPath.row)")
            
            return cell
        }
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
