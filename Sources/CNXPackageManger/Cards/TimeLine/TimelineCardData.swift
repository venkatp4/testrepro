//
//  TimeLineCardData.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 31/08/21.
//

import Foundation
import SwiftUI

public enum CardStyle {
    case text
    case image
    case video
    case url
    case checkIn
    case polls
    case birthday
    case anniversary
    case none
}

public struct TimelineCardData {
    var profileIcon: ProfileCard?
    var postImage: Image?
    var postTitle: String?
    var postSubTitle: String?
    var postContent: String?
    var postSubContent: String?
    var bottomDescription: String?
    var postUrl: String?
    var infoButton: Image?
    var hasSharedView: Bool = false
    var cardStyle: CardStyle?
    
    public init(profileIcon: ProfileCard?, postTitle: String?, postSubTitle: String?, postContent: String?, postSubContent: String?, bottomDescription: String?, postUrl: String?, infoButton: Image?, postImage: Image?, hasSharedView: Bool, cardStyle: CardStyle? = Optional.none) {
        self.profileIcon = profileIcon
        self.postImage = postImage
        self.postTitle = postTitle
        self.postSubTitle = postSubTitle
        self.postContent = postContent
        self.postSubContent = postSubContent
        self.bottomDescription = bottomDescription
        self.postUrl = postUrl
        self.infoButton = infoButton
        self.hasSharedView = hasSharedView
        self.cardStyle = cardStyle
    }
}

public struct SharedCardData {
    var profileIcon: ProfileCard?
    var infoButton: Image?
    var sharedContent: String?
    var sharedTitle: String?
    var sharedSubTitle: String?
    
    public init(profileIcon: ProfileCard?, infoButton: Image?, sharedTitle: String?, sharedSubTitle: String?, sharedContent: String?) {
        self.profileIcon = profileIcon
        self.infoButton = infoButton
        self.sharedTitle = sharedTitle
        self.sharedSubTitle = sharedSubTitle
        self.sharedContent = sharedContent
    }
}

