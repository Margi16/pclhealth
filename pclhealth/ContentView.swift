//
//  ContentView.swift
//  pclhealth
//
//  Created by Margi  Bhatt on 23/07/22.
//

import SwiftUI
import SlidingRuler

struct ProgressBar: View {
    @Binding var value: Float
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width,geometry.size.width), height: geometry.size.height, alignment: .center)
                    .background(Color.mint)
                    .animation(.linear, value: value)
            }
            .cornerRadius(45.0)
            
        }
    }
}

struct ContentView: View {
    @State private var height: Double = 0
    @State private var cm: Bool = true
    @State private var inch: Bool = true
    @State var progressValue: Float = 0.3
    var measurementcm: String = "cm"
    var measurementinch: String = "inch"
    var body: some View {
        VStack {
            Text("Complete your Profile")
                .padding()
                .font(.largeTitle)
            Text("Adding these details will help us better understand your medical condition").padding().foregroundColor(.gray)
            VStack {
                Text("HEIGHT")
            switch(cm){
                case true:
                    Toggle("\(measurementcm)", isOn: $cm).padding()
                case false:
                    Toggle("\(measurementinch)", isOn: $cm).padding()
                }
            }
            SlidingRuler(value: $height, step: 10).padding()
            Spacer()
            
            
            Divider()
            VStack{
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Profile Completion").frame(width: 200, height: 20, alignment: .leading).font(.body)
                            .padding()
                        Spacer()
                })
                HStack {
                    Text("\(Int(round(progressValue*100)))%").foregroundColor(.mint).padding()
                    ProgressView(value: progressValue).frame( height: 20).padding()
                }
                Divider()
            }.frame(width: 400, height: 50, alignment: .center)
//            .border(.gray, width: 1)
                .padding()
//                .shadow(color: .gray, radius: 10, x: 0, y: 0)
           
            HStack{
                Button {
                    print("button pressed")
                } label: {
                    Text("Next").padding().frame(width: 300, height: 40, alignment: .center)
                }.background(Color.mint)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding()
                    .foregroundColor(.white)
                    .buttonStyle(.bordered)
                    .frame(width: 300, height: 40, alignment: .center)
            }
//            .background(Color.red)
            .frame(width: 600, height: 100, alignment: .center)

        }
        
    }
    
    func startProgressBar() {
        for _ in 0...80 {
            self.progressValue = 0.300
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
