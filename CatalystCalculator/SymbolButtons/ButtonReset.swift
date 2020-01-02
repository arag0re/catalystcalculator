//
//  ButtonReset.swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct ButtonReset: View {
    @State var name: String = "AC"
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray ,lineWidth: 9))
                .shadow(radius: 5)
            
        }
    }
}

struct ButtonReset_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReset()
    }
}
