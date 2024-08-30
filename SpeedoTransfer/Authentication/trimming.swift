//
//  trimming.swift
//  SpeedoTransfer
//
//  Created by Abdullah Silva on 30/08/2024.
//

import Foundation

extension String{
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
