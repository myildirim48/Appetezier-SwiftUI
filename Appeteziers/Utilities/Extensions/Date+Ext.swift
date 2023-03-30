//
//  Date+Ext.swift
//  Appeteziers
//
//  Created by YILDIRIM on 30.03.2023.
//

import Foundation
extension Date{
    var eighteenYearAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
