//
//  CurrentTheme.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 20/09/21.
//

import Foundation

//Do not update this class unless an informed decision is made.

//Defines the deferent flavours of the Theme for the application.
//For now only one theme. This needs to be updated if have more theme in the app.
public enum ThemeType: String {
    case regular
}

// This class will manage the current theme
public final class CurrentTheme {
    
    static let shared = CurrentTheme()
    
    private(set) var currentTheme: ThemeProtocol?
    
    private init() {}
    
    //Use this function will return the current theme.
    //For now there would be only one theme, i.e Regular.
    func getCurrent() -> ThemeProtocol {
        if let theme = currentTheme {
            return theme
        } else {
            configure(with: createTheme(for: ThemeType.regular))
            return getCurrent()
        }
    }
    
    //Use this function to configure theme
    func configure(with theme: ThemeProtocol) {
        self.currentTheme = theme
    }
    
    //This function creates theme based on the define type.
    //Update this function when application is expected to render multiple themes.
    func createTheme(for type: ThemeType) -> ThemeProtocol {
        switch type {
        case .regular:
            return ThemeRegular()
        }
    }
    
}
