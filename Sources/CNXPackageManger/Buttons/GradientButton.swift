//
//  GradientButton.swift
//  CNXUIKit
//
//  Created by Shruthi Vittal on 12/08/21.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
 
    var startColor: Color
    var endColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing).opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            .shadow(radius: 10)
            .font(CNXTheme.font.infoText)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 1)
                    .padding(.horizontal, 10)
            )
    }
}

public struct GradientButton: View {
    public var title: String
    public var startColor: Color
    public var endColor: Color
    public typealias ButtonCallBack = () -> Void
    public var buttonAction: ButtonCallBack

    public init(title: String, startColor: Color, endColor: Color, action: @escaping ButtonCallBack) {
        self.title = title
        self.startColor = startColor
        self.endColor = endColor
        self.buttonAction = action
    }
    
    public var body: some View {
        Button(title, action: buttonAction)
            .buttonStyle(GradientBackgroundStyle(startColor: startColor, endColor: endColor))
    }
}

