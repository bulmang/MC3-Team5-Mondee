//
//  MondeeDrawModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import Foundation

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

func randomWithProbability(distribution: [Int : Int]) -> Int {
    
    var distributionArray: [Int] = []
    distribution.forEach { (key: Int, value: Int) in
        let new = Array(repeating: key, count: value)
        distributionArray.append(contentsOf: new)
    }
    let r = Int.random(in: 0..<distributionArray.count)
    return distributionArray[r]
}
