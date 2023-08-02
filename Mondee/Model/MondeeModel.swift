//
//  MondeeModel.swift
//  Mondee
//
//  Created by Seokmin on 2023/07/28.
//

import Foundation

struct Mondee: Codable {
    let name: String
    let description: String
    let mondeeImg: String
}

let mondeeList: [Mondee] = [
    Mondee(name: "푸딩먼디", description: "푸딩 먼디는 냉장고 속 검은봉투에 있었어요.\n청소한 덕분에 깨끗한 녹색을 되찾았답니다!", mondeeImg: "ImgCollectedMondee001-IOS"),
    Mondee(name: "사탕먼디", description: "사탕 먼디는 다양한 과일 맛을 가지게 되었어요.\n청소한 덕분에 컬러풀하게 되었답니다!", mondeeImg: "ImgCollectedMondee002-IOS"),
    Mondee(name: "오너먼트먼디", description: "드디어 크리스마스에 트리를 꾸밀 수 있게 되었어요.\n흰 눈 내리는 날까지 우리 함께 해요!", mondeeImg: "ImgCollectedMondee003-IOS"),
    Mondee(name: "핑크먼디", description: "평생 회색으로 살 운명인줄 알았던 우리 버블…\n드디어 분홍빛을 되찾게 되었어요!", mondeeImg: "ImgCollectedMondee004-IOS"),
    Mondee(name: "화분먼디", description: "화분 먼디는 쑥쑥 자라나서 꽃을 피우기 직전이에요.\n 시원한 물 맛 좋다!", mondeeImg: "ImgCollectedMondee005-IOS"),
    Mondee(name: "실버먼디", description: "아이언인줄 알았던 내가 알고보니 실버였어?!\n우후후", mondeeImg: "ImgCollectedMondee006-IOS"),
    Mondee(name: "진주먼디", description: "진주 먼디는 새까만 먼지에서 벗어나 순백의 바디를 가지게 되었어요\n나 때 태우지마…", mondeeImg: "ImgCollectedMondee007-IOS"),
    Mondee(name: "퍼퓸먼디", description: "퍼퓸 먼디는 향기로 방을 가득 채우게 되었어요.\n 우디향 너무 좋다~ ", mondeeImg: "ImgCollectedMondee008-IOS"),
    Mondee(name: "미러볼먼디", description: "반짝반짝 빛나는 미러볼 먼디는 이제 춤을 출 수 있게 되었어요!\n암 슈펄샤이~", mondeeImg: "ImgCollectedMondee009-IOS"),
    Mondee(name: "아보카도먼디", description: "숲속의 버터 아보카도 먼디!\n사야가 퍼먹음", mondeeImg: "ImgCollectedMondee010-IOS"),
    Mondee(name: "강아지똥 먼디", description: "응애 나 아기 강아지똥\n뿌직", mondeeImg: "ImgCollectedMondee011-IOS"),
    Mondee(name: "치즈냥먼디", description: "방이 깨끗해서 너무 좋다냥! 맘껏 놀 수 있겠다냥!", mondeeImg: "ImgCollectedMondee012-IOS"),
    Mondee(name: "깜냥먼디", description: "애용", mondeeImg: "ImgCollectedMondee013-IOS"),
    Mondee(name: "짱돌먼디", description: "우와 내가 찾던 돌이 여기 있었잖아\n잘 놔뒀다가 호신용으로 써야지", mondeeImg: "ImgCollectedMondee014-IOS"),
]
