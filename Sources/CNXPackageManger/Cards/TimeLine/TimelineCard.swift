//
//  TimeLineCard.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 31/08/21.
//

import SwiftUI

public struct TimelineCard: View {
    
    var timelineCardData: TimelineCardData
    var sharedCardData: SharedCardData
    var actionBarData: ActionBarData
    
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
    
    public typealias InfoButtonCallBack = () -> Void
    public var infoButtonTapAction: InfoButtonCallBack
    
    public init(likeButtonAction: @escaping LikeButtonCallBack,
                viewButtonAction: @escaping ViewButtonCallBack,
                commentButtonAction: @escaping CommentButtonCallBack,
                shareButtonAction: @escaping ShareButtonCallBack,
                likeCountAction: @escaping LikeCountCallBack,
                viewCountAction: @escaping ViewCountCallBack,
                commentCountAction: @escaping CommentCountCallBack,
                shareCountAction: @escaping ShareCountCallBack,
                timelineCardData: TimelineCardData,
                sharedCardData: SharedCardData,
                actionBarData: ActionBarData,
                infoButtonTapAction: @escaping InfoButtonCallBack) {
        self.likeButtonAction = likeButtonAction
        self.viewButtonAction = viewButtonAction
        self.commentButtonAction = commentButtonAction
        self.shareButtonAction = shareButtonAction
        self.likeCountAction = likeCountAction
        self.viewCountAction = viewCountAction
        self.commentCountAction = commentCountAction
        self.shareCountAction = shareCountAction
        self.timelineCardData = timelineCardData
        self.sharedCardData = sharedCardData
        self.actionBarData = actionBarData
        self.infoButtonTapAction = infoButtonTapAction
    }
    
    public var body: some View {
        
        switch timelineCardData.cardStyle {
        case .image:
            imageSharedView()
            
        case .video:
            imageSharedView()
            
        case .text:
            imageSharedView()
            
        case .birthday:
            imageSharedView()
            
        case .anniversary:
            imageSharedView()
            
        case .checkIn:
            imageSharedView()
            
        case .url:
            imageSharedView()
            
        case .polls:
            pollSharedView()
            
        case nil:
            Spacer().frame(width: 0)
        case .some(.none):
            Spacer()
        }        
    }
    
    @ViewBuilder
    func pollSharedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                
                timelineCardData.profileIcon
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Representation of poll votes")
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text("10 Sep 11:45:00 PM")
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    timelineCardData.infoButton?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                    
                    Text("NEW")
                        .padding(4)
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(Color.white)
                        .background(Color(hex: "07858d"))
                        .cornerRadius(4)
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            
            Text("Internal communication - PSAT")
                .font(CNXTheme.font.title)
                .foregroundColor(CNXTheme.color.titleColor)
                .padding([.leading, .trailing, .top, .bottom], 10)
            
            HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    print("Answer Poll Btn Tapped")
                }) {
                    Text("Answer Poll")
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                        .foregroundColor(.blue)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                Spacer()
            }
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
    
    @ViewBuilder
    func imageSharedView() -> some View {
        if timelineCardData.hasSharedView == false {
            originalSharedView()
        } else {
            newResharedView()
        }
    }
    
    @ViewBuilder
    func originalSharedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                timelineCardData.profileIcon
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(timelineCardData.postTitle ?? "")
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text(timelineCardData.postSubTitle ?? "")
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    timelineCardData.infoButton?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .onTapGesture {
                            infoButtonTapAction()
                        }
                    
                    Text("NEW")
                        .padding(4)
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(Color.white)
                        .background(Color(hex: "07858d"))
                        .cornerRadius(4)
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            //////////////////////////////
            
            if let postContent = timelineCardData.postContent {
                VStack(alignment: .leading, spacing: 5) {
                    Text(postContent)
                        .font(CNXTheme.font.subtitle1)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    if let subContent = timelineCardData.postSubContent {
                        Text(subContent)
                            .font(CNXTheme.font.body1)
                            .foregroundColor(CNXTheme.color.subtitleColor)
                            .padding([.top, .bottom], 5)
                    }
                }
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
            }
            
            if let postImage = timelineCardData.postImage {
                postImage
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(CNXTheme.buttonCornerRadius)
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
            }
            //////////////////////////////
            
            
            if let bottomDescription = timelineCardData.bottomDescription {
                Text(bottomDescription)
                    .font(CNXTheme.font.body1)
                    .foregroundColor(CNXTheme.color.subtitleColor)
                    .padding([.leading, .trailing], 10)
                    .padding(.top, 5)
            }
            
            // For URL Post
            if let urlStr = timelineCardData.postUrl {
                Text(urlStr)
                    .font(CNXTheme.font.subtitle)
                    .foregroundColor(CNXTheme.color.linkColor)
                    .padding([.leading, .trailing, .top, .bottom], 10)
                    .onTapGesture {
                        UIApplication.shared.open((URL(string: urlStr) ?? URL(string: ""))!)
                    }
                // For URL Post
            }
            
            actionBarView()
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
    
    @ViewBuilder
    func actionBarView() -> some View {
        
        ActionBarWithIconAndText(
            likeButtonAction: {
                likeButtonAction()
            }, viewButtonAction: {
                viewButtonAction()
            }, commentButtonAction: {
                commentButtonAction()
            }, shareButtonAction: {
                shareButtonAction()
            }, likeCountAction: {
                likeCountAction()
            }, viewCountAction: {
                viewCountAction()
            }, commentCountAction: {
                commentCountAction()
            }, shareCountAction: {
                shareCountAction()
            }, actionBarData:
                ActionBarData(likeCount: actionBarData.likeCount,
                              viewCount: actionBarData.viewCount,
                              commentCount: actionBarData.commentCount,
                              shareCount: actionBarData.shareCount,
                              cardStyle: actionBarData.cardStyle))
    }
    
    @ViewBuilder
    func newResharedView() -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                sharedCardData.profileIcon
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(sharedCardData.sharedTitle ?? "")
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text(sharedCardData.sharedSubTitle ?? "")
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
                VStack(alignment: .trailing, spacing: 0) {
                    sharedCardData.infoButton?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                    
                    Text("NEW")
                        .padding(4)
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(Color.white)
                        .background(Color(hex: "07858d"))
                        .cornerRadius(4)
                }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .frame(minHeight: 75)
            
            //////////////////////////////
            
            if let sharedText = sharedCardData.sharedContent {
                Text(sharedText)
                    .padding([.leading, .trailing], 15)
                    .padding([.bottom], 10)
                    .font(CNXTheme.font.subtitle)
                    .foregroundColor(CNXTheme.color.subtitleColor)
                    .cornerRadius(4)
            }
            
            //////////////////////////////
            
            reSharedView()
                .padding([.leading, .trailing], 10)
            
            //////////////////////////////
            
            actionBarView()
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        
    }
    
    @ViewBuilder
    func reSharedView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 10) {
                timelineCardData.profileIcon
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(timelineCardData.postTitle ?? "")
                        .font(CNXTheme.font.title)
                        .foregroundColor(CNXTheme.color.titleColor)
                    
                    Text(timelineCardData.postSubTitle ?? "")
                        .font(CNXTheme.font.subtitle)
                        .foregroundColor(CNXTheme.color.subtitleColor)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
                
            }
            .padding([.leading, .trailing], 5)
            .padding([.top, .bottom], 5)
            
            timelineCardData.postImage?
                .resizable()
                .scaledToFit()
                .cornerRadius(CNXTheme.buttonCornerRadius)
                .padding([.leading, .trailing], 5)
                .padding([.top, .bottom], 5)
            
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        .overlay(
            RoundedRectangle(cornerRadius: CNXTheme.cornerRadius)
                .stroke(Color(hex: "b1b4b6"), lineWidth: 1)
        )
        
    }
}

