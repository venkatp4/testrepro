//
//  ProfileCardData.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 13/09/21.
//

import Foundation
import SwiftUI

public struct ProfileCardData {
    var profileImage: Image?
    var width: CGFloat?
    var height: CGFloat?
    var lineWidth: CGFloat
    var shadowRadius: CGFloat
    var strokeColor: Color
    var cornerRadius: CGFloat
    
    public init(profileImage: Image?, width: CGFloat?, height: CGFloat?, lineWidth: CGFloat, shadowRadius: CGFloat, strokeColor: Color, cornerRadius: CGFloat) {
        self.profileImage = profileImage
        self.width = width
        self.height = height
        self.lineWidth = lineWidth
        self.shadowRadius = shadowRadius
        self.strokeColor = strokeColor
        self.cornerRadius = cornerRadius
    }
}
