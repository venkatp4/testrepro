//
//  CustomTabBuilder.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 17/09/21.
//

import Foundation
import SwiftUI

public class TabItemData: Equatable {
    public static func == (lhs: TabItemData, rhs: TabItemData) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    public var title: String
    public var image: String
    public var type: TabItemType
    
    public typealias TabActionCallback = () -> AnyView
    public var tabAction: TabActionCallback
    
    public init(id: Int, title: String, image: String, type: TabItemType, tabAction: @escaping TabActionCallback) {
        self.id = id
        self.title = title
        self.image = image
        self.type = type
        self.tabAction = tabAction
    }
    
    public enum TabItemType {
        case tab1
        case tab2
        case tab3
        case tab4
        case tab5
//        case tab6
//        case tab7
//        case tab8
    }
}

public class CustomTabBuilder: ObservableObject {
    
    public init() { }
    
    public func createTabBar(with items: [TabItemData], selectedTabType: String, selectedColor: Color) -> CustomTabView {
        return CustomTabView(tabData: items, selectedtab: selectedTabType, tabAccentColor: selectedColor)
    }
    
}
