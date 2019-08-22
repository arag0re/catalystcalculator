//
//  ContentView.swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var display = "0"
    @State var x = 0.0
    @State var y = 0.0
    @State var clipboard = ""
    

    
    func resetAllValues(){
        self.display = "0"
        self.clipboard = ""
        self.afterCalcReset()
    }
    
    func afterCalcReset(){
        self.x = 0.0
        self.y = 0.0
    }
    
    func setOperation(operation: String) -> Double {
        var returnval: Double?
        if self.x != 0.0 && self.y != 0.0 {
            switch(operation){
                case "add": returnval = (self.x + self.y); self.afterCalcReset();
                case "sub": returnval = (self.x - self.y); self.afterCalcReset()
                case "div": returnval = (self.x / self.y); self.afterCalcReset()
                case "mult": returnval = (self.x * self.y); self.afterCalcReset()
                default: break
            }
        }
        return returnval!
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(self.display)
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.resetAllValues()
                    print("all values were set to zero or empty String!")
                }){
                    ButtonReset()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    if !self.display.contains("-") && self.display != "" {
                        self.display = "-" + self.display
                    } else if self.display.contains("-") {
                        self.display = self.display.replacingOccurrences(of: "-", with: "" , options: .literal, range: nil)
                    }
                }){
                    ButtonPlusMinus()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    if  self.y == 0.0 && self.x == 0.0 {
                        self.x = Double(self.display)!
                        self.y = 100.0
                        var str = "\(self.setOperation(operation: "div"))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                    ButtonPercent()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.clipboard = "div"
                    if self.x == 0.0 && self.y == 0.0 {
                        self.x = Double(self.display)!
                        self.display = "0"
                    } else if self.x != 0.0 && self.y == 0.0 {
                        self.y = Double(self.display)!
                        var str = "\(self.setOperation(operation: "div"))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                    ButtonDiv()
                }.foregroundColor(.black)
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
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
                    self.clipboard = "mult"
                    if self.x == 0.0 && self.y == 0.0 {
                        self.x = Double(self.display)!
                        self.display = "0"
                    } else if self.x != 0.0 && self.y == 0.0 {
                        self.y = Double(self.display)!
                        var str = "\(self.setOperation(operation: "mult"))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                        ButtonMult()
                }.foregroundColor(.black)
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
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
                    self.clipboard = "sub"
                    if self.x == 0.0 && self.y == 0.0 {
                        self.x = Double(self.display)!
                        self.display = "0"
                    } else if self.x != 0.0 && self.y == 0.0 {
                        self.y = Double(self.display)!
                        var str = "\(self.setOperation(operation: "sub"))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                        ButtonMinus()
                }.foregroundColor(.black)
                
                Spacer()
            }
           
            HStack {
                Spacer()
                Button(action: {if self.display == "0" {
                        self.display = "1"
                    } else {
                        self.display = self.display + "1"
                    }}){
                        NumberOne()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {
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
                    self.clipboard = "add"
                    if self.x == 0.0 && self.y == 0.0 {
                        self.x = Double(self.display)!
                        self.display = "0"
                    } else if self.x != 0.0 && self.y == 0.0 {
                        self.y = Double(self.display)!
                        var str = "\(self.setOperation(operation: "add"))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                        ButtonPlus()
                }.foregroundColor(.black)
                Spacer()
            }
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
                    if self.x != 0.0 && self.y == 0.0 {
                        self.y = Double(self.display)!
                        var str = "\(self.setOperation(operation: self.clipboard))"
                        if str.suffix(2) == ".0" {
                            str = str.replacingOccurrences(of: ".0", with: "" , options: .literal, range: nil)
                        }
                        self.display = str
                    }
                }){
                        ButtonEquals()
                }.foregroundColor(.black)
                Spacer()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