struct TimeLineCard_Previews: PreviewProvider {
    static var previews: some View {
        
        let profileData1 = ProfileCardData(profileImage: Image.createImageFromCNXUIKit(with: ("profileIcon")), width: 50, height: 50, lineWidth: 0, shadowRadius: 0, strokeColor: .clear, cornerRadius: 12)
        
        let title2Str = "Posted By" + " " + "Veera" + " " + "3" + " " + "hrs" + " " + "ago"
        let timelineCardData = TimelineCardData(profileIcon: ProfileCard(profileCardData: profileData1),
                                                postTitle: "Yoga to regain strength post COVID-19",
                                                postSubTitle: title2Str,
                                                postContent: "Hope you had a great birthday Charley!",
                                                postSubContent: "🎂 Celebrating a birthday!",
                                                bottomDescription: "Spotify gains Siri support",
                                                postUrl: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-customize-stack-layouts-with-alignment-and-spacing",
                                                infoButton: Image.createImageFromCNXUIKit(with: ("feed-more-icon")),
                                                postImage: Image.createImageFromCNXUIKit(with: ("Dummy")),
                                                hasSharedView: false,
                                                cardStyle: .image)
        
        //        "🎂 Celebrating a birthday!"
        
        let title3Str = "Maya" + " " + "1" + " " + "hr" + " " + "ago"
        let sharedData = SharedCardData(profileIcon: ProfileCard(profileCardData: profileData1),
                                        infoButton: Image.createImageFromCNXUIKit(with: ("feed-more-icon")),
                                        sharedTitle: "Happy to share it with you all.",
                                        sharedSubTitle: title3Str,
                                        sharedContent: "This is the reshared content description")
        
        let actionBarData = ActionBarData(likeCount: "88", viewCount: "46", commentCount: "32", shareCount: "44", cardStyle: .image)
        
        TimelineCard(likeButtonAction: {
            print("Show details for LIKE_Previews")
        }, viewButtonAction: {
            print("Show details for VIEW_Previews")
        }, commentButtonAction: {
            print("Show details for COMMENT_Previews")
        }, shareButtonAction: {
            print("Show details for SHARE_Previews")
        }, likeCountAction: {
            print("likeCount Action_Previews")
        }, viewCountAction: {
            print("viewCount Action_Previews")
        }, commentCountAction: {
            print("commentCount Action_Previews")
        }, shareCountAction: {
            print("shareCount Action_Previews")
        },
        timelineCardData: timelineCardData,
        sharedCardData: sharedData,
        actionBarData: actionBarData,
        infoButtonTapAction: {
            print("Info Button TapAction_Previews")
        })
        .background(Color(hex: "f4f6f8"))
        .cornerRadius(CNXTheme.cornerRadius)
        .frame(width: 335)
        
    }
}

//    @ViewBuilder
//    func URLSharedView() -> some View {
//        VStack(alignment: .leading, spacing: 0) {
//
//            HStack(spacing: 10) {
//
//                timelineCardData.profileIcon
//
//                VStack(alignment: .leading, spacing: 5) {
//                    Text(timelineCardData.postTitle ?? "")
//                        .font(CNXTheme.font.title)
//                        .foregroundColor(CNXTheme.color.titleColor)
//
//                    Text(timelineCardData.postSubTitle ?? "")
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(CNXTheme.color.subtitleColor)
//                }
//                .padding(.bottom, 5)
//
//                Spacer(minLength: 5)
//
//                VStack(alignment: .trailing, spacing: 0) {
//                    timelineCardData.infoButton?
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 28, height: 28)
//
//                    Text("NEW")
//                        .padding(4)
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(Color.white)
//                        .background(Color(hex: "07858d"))
//                        .cornerRadius(4)
//                }
//
//            }
//            .padding([.leading, .trailing], 10)
//            .padding([.top, .bottom], 5)
//            .frame(minHeight: 75)
//
//
//            //////////////////////////////
//
//            timelineCardData.postImage?
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(8)
//                .padding([.leading, .trailing], 10)
//                .padding([.top, .bottom], 5)
//
//            //////////////////////////////
//
//
//            Text("https://www.hackingwithswift.com/quick-start/swiftui/how-to-customize-stack-layouts-with-alignment-and-spacing")
//                .font(CNXTheme.font.subtitle)
//                .foregroundColor(CNXTheme.color.subtitleColor)
//                .padding([.leading, .trailing, .top, .bottom], 10)
//
//            ActionBarWithIconAndText {
//                print("Hello 1")
//            }
//
//        }
//        .padding([.top, .bottom], 10)
//        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
//
//    }

