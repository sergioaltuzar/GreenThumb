//
//  String+Extensions.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 20/06/25.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
