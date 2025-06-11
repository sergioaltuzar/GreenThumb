//
//  Date+Extensions.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import Foundation

extension Date {
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
}
