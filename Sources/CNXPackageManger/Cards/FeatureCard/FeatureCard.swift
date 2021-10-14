//
//  FeatureCard.swift
//  WelcomeBoardUI
//
//  Created by Shruthi Vittal on 12/08/21.
//

import SwiftUI

public struct FeatureCard: View {
    
    //The data source for Card
    var cardData: FeatureCardData
    
    @State private var isOn = true
    
    public typealias InfoButtonCallBack = () -> Void
    public var infoButtonAction: InfoButtonCallBack
    
    public typealias CheckBoxButtonCallBack = () -> Void
    public var checkBoxButtonAction: CheckBoxButtonCallBack
    
    public typealias ArrowButtonCallBack = () -> Void
    public var arrowButtonAction: ArrowButtonCallBack
    
    public typealias ToggleButtonCallBack = () -> Void
    public var toggleButtonAction: ToggleButtonCallBack
    
    public init(cardData: FeatureCardData,
                infoButtonAction: @escaping InfoButtonCallBack,
                checkBoxButtonAction: @escaping CheckBoxButtonCallBack,
                arrowButtonAction: @escaping ArrowButtonCallBack,
                toggleButtonAction: @escaping ToggleButtonCallBack) {
        self.cardData = cardData
        self.infoButtonAction = infoButtonAction
        self.checkBoxButtonAction = checkBoxButtonAction
        self.arrowButtonAction = arrowButtonAction
        self.toggleButtonAction = toggleButtonAction
    }
    
    public var body: some View {
        
        HStack(alignment: .center, spacing: 5) {
            
            if cardData.isDraggable == true {
                cardData.dragIcon?
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .padding(4)
                    .frame(width: 28, height: 28, alignment: .center)
            }
            

            switch cardData.indexType {
            case .even:
                cardData.leftIcon?
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28, alignment: .center)
                    .padding(25)
                    .background(
                        Rectangle()
                            .fill(CNXTheme.color.evenCardIconBgColor)
                            .frame(width: 55, height: 55)
                            .cornerRadius(11)
                    )
            case .odd:
                cardData.leftIcon?
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28, alignment: .center)
                    .padding(25)
                    .background(
                        Rectangle()
                            .fill(CNXTheme.color.oddCardIconBgColor)
                            .frame(width: 55, height: 55)
                            .cornerRadius(11)
                    )
            case nil:
                Spacer().frame(width: 0)
            case .some(.none):
                Spacer()
            }
            
//            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(cardData.title)
                    .font(CNXTheme.font.title)
                    .foregroundColor(CNXTheme.color.titleColor)
                
                Text(cardData.subTitle ?? "")
                    .foregroundColor(CNXTheme.color.subtitleColor)
                    .font(CNXTheme.font.subtitle)
                
                LableWithIconView(lableText: cardData.infoText, iconImage: cardData.infoTextIcon, urlLink: cardData.urlLink)
            }
            
            Spacer()
            
            switch cardData.actionButtonType {
            case .info:
                Button(action: {
                    print("Info Button Clicked")
                }) {
                    Image.createImageFromCNXUIKit(with: "infoIcon")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: 28, height: 28, alignment: .trailing)
                        .onTapGesture {
                            infoButtonAction()
                        }
                }
                .frame(width: 40, height: 60, alignment: .top)
            case .toggle:
                Toggle(isOn: $isOn) {
                    Text("")
                }
                .frame(width: 40, height: 60, alignment: .top)
                .toggleStyle(CustomToggleStyle(trailingButtonAction: {
                    toggleButtonAction()
                }))
            case .arrow:
                Button(action: {
                    print("Info Button Clicked")
                }) {
                    Image.createImageFromCNXUIKit(with: "right-arrow")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: 15, height: 15, alignment: .trailing)
                        .onTapGesture {
                            arrowButtonAction()
                        }
                }
            case .checkbox:
                Button(action: {
                    print("Checkbox Button Clicked")
                }) {
                    Toggle(isOn: $isOn) {
                        Text("")
                    }
                    .frame(width: 20, height: 20)
                    .toggleStyle(CheckBoxToggleStyle(trailingButtonAction: {
                        checkBoxButtonAction()
                    }))
                }
            case nil:
                Spacer().frame(width: 0)
            case .some(.none):
                Spacer()
            }
            
        }
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)

    }
}

//struct FeatureCard_Previews: PreviewProvider {
//    static var previews: some View {
//        let data = FeatureCardData(title: "", subTitle: "", thumbNail: Image("Dummy"), infoTextIcon: Image("Dummy"), infoText: "", infoURL: URL(string: "")), cardHeight: 150, cornerRadius: 12)
//        FeatureCard(cardData: data)
//    }
//}
