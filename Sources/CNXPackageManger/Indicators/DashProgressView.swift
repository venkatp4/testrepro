//
//  DashProgressView.swift
//  CNXUIKit
//
//  Created by Shruthi Vittal on 12/08/21.
//

import SwiftUI

public struct DashProgressView: View {
    
    // MARK: - Public Properties
    
    public let numberOfPages: Int
    public let currentIndex: Int
    
    public init(numberOfPages: Int, currentIndex: Int) {
        self.numberOfPages = numberOfPages
        self.currentIndex = currentIndex
    }
    
    // MARK: - Drawing Constants
    
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 12
    
    private let primaryColor = Color.white
    private let secondaryColor = Color.white.opacity(0.6)
    
    private let smallScale: CGFloat = 0.6
    
    
    // MARK: - Body
    
    public var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages) { index in // 1
                if shouldShowIndex(index) {
                    Capsule()
                        .fill(currentIndex == index ? primaryColor : secondaryColor) // 2
                        .scaleEffect(currentIndex == index ? 1 : smallScale)
                        
                        .frame(width: circleSize, height: circleSize)
                        
                        .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                        
                        .id(index) // 4
                }
            }
        }
    }
    
    
    // MARK: - Private Methods
    
    func shouldShowIndex(_ index: Int) -> Bool {
        ((currentIndex - 1)...(currentIndex + 1)).contains(index)
    }
}

struct DashProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DashProgressView(numberOfPages: 4, currentIndex: 1)
    }
}
