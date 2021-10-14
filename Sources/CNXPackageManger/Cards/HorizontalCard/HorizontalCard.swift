//
//  HorizontalCard.swift
//  CNXUIKit
//
//  Created by VeeraSubhash on 23/08/21.
//

import SwiftUI

extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

//extension VerticalAlignment {
//    struct CustomAlignment: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            return context[VerticalAlignment.center]
//        }
//    }
//
//    static let custom = VerticalAlignment(CustomAlignment.self)
//}

public struct HorizontalCard: View {
    
    public typealias CheckBoxButtonCallBack = () -> Void
    public var checkBoxButtonAction: CheckBoxButtonCallBack
    
    public typealias ArrowButtonCallBack = () -> Void
    public var arrowButtonAction: ArrowButtonCallBack
    
    public typealias ToggleButtonCallBack = () -> Void
    public var toggleButtonAction: ToggleButtonCallBack
    
    @State private var isOn = true
    
    var cardData: HorizontalCardData
    
    public init(cardData: HorizontalCardData,
                checkBoxButtonAction: @escaping CheckBoxButtonCallBack,
                arrowButtonAction: @escaping ArrowButtonCallBack,
                toggleButtonAction: @escaping ToggleButtonCallBack) {
        self.cardData = cardData
        self.checkBoxButtonAction = checkBoxButtonAction
        self.arrowButtonAction = arrowButtonAction
        self.toggleButtonAction = toggleButtonAction
    }
    
    public var body: some View {
        
        HStack(alignment: .center) {
            cardData.leftIcon?
                .resizable()
//                .scaledToFit()
//                .aspectRatio(contentMode: .fit)
                .frame(width: 39, height: 39, alignment: .leading)
                .cornerRadius(CNXTheme.buttonCornerRadius)
            
            Text(cardData.title)
                .font(CNXTheme.font.imageButton)
                .foregroundColor(CNXTheme.color.titleColor)
                .frame(alignment: .leading)
                .padding(.leading, 10)
            
            Spacer()
            
            switch cardData.clickableCardType {
            case .arrow:
                Button(action: {
                    print("Arrow Button Clicked")
                }) {
                    Image.createImageFromCNXUIKit(with: "right-arrow")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14, alignment: .trailing)
                        .onTapGesture {
                            arrowButtonAction()
                        }
                }
            case .toggle:
                Toggle(isOn: $isOn) {
                    Text("")
                }
                .frame(width: 40, height: 20)
                .toggleStyle(CustomToggleStyle(trailingButtonAction: {
                    toggleButtonAction()
                }))
            case .checkbox:
                Button(action: {
                    print("Checkbox Button Clicked")
                }) {
                    // TO DO: - Add condition
//                    Image.createImageFromCNXUIKit(with: "checkbox-unchecked")
//                        .resizable()
//                        .frame(width: 15, height: 15, alignment: .trailing)
                    
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
        .padding(.leading, 10)
        .padding(.trailing, 20)
        .padding([.top, .bottom], 10)
        .frame(height: 54)
    }
    
}

struct HorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        let data = HorizontalCardData(leftIcon: Image("bigImage"), title: "SwiftUI", clickableButtonType: .arrow)
        HorizontalCard(cardData: data,
                       checkBoxButtonAction: {
                            print("Horizontal Card CheckBoxTrailing Button Action_Previews")
                       },
                       arrowButtonAction: {
                            print("Horizontal Card Arrow Trailing Button Action_Previews")
                       },
                       toggleButtonAction: {
                            print("Horizontal Card Toggle Trailing Button Action_Previews")
                       })
    }
}
