//
//  Number.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct Number : View {
    var name: String
    init(_ name: String){
        self.name = name
    }
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red,lineWidth: 9))
                .shadow(radius: 5)
            Text(name)
                .offset(x: 0, y: -68)
                .foregroundColor(.red)
                .font(.largeTitle)
        }
    }
}

#if DEBUG
struct Number_Previews : PreviewProvider {
    static var previews: some View {
        Number("8")
    }
}
#endif
