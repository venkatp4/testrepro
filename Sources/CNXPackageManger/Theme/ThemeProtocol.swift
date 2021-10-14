//
//  ThemeProtocol.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 20/09/21.
//

import SwiftUI

//Colors required by the application to be defined here
public protocol ThemeColor {

    var background: Color { get }

    var foreground: Color { get }

    var shadow: Color { get }
    
    var strokeColor: Color { get }

    //Add as required.
    var h1HeadLineColor: Color { get }

    var h2HeadLineColor: Color { get }

    var h3HeadLineColor: Color { get }

    var h4HeadLineColor: Color { get }

    var h5HeadLineColor: Color { get }

    var h6HeadLineColor: Color { get }
    
    var titleColor: Color { get }

    var title1Color: Color { get }

    var title2Color: Color { get }
    
    var title3Color: Color { get }

    var subtitleColor: Color { get }

    var subtitle1Color: Color { get }

    var subtitle2Color: Color { get }

    var body1Color: Color { get }

    var body2Color: Color { get }
    
    var infoTextColor: Color { get }

    var buttonColor: Color { get }

    var captionColor: Color { get }

    var overlineColor: Color { get }
    
    var evenCardIconBgColor: Color { get }
    
    var oddCardIconBgColor: Color { get }
    
    var kudosThumbBgColor: Color { get }
    
    var imageButtonTextColor: Color { get }
    
    var imageButtonBgColor: Color { get }
    
    var linkColor: Color { get }
}

public protocol ThemeFont {

    var h1HeadLine: Font { get }

    var h2HeadLine: Font { get }

    var h3HeadLine: Font { get }

    var h4HeadLine: Font { get }

    var h5HeadLine: Font { get }

    var h6HeadLine: Font { get }
    
    var title: Font { get }

    var title1: Font { get }

    var title2: Font { get }
    
    var title3: Font { get }

    var subtitle: Font { get }

    var subtitle1: Font { get }

    var subtitle2: Font { get }

    var body1: Font { get }

    var body2: Font { get }
    
    var infoText: Font { get }

    var button: Font { get }

    var caption: Font { get }

    var overline: Font { get }

    var imageButton: Font { get }
}

//The theme is made of color and font
protocol ThemeProtocol: ThemeColor, ThemeFont {}
