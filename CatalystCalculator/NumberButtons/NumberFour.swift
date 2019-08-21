//
//  NumberButtonCircleImage.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct NumberFour : View {
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.red,lineWidth: 9))
                .shadow(radius: 5)
            Text("4")
            .offset(x: 0, y: -68)
            .foregroundColor(.red)
            .font(.largeTitle)
        }
    }
}

#if DEBUG
struct Numberfour_Previews : PreviewProvider {
    static var previews: some View {
        NumberFour()
    }
}
#endif

