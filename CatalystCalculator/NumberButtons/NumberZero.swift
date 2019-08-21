//
//  NumberButtonCircleImage.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct NumberZero : View {
    var body: some View {
        VStack{
            Image("largeButton")    .clipShape(RoundedRectangle .init(cornerRadius: 33, style: .circular))
            .overlay(RoundedRectangle.init(cornerRadius: 33, style: .circular).stroke(Color.red,lineWidth: 19)
                .clipShape(RoundedRectangle.init(cornerRadius: 33, style: .circular)))
                .shadow(radius: 5)
            Text("0")
            .foregroundColor(.red)
            .offset(x: -33, y: -69)
            .font(.largeTitle)
        }
    }
}

#if DEBUG
struct NumberZero_Previews : PreviewProvider {
    static var previews: some View {
        NumberZero()
    }
}
#endif

