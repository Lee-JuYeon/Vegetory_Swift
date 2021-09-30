//
//  PostModel.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/30.
//

import SwiftUI

struct PostModel : Identifiable {
    var id = UUID()
    var postMedia : [String] // get json list
    var postDescription : String // post description
    var postLike : [String] // userUID list coutn
    var postUserUID : String // posit user UID
    var postUserName : String // post user name
    var postDate : String // post Date
    var postReply : [ReplyModel] // post Reply
}

extension PostModel {
    static let dummyPostModelList = [
        PostModel(
            postMedia: ["media1","media11","mdia111"],
            postDescription: "card description1",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName1",
            postDate: "post date",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia2","mdia22","mdia222"],
            postDescription: "card description2",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userNam222",
            postDate: "post date222",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia3","mdia33","mdia333"],
            postDescription: "card description3333",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName333",
            postDate: "post date333",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia4","mdia44","mdia444"],
            postDescription: "card description444",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName4444",
            postDate: "post date4444",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia5","mdia55","mdia555"],
            postDescription: "card description555",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName555",
            postDate: "post date5555",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia6","mdia66","mdia666"],
            postDescription: "card description6666",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName666",
            postDate: "post date666",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        ),
        PostModel(
            postMedia: ["mdia7","mdia77","mdia777"],
            postDescription: "card description777",
            postLike: ["user1","user2","user3"],
            postUserUID: "post userUID",
            postUserName: "userName7777",
            postDate: "post date77777",
            postReply: [
                ReplyModel(
                    userName: "replyUserName1",
                    userSelfie: "selfie1",
                    userDescription: "reply11111",
                    replyDate: "date111"
                ),
                ReplyModel(
                    userName: "replyUserName2",
                    userSelfie: "selfie1",
                    userDescription: "reply2222",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName3",
                    userSelfie: "selfie1",
                    userDescription: "reply3333",
                    replyDate: "date3333"
                ),
                ReplyModel(
                    userName: "replyUserName4",
                    userSelfie: "selfie1",
                    userDescription: "reply4444",
                    replyDate: "date444"
                ),
                ReplyModel(
                    userName: "replyUserName5",
                    userSelfie: "selfie1",
                    userDescription: "reply555",
                    replyDate: "date555"
                ),
                ReplyModel(
                    userName: "replyUserName6",
                    userSelfie: "selfie1",
                    userDescription: "repl6666",
                    replyDate: "dat6666"
                )
            ]
        )
    ]
}
