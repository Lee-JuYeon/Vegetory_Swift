//
//  ExtensionType.swift
//  Vegetory
//
//  Created by 이주연 on 2021/09/18.
//


extension TopBarModel {
   
    static func TopBarList_MAIN() -> [TopBarModel]{
        return [
            TopBarModel(titleNativ: "공지사항", titleEng: "NOTICE"),
            TopBarModel(titleNativ: "설정", titleEng: "SETTING")
        ]
    }
    
    static func TopBarList_POST() -> [TopBarModel]{
        return [
            TopBarModel(titleNativ: "작성", titleEng: "POSTING")
        ]
    }
    
    static func TopBarList_PROFILE() -> [TopBarModel]{
        return [
            TopBarModel(titleNativ: "수정", titleEng: "EDIT"),
            TopBarModel(titleNativ: "팔로우", titleEng: "FOLLOW"),
            TopBarModel(titleNativ: "언팔로우", titleEng: "UNFOLLOW")
        ]
    }

}

