//
//  MetricsCard.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 02/09/21.
//

import SwiftUI

public struct MetricsCard: View {
    
    public init() {}
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text("On Time Start Rate")
                .font(CNXTheme.font.infoText)
                        
            HStack(spacing: 10) {
                Text("56.7")
                    .font(Font.custom("Helvetica", size: 32))
                Text("-37% |")
                    .font(CNXTheme.font.infoText)
            }
            
            HStack(spacing: 20) {
                Spacer()
                Text("* Target = 90%")
                    .font(Font.custom("Helvetica", size: 10))
            }
            
        }
        .padding([.top, .bottom, .leading, .trailing], 10)
        .background(Color(hex: "5068b5"))
        .foregroundColor(.white)
        .cornerRadius(CNXTheme.buttonCornerRadius)
        
    }
}

struct MetricsCard_Previews: PreviewProvider {
    static var previews: some View {
        MetricsCard()
    }
}
