//
//  Button.swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct OPButton: View {
    var name: String
    var color: Color
    var x: CGFloat
    var y: CGFloat
    init(_ name: String,_ color: Color,_ x: CGFloat, _ y: CGFloat){
        self.name = name
        self.color = color
        self.x = x
        self.y = y
    }
    var body: some View {
        VStack{
            Image("Button")
                .clipShape(Circle())
                .overlay(Circle().stroke(self.color,lineWidth: 9))
                .shadow(radius: 5)
            Text(name)
                .offset(x: x, y: y)
                .foregroundColor(self.color)
                .font(.largeTitle)
        }
    }
}

struct OPButton_Previews: PreviewProvider {
    static var previews: some View {
        OPButton("=",.orange, 0,-71)
    }
}
