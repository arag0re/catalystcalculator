//
//  NumberButtonCircleImage.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct NumberThree : View {
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black,lineWidth: 9))
                .shadow(radius: 5)
            Text("3")
                .offset(x: 0, y: -68)
                .foregroundColor(.white)
                .font(.largeTitle)  
        }
    }
}

#if DEBUG
struct NumberThree_Previews : PreviewProvider {
    static var previews: some View {
        NumberThree()
    }
}
#endif

