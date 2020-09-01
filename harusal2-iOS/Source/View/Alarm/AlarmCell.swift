//
//  AlarmCell.swift
//  harusal2-iOS
//
//  Created by 유채은 on 2020/09/01.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
import UIKit


class AlarmCell: UITableViewCell {
    @IBOutlet weak var tableItemTimeLabel: UILabel!
    @IBOutlet weak var tableItemSwitch: UISwitch!
    
    //스위치가 변화되었을 떄 DB에 저장 -> 알람을 위한 설정을 변경해야함
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //DB에서 불러오기
        self.tableItemSwitch.isOn = false
    }
    
}
