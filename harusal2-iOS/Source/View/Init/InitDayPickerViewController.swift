//
//  InitDayPickerViewController.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/08/09.
//  Copyright © 2020 nexters. All rights reserved.
//

import UIKit

class InitDayPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
     private let values: [String] = ["A","B","C","D","E","F","G","H","I"]
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        picker.frame = CGRect(x: 140, y: 100, width: 100.0, height: 480.0)
        
        picker.delegate = self
        picker.delegate = self

        return picker
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.pickerView)
    }
}
