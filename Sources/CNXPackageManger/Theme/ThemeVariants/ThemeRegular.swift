//
//  ThemeRegular.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 20/09/21.
//

import SwiftUI

//PS: Do not add any additional functions to ThemeRegular, unless ThemeProtocol is updated with new functions.

final class ThemeRegular: ThemeProtocol {
    var foreground: Color = {
        return Color.purple
    }()

    lazy var background: Color = {
        return Color.white
    }()

    lazy var shadow: Color = {
        return Color.gray
    }()
    
    var strokeColor: Color = {
        return Color.gray
    }()
    
    var h1HeadLineColor: Color = {
        return Color.gray
    }()

    var h2HeadLineColor: Color = {
        return Color.gray
    }()

    var h3HeadLineColor: Color = {
        return Color.gray
    }()

    var h4HeadLineColor: Color = {
        return Color.gray
    }()

    var h5HeadLineColor: Color = {
        return Color.gray
    }()

    var h6HeadLineColor: Color = {
        return Color.gray
    }()
    
    var titleColor: Color = {
        return Color(hex: "191b1d")
    }()

    var title1Color: Color = {
        return Color.gray
    }()

    var title2Color: Color = {
        return Color.gray
    }()
    
    var title3Color: Color = {
        return Color.gray
    }()

    var subtitleColor: Color = {
        return Color(hex: "414954")
    }()

    var subtitle1Color: Color = {
        return Color.gray
    }()

    var subtitle2Color: Color = {
        return Color.gray
    }()

    var body1Color: Color = {
        return Color.gray
    }()

    var body2Color: Color = {
        return Color.gray
    }()
    
    var infoTextColor: Color = {
        return Color(hex: "1b4887")
    }()

    var buttonColor: Color = {
        return Color.gray
    }()

    var captionColor: Color = {
        return Color.gray
    }()

    var overlineColor: Color = {
        return Color.gray
    }()
    
    var evenCardIconBgColor: Color = {
        return Color(hex: "f0f6ff") // Light Blue
    }()
    
    var oddCardIconBgColor: Color = {
        return Color(hex: "fff5ec") // Light Orange
    }()
    
    var kudosThumbBgColor: Color = {
        return Color(hex: "0a9ca9")
    }()
    
    var imageButtonTextColor: Color = {
        return Color(hex: "333333")
    }()
    
    var imageButtonBgColor: Color = {
        return Color(hex: "f4f6f8")
    }()
    
    var linkColor: Color = {
        return Color.blue
    }()
    

    //TO DO: All the font family names here are just a sample. Update this as per requirement for font
    var h1HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 24) // UIFont(name: "AvenirNext-Regular", size: 24)!
    }()

    var h2HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 22)
    }()

    var h3HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 20)
    }()

    var h4HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 18)
    }()

    var h5HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 16)
    }()

    var h6HeadLine: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 14)
    }()
    
    var title: Font = {
        return Font.custom("Helvetica-Bold", size: 14)
    }()
    
    var title1: Font = {
        return Font.custom("HelveticaNeue-Bold", size: 14)
    }()
    
    var title2: Font = {
        return Font.custom("HelveticaNeue-Bold", size: 14)
    }()
    
    var title3: Font = {
        return Font.custom("HelveticaNeue-Bold", size: 14)
    }()
    
    var subtitle: Font = {
        return Font.custom("Helvetica", size: 12)
    }()

    var subtitle1: Font = {
        return Font.custom("HelveticaNeue-SemiBold", size: 14)
    }()

    var subtitle2: Font = {
        return Font.custom("HelveticaNeue-SemiBold", size: 14)
    }()

    var body1: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 14)
    }()

    var body2: Font = {
        return Font.custom("HelveticaNeue-Regular", size: 14)
    }()

    var infoText: Font = {
        return Font.custom("Helvetica-Bold", size: 12)
    }()
    
    var button: Font = {
        return Font.custom("Helvetica-Bold", size: 10)
    }()

    var caption: Font = {
        return Font.custom("HelveticaNeue-SemiBold", size: 12)
    }()

    var overline: Font = {
        return Font.custom("HelveticaNeue-Bold", size: 10)
    }()
    
    var imageButton: Font = {
        return Font.custom("Helvetica", size: 14)
    }()
}

