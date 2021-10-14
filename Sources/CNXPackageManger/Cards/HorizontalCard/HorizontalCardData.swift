//
//  HorizontalCardData.swift
//  CNXUIKit
//
//  Created by VeeraSubhash on 24/08/21.
//

import Foundation
import SwiftUI

public enum ClickableCardType {
    case none
    case arrow
    case toggle
    case checkbox
}

public struct HorizontalCardData {
    var leftIcon: Image?
    var title: String
//    var subTitle: String?
    var clickableCardType: ClickableCardType?
    
    public init(leftIcon: Image?, title: String, clickableButtonType: ClickableCardType? = Optional.none) {
        self.leftIcon = leftIcon
        self.title = title
//        self.subTitle = subTitle
        self.clickableCardType = clickableButtonType
    }
}
