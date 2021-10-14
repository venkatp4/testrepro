//
//  CustomToggleStyle.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 13/09/21.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    public typealias TrailingButtonCallBack = () -> Void
    public var trailingButtonAction: TrailingButtonCallBack
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            // TO DO: - Changes images here
            Image.createImageFromCNXUIKit(with: configuration.isOn ? "toggle-on" : "toggle-off")
                .resizable()
                .renderingMode(.original)
                .frame(width: 40, height: 20, alignment: .top)
                .onTapGesture {
                    trailingButtonAction()
                    configuration.isOn.toggle()
                }
        }
    }
}

struct CheckBoxToggleStyle: ToggleStyle {
    
    public typealias TrailingButtonCallBack = () -> Void
    public var trailingButtonAction: TrailingButtonCallBack
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            // TO DO: - Changes images here
            Image.createImageFromCNXUIKit(with: configuration.isOn ? "checkbox-unchecked" : "checkbox-checked")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
                .onTapGesture {
                    trailingButtonAction()
                    configuration.isOn.toggle()
                }
        }
    }
}


