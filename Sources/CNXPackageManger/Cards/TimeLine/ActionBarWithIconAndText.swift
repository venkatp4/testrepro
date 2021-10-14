//
//  ActionBarWithIconAndText.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 16/09/21.
//

import SwiftUI

struct ActionBarWithIconAndText: View {
    
    public typealias LikeButtonCallBack = () -> Void
    public var likeButtonAction: LikeButtonCallBack
    
    public typealias LikeCountCallBack = () -> Void
    public var likeCountAction: LikeCountCallBack
    
    public typealias ViewButtonCallBack = () -> Void
    public var viewButtonAction: ViewButtonCallBack
    
    public typealias ViewCountCallBack = () -> Void
    public var viewCountAction: ViewCountCallBack
    
    public typealias CommentButtonCallBack = () -> Void
    public var commentButtonAction: CommentButtonCallBack
    
    public typealias CommentCountCallBack = () -> Void
    public var commentCountAction: CommentCountCallBack
    
    public typealias ShareButtonCallBack = () -> Void
    public var shareButtonAction: ShareButtonCallBack
    
    public typealias ShareCountCallBack = () -> Void
    public var shareCountAction: ShareCountCallBack
    
    var actionBarData: ActionBarData

    public init(likeButtonAction: @escaping LikeButtonCallBack,
                viewButtonAction: @escaping ViewButtonCallBack,
                commentButtonAction: @escaping CommentButtonCallBack,
                shareButtonAction: @escaping ShareButtonCallBack,
                likeCountAction: @escaping LikeCountCallBack,
                viewCountAction: @escaping ViewCountCallBack,
                commentCountAction: @escaping CommentCountCallBack,
                shareCountAction: @escaping ShareCountCallBack,
                actionBarData: ActionBarData) {
        self.likeButtonAction = likeButtonAction
        self.viewButtonAction = viewButtonAction
        self.commentButtonAction = commentButtonAction
        self.shareButtonAction = shareButtonAction
        self.likeCountAction = likeCountAction
        self.viewCountAction = viewCountAction
        self.commentCountAction = commentCountAction
        self.shareCountAction = shareCountAction
        self.actionBarData = actionBarData
    }
    
    var body: some View {
        
        // TODO: -
        switch actionBarData.cardStyle {
        case .birthday:
            actionBarViewForBirthday()
            
        case .anniversary:
            actionBarViewForBirthday()
            
        case .image:
            actionBarView()
            
        case nil:
            Spacer().frame(width: 0)
        case .some(.none):
            Spacer()
        case .some(.text):
            Spacer()
        case .some(.video):
            Spacer()
        case .some(.url):
            Spacer()
        case .some(.checkIn):
            Spacer()
        case .some(.polls):
            Spacer()
        }
        
    }
    
    @ViewBuilder
    func actionBarView() -> some View {
        HStack(spacing: 25) {
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-like")
                    .onTapGesture {
                        likeButtonAction()
                    }
                Text(actionBarData.likeCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
                        likeCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-view")
                    .onTapGesture {
                        viewButtonAction()
                    }
                Text(actionBarData.viewCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
                        viewCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-comment")
                    .onTapGesture {
                        commentButtonAction()
                    }
                Text(actionBarData.commentCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        commentCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-share")
                    .onTapGesture {
                        shareButtonAction()
                    }
                Text(actionBarData.shareCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
                        shareCountAction()
                    }
            }
        }
        .padding([.leading, .top, .bottom], 10)
        .frame(height: 25, alignment: .center)
    }
    
    @ViewBuilder
    func actionBarViewForBirthday() -> some View {
        HStack(spacing: 25) {
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-like")
                    .onTapGesture {
                        likeButtonAction()
                    }
                Text(actionBarData.likeCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 30, height: 25)
                    .onTapGesture {
                        likeCountAction()
                    }
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image.createImageFromCNXUIKit(with: "feed-comment")
                    .onTapGesture {
                        commentButtonAction()
                    }
                Text(actionBarData.commentCount ?? "")
                    .font(CNXTheme.font.button)
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        commentCountAction()
                    }
            }
        }
        .padding([.leading, .top, .bottom], 10)
        .frame(height: 25, alignment: .center)
    }
}



//struct ActionBarWithIconAndText_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionBarWithIconAndText {
//            print("Hello")
//        }
//    }
//}
