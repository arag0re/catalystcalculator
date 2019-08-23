//
//  ButtonPlusMinus .swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct ButtonPlusMinus: View {
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple,lineWidth: 9))
                .shadow(radius: 5)
            Text("+/-")
                .offset(x: 0, y: -71)
                .foregroundColor(.purple)
                .font(.largeTitle)
        }
    }
}

struct ButtonPlusMinus_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlusMinus()
    }
}
