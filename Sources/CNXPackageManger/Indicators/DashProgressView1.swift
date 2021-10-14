//
//  DashProgressView1.swift
//  CNXUIKit
//
//  Created by VeeraSubhash on 13/08/21.
//

import SwiftUI

public struct DashedProgressIndicator: View {
    
    public var numberOfPages: Int
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    
    public init(numberOfPages: Int, curSlideIndex: Int) {
        self.numberOfPages = numberOfPages
        self.curSlideIndex = curSlideIndex
    }
    
    public var body: some View {
        HStack {
            Spacer()
            
            self.progressView()
            
            Spacer()
            
            Button(action: nextButton, label: {
                self.arrowView()
            })
            
            Spacer()
        }
        .background(Color.gray)
    }
    
    public func progressView() -> some View {
        
        HStack {
            ForEach(0..<numberOfPages) { i in
                ZStack {
                    if self.curSlideIndex >= i {
                        withAnimation(.spring()) {
                            Capsule()
                                .foregroundColor(Color(hex: "1b4887"))
                        }
                    } else {
                        withAnimation(.spring()) {
                            Capsule()
                                .foregroundColor(Color(hex: "e2e5e7"))
                        }
                    }
                }
                .frame(width: 24, height: 4)
            }
        }
        .frame(width: 240, height: 44)

    }
    
    public func nextButton() {
        if self.curSlideIndex == self.numberOfPages - 1 {
            doneFunction()
            return
        }
        
        if self.curSlideIndex < self.numberOfPages - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }
    
    public func doneFunction() {
        self.curSlideIndex = 0
    }
    
    public func arrowView() -> some View {
        Group {
            if self.curSlideIndex == self.numberOfPages - 1 {
                HStack {
                    Text("Done")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(Color(.systemBackground))
                }
                .frame(width: 55, height: 44)
                .background(Color(.label))
                .cornerRadius(22)
            } else {
                Rectangle()
                    .fill(Color(hex: "1b4887"))
                    .frame(width: 55, height: 44)
                    .overlay(
                        Image("arrow_white")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                    )
                    .cornerRadius(10)
            }
        }
    }
    
}

public struct DashProgressView1: View {
    
    // MARK: - Public Properties
    
    public var numberOfPages: Int
    @State public var currentIndex: Int = 0
    
    public init(numberOfPages: Int, currentIndex: Int) {
        self.numberOfPages = numberOfPages
        self.currentIndex = currentIndex
    }

    public var body: some View {

        HStack {
            Spacer()
            
            CustomTabIndicator(count: numberOfPages, current: $currentIndex)
            
            Spacer()
            
            VStack {
                Button(action: {
                    if currentIndex < numberOfPages - 1 {
                        currentIndex += 1
                        print("currentIndex 11 = \(currentIndex)")
                    } else {
                        currentIndex = 0
                        print("currentIndex 11 = \(currentIndex)")
                    }
                }) {
                    Image(systemName: "character.textbox")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            .background(Color.orange)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.edgesIgnoringSafeArea(.all))
        
    }
}

struct CustomTabIndicator: View {
    
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        HStack {
            ForEach(0..<count, id: \.self) { index in
                ZStack {
                    if current == index {
                        withAnimation(.spring()) {
                            Capsule()
                                .fill(Color.black)
                        }
                        
                    } else {
                        withAnimation(.spring()) {
                            Capsule()
                                .fill(Color.gray)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                    }
                }
                .frame(width: 20, height: 4)
            }
        }
    }
}


struct DashProgressView1_Previews: PreviewProvider {
    static var previews: some View {
        DashProgressView1(numberOfPages: 5, currentIndex: 0)
    }
}
