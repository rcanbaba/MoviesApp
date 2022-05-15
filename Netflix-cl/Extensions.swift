//
//  Extensions.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 14.05.2022.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.dropFirst().lowercased()
    }
}
