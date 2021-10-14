//
//  LableWithIconView.swift
//  CNXUIKit
//
//  Created by Shruthi Vittal on 12/08/21.
//

import SwiftUI

struct LableWithIconView: View {
    
    var lableText: String?
    var iconImage: Image?
    var urlLink: URL?
    
    var body: some View {
        if #available(iOS 14.0, *) {
            HStack {
                Button(action: {
                    print("Button Clicked")
                }) {
                    iconImage?
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                if let url = urlLink {
                    Link(lableText ?? "", destination: url)
                        .font(CNXTheme.font.infoText)
                        .foregroundColor(CNXTheme.color.infoTextColor)
                }
            }
        } else {
            // Fallback on earlier versions
            HStack {
                if let url = urlLink  {
                    Button(action: {
                        print("Button Clicked")
                    }) {
                        iconImage?
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    
                    Text(lableText ?? "")
                        .font(CNXTheme.font.infoText)
                        .foregroundColor(CNXTheme.color.infoTextColor)
                        .onTapGesture {
                            UIApplication.shared.open(url)
                        }
                }
            }
        }
    }
}

struct LableWithIconView_Previews: PreviewProvider {
    static var previews: some View {
        LableWithIconView(iconImage: Image("Dummy"))
    }
}
