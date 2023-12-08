//
//  FeedData.swift
//  Database-Team11
//
//  Created by 이재혁 on 12/1/23.
//

import Foundation

struct FeedComment {
    var profileImage: String
    var name: String
    var comment: String
}

extension FeedComment {
    static var data = [
        FeedComment(profileImage: "cuteBokdol", name: "서은주", comment: "우리 11조 항상 화이팅!!"),
        FeedComment(profileImage: "cuteBokdol", name: "이범준", comment: "오늘은 펀딩프로젝트에 대한 회고록을 작성했다."),
        FeedComment(profileImage: "cuteBokdol", name: "유현석", comment: "예전에 했던 프로젝트에서 부족했던점과 느꼈던 점, 다양한 사람들과의 소통방식을 다시 되돌아보고 나의 경험을 하나씩 정리해가며 포트폴리오를 만들예정이다.")
    ]
}

extension FeedComment {
    static var data2 = [
        FeedComment(profileImage: "cuteBokdol", name: "햄구이구이", comment: "우리 11조 항상 화이팅!!"),
        FeedComment(profileImage: "cuteBokdol", name: "이범준", comment: "오늘은 데이터베이스 텀 프로젝트를 진행했다."),
        FeedComment(profileImage: "cuteBokdol", name: "유현석", comment: "예전에 했던 프로젝트에서 부족했던점과 느꼈던 점, 다양한 사람들과의 소통방식을 다시 되돌아보고 나의 경험을 하나씩 정리해가며 포트폴리오를 만들예정이다.")
    ]
}
