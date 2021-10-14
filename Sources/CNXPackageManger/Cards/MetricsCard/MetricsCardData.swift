//
//  MetricsCardData.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 02/09/21.
//

import Foundation
import SwiftUI

public struct MetricsCardData {
    
    var title1: String
    var title2: String
    var title3: String
    var rightArrowIcon: Image
    var bgColor: Color
    
    public init(title1: String, title2: String, title3: String, rightArrowIcon: Image, bgColor: Color) {
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.rightArrowIcon = rightArrowIcon
        self.bgColor = bgColor
    }
}

