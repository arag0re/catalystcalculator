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
    
    func resetAllValues(){
        self.display = "0"
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
                Button(action: {self.resetAllValues()}){
                        ButtonReset()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {}){
                        ButtonPlusMinus()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {}){
                        ButtonPercent()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {}){
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
                Button(action: {}){
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
                Button(action: {}){
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
                Button(action: {}){
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
                    if !self.display.contains(",") {
                        self.display = self.display + ","
                    }
                }){
                        ButtonCommata()
                }.foregroundColor(.black)
                Spacer()
                Button(action: {}){
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
