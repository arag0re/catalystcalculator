//
//  NumberButtonCircleImage.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct NumberEight : View {
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black,lineWidth: 9))
                .shadow(radius: 5)
            Text("8")
                .offset(x: 0, y: -68)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

#if DEBUG
struct NumberEight_Previews : PreviewProvider {
    static var previews: some View {
        NumberEight()
    }
}
#endif
