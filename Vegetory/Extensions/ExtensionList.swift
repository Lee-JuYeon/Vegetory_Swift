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

extension MainMenuModel {
    static func MainMenuList() -> [MainMenuModel]{
        return [
            MainMenuModel(
                title: "이용내역",
                description: "지금까지 사용한 내역을 한눈에",
                image: 1),
            MainMenuModel(
                title: "배송조회",
                description: "배송조회하기",
                image: 1),
            MainMenuModel(
                title: "밀키트",
                description: "오늘은 다르다! 요리 도전!",
                image: 1),
            MainMenuModel(
                title: "완제품",
                description: "맛있는 요리는 배달",
                image: 1)
        ]
    }
}

extension RefrigeratorBucketModel {
    static func RefrigeratorBucketList() -> [RefrigeratorBucketModel] {
        return [
            RefrigeratorBucketModel(titleEng: "STUFF_UPDATE", titleNativ: "재료수정"),
            RefrigeratorBucketModel(titleEng: "STUFF_BUY", titleNativ: "재료구입"),
            RefrigeratorBucketModel(titleEng: "VEGETABLE", titleNativ: "채소"),
            RefrigeratorBucketModel(titleEng: "MEAT", titleNativ: "대체육"),
            RefrigeratorBucketModel(titleEng: "FRUIT", titleNativ: "과일"),
            RefrigeratorBucketModel(titleEng: "DESSERT", titleNativ: "디저트"),
            RefrigeratorBucketModel(titleEng: "JUICE", titleNativ: "음료"),
            RefrigeratorBucketModel(titleEng: "OIL,BUTTER", titleNativ: "오일 & 버터")
        ]
    }
}
