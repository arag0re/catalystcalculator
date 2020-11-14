//
//  ContentView.swift
//  CatalystCalculator
//
//  Created by Anton Stadie on 21.08.19.
//  Copyright © 2019 Anton Stadie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    /// all variables needed for catalystcalculator
    @State var display: String = "0"
    @State var displayCopy: String = "0"
    @State var backup: String = "0"
    @State var x = 0.0
    @State var y = 0.0
    @State var clipboard = ""
    @State var name: String = "AC"

    /// func that resets different parameters depending on state of reset-button
    func resetAllValues() {
        if name == "AC" {
            displayCopy = "0"
            display = "0"
            clipboard = ""
            afterCalcReset()
            print("all values were set to zero or empty String!")
        } else {
            displayCopy = backup
            display = "0"
            name = "AC"
            print("reset displayvalue to zero")
        }
    }

    /// reset the calc-variables so that the intialization doesn't go wrong
    func afterCalcReset() {
        x = 0.0
        y = 0.0
    }

    /// function for calculating the result for each operation
    func setOperation(operation: String) -> Double {
        var returnval: Double?
        if x != 0.0 && y != 0.0 {
            switch operation {
            case "add": returnval = (x + y); print("\(x) +  \(y) = \(returnval!)"); afterCalcReset()
            case "sub": returnval = (x - y); print("\(x) - \(y) = \(returnval!)"); afterCalcReset()
            case "div": returnval = (x / y); print("\(x) / \(y) = \(returnval!)"); afterCalcReset()
            case "mult": returnval = (x * y); print("\(x) x \(y) = \(returnval!)"); afterCalcReset()
            default: break
            }
        }
        backup = String(returnval!).replacingOccurrences(of: ".0", with: "", options: .literal, range: nil)
        return returnval!
    }

    func plusMinusButtonPressed() {
        if !display.contains("-"), display != "" {
            display = "-" + display
            displayCopy = display
        } else if display.contains("-") {
            display = display.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
            displayCopy = display
        }
    }

    func percentButtonPressed() {
        if y == 0.0, x == 0.0 {
            x = Double(display)!
            y = 100.0
            var str = "\(setOperation(operation: "div"))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "", options: .literal, range: nil)
            }
            display = str
            displayCopy = str
        }
    }

    func operationButtonPressed(operation: String) {
        clipboard = operation
        if x == 0.0, y == 0.0 {
            x = Double(display)!
            display = "0"
        } else if x != 0.0, y == 0.0, display != "0" {
            y = Double(display)!
            var str = "\(setOperation(operation: operation))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "", options: .literal, range: nil)
            }
            display = str
            displayCopy = display
        }
    }

    func equalsButtonPressed() {
        if x != 0.0, y == 0.0 {
            y = Double(display)!
            var str = "\(setOperation(operation: clipboard))"
            if str.suffix(2) == ".0" {
                str = str.replacingOccurrences(of: ".0", with: "", options: .literal, range: nil)
            }
            display = str
            displayCopy = display
        }
    }

    func numberButton(num: String) {
        name = "C"
        if display == "0" || display == "-0" {
            display = display.replacingOccurrences(of: "0", with: num, options: .literal, range: nil)
            displayCopy = display
        } else {
            display = display + num
            displayCopy = display
        }
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                Text(self.displayCopy)
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            Spacer()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 166, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                VStack(spacing: -20) {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.resetAllValues()
                        }) {
                            ButtonReset(name: self.$name)
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.plusMinusButtonPressed()
                        }) {
                            OPButton("+/-", .purple, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.percentButtonPressed()
                        }) {
                            OPButton("%", .purple, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.operationButtonPressed(operation: "div")
                        }) {
                            OPButton("/", .orange, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 33, height: -30, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                    HStack {
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "7")
                        }) {
                            Numbers("7")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "8")
                        }) {
                            Numbers("8")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "9")
                        }) {
                            Numbers("9")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.operationButtonPressed(operation: "mult")
                        }) {
                            OPButton("x", .orange, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: -30, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                    HStack {
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "4")
                        }) {
                            Numbers("4")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "5")
                        }) {
                            Numbers("5")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "6")
                        }) {
                            Numbers("6")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.operationButtonPressed(operation: "sub")
                        }) {
                            OPButton("-", .orange, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: -20, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                    HStack {
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "1")
                        }) {
                            Numbers("1")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "2")
                        }) {
                            Numbers("2")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.numberButton(num: "3")
                        }) {
                            Numbers("3")
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.operationButtonPressed(operation: "add")
                        }) {
                            OPButton("+", .orange, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: -40, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                    HStack {
                        Spacer()
                        Button(action: {
                            if self.display == "0" || self.display == "-0" {
                            } else {
                                self.display = self.display + "0"
                            }
                        }) {
                            Zero("0", .red)
                        }.foregroundColor(.black)
                        Spacer()
                        Text("")
                        Spacer()
                        Button(action: {
                            if !self.display.contains(".") {
                                self.display = self.display + "."
                            }
                        }) {
                            OPButton(",", .red, 0, -73)
                        }.foregroundColor(.black)
                        Spacer()
                        Button(action: {
                            self.equalsButtonPressed()
                        }) {
                            OPButton("=", .orange, 0, -71)
                        }.foregroundColor(.black)
                        Spacer()
                    }
                }
                Spacer()
            }
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
