//
//  RecordView.swift
//  Mondee
//
//  Created by hyunjun on 2023/07/20.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        ZStack{
            Color("ColorBgLight")
            VStack{
                RecordTitleArea()
            }
            
        }
        .ignoresSafeArea()
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
