//
//  CurvedTabBar.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 07/09/21.
//

import SwiftUI

//public struct CurvedTabBar: View {
//
//    public init() {
//        UITabBar.appearance().isHidden = true
//    }
//
//    public var body: some View {
//        CustomTabView()
//    }
//}

//var tabs = ["home", "chat", "kudos1", "staff", "helpdesk"]

public struct CustomTabView: View {
    
//    public init() {
//        UITabBar.appearance().isHidden = true
//    }
    
//    @State var selTab: String = "employee"
    
    @State var tabData = [TabItemData]()
    @State var selectedtab: String
    @State var tabAccentColor: Color
    
//    @State var selectedtab = "home"
    
    @State var xAxis: CGFloat = 0
    
//    public var body: some View {
//        TabView(selection: $selectedtab) {
//            ForEach(tabData, id: \.id) { tabItem in
//                tabItem.tabAction()
//                    .tabItem {
//                        VStack(alignment: .center) {
//                            Image(tabItem.image).renderingMode(.template)
//                            Text(tabItem.title)
//                                .foregroundColor(.black)
//                        }
//                    }
//                    .frame(alignment: .center)
//                    .tag(tabItem.type)
//            }
//        }
//        .accentColor(tabAccentColor)
//    }
    
    public var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//            TabView(selection: $selectedtab) {
//                tabView(for: selectedtab)
//            }
            HStack(spacing: 0) {
                ForEach(tabData, id: \.id) { tabItem in
                    
                    GeometryReader { reader in
                        
                        TabBarButton(selectedtab: $selectedtab, image: tabItem.image, xAxis: xAxis)
                            .onAppear(perform: {
                                if tabItem.image == "employee" {
                                    xAxis = reader.frame(in: .global).midX
                                }
                            })
                    }
                    .frame(width: 25, height: 20)
                    
                    if tabItem != tabData.last { Spacer(minLength: 0) }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical)
            .background(Color.white.clipShape(CustomShape(xAxis: xAxis)))
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        }
        .edgesIgnoringSafeArea(.all)
//        .accentColor(tabAccentColor)
        
    }
    
    struct TabBarButton: View {

        @Binding var selectedtab: String
        var image: String

        @State var xAxis: CGFloat = 0

        var body: some View {
            GeometryReader { reader in
                Button(action: {
                    withAnimation(.spring()) {
                        selectedtab = image
                        xAxis = reader.frame(in: .global).minX
                    }
                }, label: {
                    if image == "employee" {
                        Image(image)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 28)
                            .foregroundColor(selectedtab == image ? Color.orange : Color.gray)
                            .offset(x: -2, y: image == "employee" ? -16 : 0)
                        //                          .background(Color.white.opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
                    } else {
                        Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 20)
                            .foregroundColor(selectedtab == image ? Color.orange : Color.gray)
                        //                          .background(Color.white.opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
                    }
                })
            }

        }

    }
    
    @ViewBuilder
    func tabView(for selectedTab: String) -> some View {
        switch selectedTab {
        case "home":
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
                .tag("home")
        case "chat":
            Color(.red)
                .edgesIgnoringSafeArea(.all)
                .tag("chat")
        case "employee":
            Color(.yellow)
                .edgesIgnoringSafeArea(.all)
                .tag("kudos1")
        case "helpdesk":
            Color(.orange)
                .edgesIgnoringSafeArea(.all)
                .tag("staff")
        case "kudos":
            Color(.green)
                .edgesIgnoringSafeArea(.all)
                .tag("helpdesk")
        default:
            Color(.green)
                .edgesIgnoringSafeArea(.all)
                .tag("helpdesk")
        }
    }
    
}

struct CustomShape: Shape {
    var xAxis: CGFloat
    var animatableData: CGFloat {
        get {return xAxis}
        set {xAxis = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: 40)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 40)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 40)
            let control4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

//struct CurvedTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CurvedTabBar()
//    }
//}
