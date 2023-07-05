//
//  UIImage+Extensions.swift
//  Quiz
//
//  Created by Ani Dzamelashvili on 20.06.23.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(assetIdentifier: Constants.AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)!
    }
}
