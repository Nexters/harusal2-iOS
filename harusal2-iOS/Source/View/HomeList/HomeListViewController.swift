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
        return self.dayList.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DayCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! DayCVCell
        
        let dayData: Money = self.dayList[indexPath.item]
        
        cell.dayLabel?.text = String(dayData.day)
        cell.totalExpenseLabel?.text = "\(dayData.expense)원"
        cell.totalIncomeLabel?.text = "\(dayData.income)원"
        
        print("\(dayData.day) , \(dayData.expense) , \(dayData.income)")
        
        return cell
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
