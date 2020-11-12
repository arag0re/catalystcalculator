//
//  NumberButtonCircleImage.swift
//  easyCalculator
//
//  Created by Anton Stadie on 03.07.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct Zero: View {
    var name: String
    var color: Color
    init(_ name: String, _ color: Color) {
        self.name = name
        self.color = color
    }

    var body: some View {
        VStack {
            Image("largeButton")
                .clipShape(RoundedRectangle(cornerRadius: 33, style: .circular))
                .overlay(RoundedRectangle(cornerRadius: 33, style: .circular)
                    .stroke(self.color, lineWidth: 19)
                    .clipShape(RoundedRectangle(cornerRadius: 33, style: .circular)))
                .shadow(radius: 5)
            Text(name)
                .foregroundColor(self.color)
                .offset(x: -33, y: -69)
                .font(.largeTitle)
        }
    }
}

#if DEBUG
    struct Zero_Previews: PreviewProvider {
        static var previews: some View {
            Zero("0", .red)
        }
    }
#endif
