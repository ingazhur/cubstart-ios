//
//  ContentView.swift
//  waitlisthelper
//
//  Created by Jordan Yee on 1/19/22.
//
import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
        //YOUR CODE HERE (NavView)//
        NavigationView {
            TabView {
                ZStack {
                    //(background)//
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        //(title)//
                        Text("WILL YOU GET OFF THE WAITLIST?").font(.system(size: 35)).bold()
                        Spacer()
                        HStack {
                            //(description)//
                            Text("Place on Waitlist:")
                            Text(String(Int(waitlistPlace)))
                            Spacer()
                        }
                        //(slider)//
                        Slider(value: $waitlistPlace, in: 0...200 , step: 1 ).padding(.leading, 20)
                       
                        HStack {
                            //(description)//
                            Text("Class size:")
                            Text(String(Int(classSize)))
                            Spacer()
                        }
                        //(slider)//
                        Slider(value: $classSize, in: 0...1000 , step: 1 ).padding(.leading, 20)
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("CALCULATE") {
                            //(calculate)//
                            calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                            
                            text = getFeedbackText()
                            calculate = true
                        } .buttonStyle(CustomButton())
                        
                        Spacer()
                        
                    } .padding()
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                //DIY VIEW GOES HERE//
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Spacer()
                            Text("HISTORY")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.black)
                                .padding()
                            Spacer()
                        } .padding()

                        Spacer()
                        }

                } .tabItem {
                        Image(systemName: "book")
                        Text("History")
                }
            }
        }
    }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        let tenth = classSize / 10
        if  (waitlistPlace <= tenth) {
            probability = 100
        } else if (waitlistPlace > tenth * 2) {
            probability = 0
        } else {
            probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
        }
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //(button back)//
                    Button(action: {
                                    self.presentation.wrappedValue.dismiss()
                                  }) {
                                  Image(systemName: "arrow.left")
                                      .foregroundColor(.white)
                                  }
                                  .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
