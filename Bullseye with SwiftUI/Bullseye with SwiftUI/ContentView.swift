//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI


struct ContentView: View {
    @State private var initSliderVal: Double = 50.0
    @State var toggle = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
                .padding(.trailing, 20)
            }
            Spacer()
            
            Text("Move the slider to:").font(.system(size: 30))
            Text("25").font(.system(size: 30))
            
            Slider(value: $initSliderVal, in: 0...100).padding(.leading, 20).padding(.trailing, 20)
            Button {
            } label: {
                Text("Check")
            }
            Spacer()
            
            Text("Exact mode?")
            Toggle("", isOn: $toggle).padding(.trailing, 170)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
