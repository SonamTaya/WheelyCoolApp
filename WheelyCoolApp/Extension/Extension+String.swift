//
//  Extension+String.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 17/2/22.
//

import Foundation

extension String {
    var isEmptyString: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
