//
//  MondeeDrawModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import Foundation

/// [먼디 인덱스 : 먼디 뽑히는 비율]
let probabilities = [
    0 : 5,
    1 : 5,
    2 : 5,
    3 : 5,
    4 : 5,
    5 : 5,
    6 : 5,
    7 : 5,
    8 : 5,
    9 : 5,
    10 : 5,
    11 : 5,
    12 : 5,
    13 : 5,
    14 : 5
]

/// 먼디 뽑히는 비율 갯수로 배열을 재 생성 뒤 Random 으로 먼디 인덱스를 뽑는 함수
/// - Parameter distribution: [먼디 인덱스 : 먼디 뽑히는 비율]
/// - Returns: 랜덤으로 뽑힌 먼디 인덱스
func randomWithProbability(distribution: [Int : Int]) -> Int {
    
    var distributionArray: [Int] = []
    /// forEach를 사용하여 먼디 뽑히는 비율 만큼 반복해서 인덱스를 넣은 배열을 생성합니다.
    distribution.forEach { (key: Int, value: Int) in
        let new = Array(repeating: key, count: value)
        distributionArray.append(contentsOf: new)
    }
    let r = Int.random(in: 0..<distributionArray.count)
    return distributionArray[r]
}
