//
//  KudosCard.swift
//  CNXUIKit
//
//  Created by VeeraSubhash on 23/08/21.
//

import SwiftUI

public struct KudosCard: View {
    
    //The data source for kudos card
    var kudosData: KudosCardData
    
    public init(kudosData: KudosCardData) {
        self.kudosData = kudosData
    }
    
    public var body: some View {
        
        HStack(spacing: 5) {
            
            Image.createImageFromCNXUIKit(with: "kudos-thumb-bg")
                .resizable()
                .scaledToFit()
                .frame(width: 77, height: 120)
                .background(CNXTheme.color.kudosThumbBgColor)
                        
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(kudosData.title1)
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text(kudosData.title2)
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(kudosData.subTitle)
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text(kudosData.description)
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
            }
            .padding(.all, 10)
            
        }
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
}

struct KudosCard_Previews: PreviewProvider {
    static var previews: some View {
        let data = KudosCardData(title1: "Wow! You got a new kudos", title2: "", subTitle: "Concentrix Hero", description: "Highly passionate and creative with out of box thought process", leftIcon: Image("kudosCard"))
        KudosCard(kudosData: data)
    }
}
