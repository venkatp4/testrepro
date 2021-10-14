//
//  CNXTheme.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 20/09/21.
//

import UIKit

public final class CNXTheme {
    
    //Access font from the current theme
    public class var font: ThemeFont {
        return CurrentTheme.shared.getCurrent()
    }
    
    //Access font color the current theme
    public class var color: ThemeColor {
        return CurrentTheme.shared.getCurrent()
    }
    
//    public class var style: ThemeStyle {
//        return CurrentTheme.shared.getCurrent()
//    }

    // MARK: Some styling values.
    //Can define further as required.
    public class var cornerRadius: CGFloat {
        return 18 //Just a sample corner radius value
    }

    public class var lineWidth: CGFloat {
        return 2 //Just a sample corner radius value
    }
    
    public class var leadingOffset: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var trailingOffset: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var topOffset: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var bottomOffset: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var verticalSpacing: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var horizontalSpacing: CGFloat {
        return 8 //Just a sample offset.
    }
    
    public class var buttonCornerRadius: CGFloat {
        return 8 //Just a sample corner radius value
    }
    
}