//    @ViewBuilder
//    func checkInSharedView() -> some View {
//        VStack(alignment: .leading, spacing: 0) {
//
//            HStack(spacing: 10) {
//                timelineCardData.profileIcon
//
//                VStack(alignment: .leading, spacing: 5) {
//                    Text(timelineCardData.postTitle ?? "")
//                        .font(CNXTheme.font.title)
//                        .foregroundColor(CNXTheme.color.titleColor)
//
//                    Text(timelineCardData.postSubTitle ?? "")
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(CNXTheme.color.subtitleColor)
//                }
//                .padding(.bottom, 5)
//
//                Spacer(minLength: 5)
//
//                VStack(alignment: .trailing, spacing: 0) {
//                    timelineCardData.infoButton?
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 28, height: 28)
//
//                    Text("NEW")
//                        .padding(4)
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(Color.white)
//                        .background(Color(hex: "07858d"))
//                        .cornerRadius(4)
//                }
//
//            }
//            .padding([.leading, .trailing], 10)
//            .padding([.top, .bottom], 5)
//            .frame(minHeight: 75)
//
//
//            //////////////////////////////
//
//            timelineCardData.postImage?
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(8)
//                .padding([.leading, .trailing], 10)
//                .padding([.top, .bottom], 5)
//
//            //////////////////////////////
//
//
//            ActionBarWithIconAndText {
//                print("Hello 2")
//            }
//
//        }
//        .padding([.top, .bottom], 10)
//        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
//
//    }

//    @ViewBuilder
//    func textSharedView() -> some View {
//        VStack(alignment: .leading, spacing: 0) {
//
//            HStack(spacing: 10) {
//
//                timelineCardData.profileIcon
//
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("Charley wished Bridget")
//                        .font(CNXTheme.font.title)
//                        .foregroundColor(CNXTheme.color.titleColor)
//
//                    Text("4 hours ago")
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(CNXTheme.color.subtitleColor)
//                }
//                .padding(.bottom, 5)
//
//                Spacer(minLength: 5)
//
//                VStack(alignment: .trailing, spacing: 0) {
//                    timelineCardData.infoButton?
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 28, height: 28)
//
//                    Text("NEW")
//                        .padding(4)
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(Color.white)
//                        .background(Color(hex: "07858d"))
//                        .cornerRadius(4)
//                }
//
//            }
//            .padding([.leading, .trailing], 10)
//            .padding([.top, .bottom], 5)
//            .frame(minHeight: 75)
//
//            VStack(alignment: .leading, spacing: 5) {
//                Text("Hope you had a great birthday Charley!")
//                    .font(CNXTheme.font.title)
//                    .foregroundColor(CNXTheme.color.titleColor)
//
//                HStack {
//                    Image.createImageFromCNXUIKit(with: "birthdayCake")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 28, height: 28)
//                    Text("Celebrating a birthday")
//                        .font(CNXTheme.font.subtitle)
//                        .foregroundColor(CNXTheme.color.subtitleColor)
//                }
//            }
//            .padding([.leading, .trailing], 10)
//            .padding([.top, .bottom], 5)
//
//            ActionBarWithIconAndText {
//                print("Hello 3")
//            }
//        }
//        .padding([.top, .bottom], 10)
//        .padding([.leading, .trailing], 10)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
//
//    }
