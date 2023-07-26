//
//  MondeeDrawView.swift
//  Mondee
//
//  Created by Hyunjun Kim on 2023/07/26.
//

import SwiftUI

struct MondeeDrawView: View {
    
    private var results: [Int]
        
        init() {
            results = [0,0,0,0,0,0]
            for _ in 0..<1000 {
                let i = randomWithProbability(distribution: probabilities)
                results[i-1] += 1
            }
        }
        
        var body: some View {
            
            VStack(alignment: .leading) {
                ForEach(results.indices, id: \.self) { i in
                    HStack {
                        Text("\(i + 1)")
                        Color.blue
                            .frame(width: CGFloat(results[i]), height: 40)
                    }
                }
            }
        }
}

struct MondeeDrawView_Previews: PreviewProvider {
    static var previews: some View {
        MondeeDrawView()
    }
}
