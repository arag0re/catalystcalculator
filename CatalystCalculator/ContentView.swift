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
    @State var resetButton = "AC"
    
    ///func that resets different parameters depending on state of reset-button
    func resetAllValues(){
        if self.resetButton == "AC" {
            self.display = "0"
            self.clipboard = ""
            self.afterCalcReset()
            self.resetButton = "AC"
            print("all values were set to zero or empty String!")
        } else {
            self.display = "0"
            self.resetButton = "AC"
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
        } else if self.x != 0.0 && self.y == 0.0 {
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
            VStack{
            HStack {
                Spacer()
                Button(action: {
                self.resetAllValues()
                }){
                ButtonReset()
                Text(self.resetButton)
                    .offset(x: 0, y: -71)
                    .foregroundColor(.purple)
                    .font(.largeTitle)
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.plusMinusButtonPressed()
                }){
                ButtonPlusMinus()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.percentButtonPressed()
                }){
                ButtonPercent()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "div")
                }){
                ButtonDiv()
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "7"
                    } else {
                        self.display = self.display + "7"
                    }
                }){
                NumberSeven()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "8"
                    } else {
                        self.display = self.display + "8"
                    }
                }){
                NumberEight()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "9"
                    } else {
                        self.display = self.display + "9"
                    }
                }){
                NumberNine()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "mult")
                }){
                ButtonMult()
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                if self.display == "0" {
                    self.display = "4"
                } else {
                    self.display = self.display + "4"
                }
                }){
                NumberFour()
                }.foregroundColor(.black)
               Spacer()
                Button(action: {
                    self.resetButton = "C"
                if self.display == "0" {
                    self.display = "5"
                } else {
                    self.display = self.display + "5"
                }
                }){
                NumberFive()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                if self.display == "0" {
                    self.display = "6"
                } else {
                    self.display = self.display + "6"
                }
                }){
                NumberSix()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "sub")
                }){
                ButtonMinus()
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "1"
                    } else {
                        self.display = self.display + "1"
                    }}){
                NumberOne()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "2"
                    } else {
                        self.display = self.display + "2"
                    }
                }){
                NumberTwo()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.resetButton = "C"
                    if self.display == "0" {
                        self.display = "3"
                    } else {
                        self.display = self.display + "3"
                    }
                }){
                    NumberThree()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.operationButtonPressed(operation: "add")
                }){
                ButtonPlus()
                }.foregroundColor(.black)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if self.display == "0" {
                    
                    } else {
                        self.display = self.display + "0"
                    }
                }){
                NumberZero()
                }.foregroundColor(.black)
                Spacer()
                Text("")
                Spacer()
                Button(action: {
                    if !self.display.contains(".") {
                        self.display = self.display + "."
                    }
                }){
                ButtonCommata()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                self.equalsButtonPressed()
                }){
                ButtonEquals()
                }.foregroundColor(.black)
                Spacer()
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
