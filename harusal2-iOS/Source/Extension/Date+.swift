//
//  Date+.swift
//  harusal2-iOS
//
//  Created by 지현우 on 2020/08/29.
//  Copyright © 2020 nexters. All rights reserved.
//

import Foundation
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
