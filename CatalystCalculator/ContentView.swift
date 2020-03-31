//
//  ContentView.swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    ///all variables needed for catalystcalculator
    @State var display = "0"
    @State var x = 0.0
    @State var y = 0.0
    @State var clipboard = ""
    @State var name: String = "AC"
    
    ///func that resets different parameters depending on state of reset-button
    func resetAllValues(){
        if self.name == "AC" {
            self.display = "0"
            self.clipboard = ""
            self.afterCalcReset()
            print("all values were set to zero or empty String!")
        } else {
            self.display = "0"
            self.name = "AC"
            print("reset displayvalue to zero")
        }
    }
    
    ///reset the calc-variables so that the intialization doesn't go wrong
    func afterCalcReset(){
        self.x = 0.0
        self.y = 0.0
    }
    
    ///function for calculating the result for each operation
    func setOperation(operation: String) -> Double {
        var returnval: Double?
        if self.x != 0.0 && self.y != 0.0 {
            switch(operation){
                case "add": returnval = (self.x + self.y); print("\(self.x) +  \(self.y) = \(returnval!)"); self.afterCalcReset();
                case "sub": returnval = (self.x - self.y); print("\(self.x) - \(self.y) = \(returnval!)"); self.afterCalcReset();
                case "div": returnval = (self.x / self.y); print("\(self.x) / \(self.y) = \(returnval!)"); self.afterCalcReset();
                case "mult": returnval = (self.x * self.y); print("\(self.x) x \(self.y) = \(returnval!)"); self.afterCalcReset();
                default: break
            }
        }
        return returnval!
    }
    

    func plusMinusButtonPressed(){
        if !self.display.contains("-") && self.display != "" {
            self.display = "-" + self.display
        } else if self.display.contains("-") {
            self.display = self.display.replacingOccurrences(of: "-", with: "" , options: .literal, range: nil)
        }
    }
    
    func percentButtonPressed() {
        if  self.y == 0.0 && self.x == 0.0 {
            self.x = Double(self.display)!
            self.y = 100.0
            var str = "\(self.setOperation(operation: "div"))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
            }
            self.display = str
        }
    }
    
    func operationButtonPressed(operation: String) {
        self.clipboard = operation
        if self.x == 0.0 && self.y == 0.0 {
            self.x = Double(self.display)!
            self.display = "0"
        } else if self.x != 0.0 && self.y == 0.0 && self.display != "0" {
            self.y = Double(self.display)!
            var str = "\(self.setOperation(operation: operation))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
            }
            self.display = str
        }
    }
    
    func equalsButtonPressed() {
        if self.x != 0.0 && self.y == 0.0 {
            self.y = Double(self.display)!
            var str = "\(self.setOperation(operation: self.clipboard))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
            }
            self.display = str
        }
    }
    
    func numberButton(num: String){
        self.name = "C"
        if self.display == "0" || self.display == "-0" {
            self.display = self.display.replacingOccurrences(of: "0", with: num , options: .literal, range: nil)
        } else {
            self.display = self.display + num
        }
    }
    
    var body: some View {
       
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(self.display)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
            Spacer()
            Text("")
            Spacer()
            Text("")
            Spacer()
            HStack {
            VStack {
            HStack {
                Spacer()
                Button(action: {
                self.resetAllValues()
                }){
                ButtonReset(name: self.$name)
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.plusMinusButtonPressed()
                }){
                OPButton("+/-",.purple,0,-71)
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.percentButtonPressed()
                }){
                OPButton("%",.purple,0,-71)
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "div")
                }){
                OPButton("/", .orange,0,-71)
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                self.numberButton(num: "7")
                }){
                Number("7")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.numberButton(num: "8")
                }){
                Number("8")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.numberButton(num: "9")
                }){
                Number("9")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "mult")
                }){
                OPButton("x", .orange,0,-71)
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                self.numberButton(num: "4")
                }){
                Number("4")
                }.foregroundColor(.black)
               Spacer()
                Button(action: {
                self.numberButton(num: "5")
                }){
                Number("5")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.numberButton(num: "6")
                }){
                Number("6")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "sub")
                }){
                OPButton("-", .orange,0,-71)
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                self.numberButton(num: "1")
                }){
                Number("1")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.numberButton(num: "2")
                }){
                Number("2")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.numberButton(num: "3")
                }){
                Number("3")
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "add")
                }){
                OPButton("+", .orange,0,-71)
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if self.display == "0" || self.display == "-0"{
                    
                    } else {
                        self.display = self.display + "0"
                    }
                }){
                NumberZero("0", .red)
                }.foregroundColor(.black)
                Spacer()
                Text("")
                Spacer()
                Button(action: {
                    if !self.display.contains(".") {
                        self.display = self.display + "."
                    }
                }){
                OPButton(",", .red, 0, -73)
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.equalsButtonPressed()
                }){
                OPButton("=", .orange,0,-71)
                }.foregroundColor(.black)
                Spacer()
                    }
                }
            }
        }.background(Color.black)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
