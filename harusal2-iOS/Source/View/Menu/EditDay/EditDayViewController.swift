//
//  EditDayViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class EditDayViewController: UIViewController {
    
    let viewModel = EditDayViewModel()
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var dayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayView.roundView(by: 50)

        
        setTextView()
        
    }
    
    func setTextView(){
        let attributedStr = NSMutableAttributedString(string: viewModel.textViewString, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        var range = NSRange(location: 0, length: viewModel.textViewString.count)
        var rangeArr = [NSRange]()
        
        while(range.location != NSNotFound){
            range = (viewModel.textViewString as NSString).range(of: "\(viewModel.today)", options: .caseInsensitive, range: range)
            
            rangeArr.append(range)
            if(range.location != NSNotFound){
                range = NSRange(location: range.location + range.length, length: viewModel.textViewString.count - (range.location + range.length))
            }
        }
        
        rangeArr.forEach { (range) in
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.boldSystemFont(ofSize: 20), range: range)
        }
        dayTextView.attributedText = attributedStr
        dayTextView.textAlignment = .center
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func tappedBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func tappedDone(_ sender: Any) {
        viewModel.setStartDate(date: Date())
        viewModel.setBudget()
        self.dismiss(animated: false, completion: nil)
    }
    
}
