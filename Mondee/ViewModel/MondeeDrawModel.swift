//
//  MondeeDrawModel.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import Foundation

let probabilities = [
    1 : 10,
    2 : 20,
    3 : 30,
    4 : 35,
    5 : 5,
    6 : 10,
    7 : 10,
    8 : 10
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
