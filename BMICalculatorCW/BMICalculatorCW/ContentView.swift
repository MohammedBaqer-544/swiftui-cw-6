//
//  ContentView.swift
//  BMICalculatorCW
//
//  Created by Mohammed on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi: String = ""
    @State var bmiStatus: UIImage = UIImage(imageLiteralResourceName: "coco")
    @State var bmiFunny: String = ""
    
    var body: some View {
        VStack {
            Image("bg")
                .resizable()
                .frame(width: 420, height: 200.0)
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack {
                Image("weight-scale")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("حاسبة الاحباط")
                    .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 70))
                
                TextField("Height", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.custom("AndikaNewBasic-Regular", size: 20))
                
                TextField("Weight", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.custom("AndikaNewBasic-Regular", size: 20))
                
                Button("اصدمني") {
                    
                    let h = Double(height) ?? 0.0
                    let w = Double(weight) ?? 0.0
                    
                    bmi = String(format: "%.1f", w / (h * h))
                    
                    if Double(bmi) ?? 0.0 <= 20.0 {
                        bmiStatus = UIImage(imageLiteralResourceName: "coco")
                        bmiFunny = "عود يدق العود"
                        
                    } else if Double(bmi) ?? 0.0 <= 25.0 {
                        bmiStatus = UIImage(imageLiteralResourceName: "warrior")
                        
                        bmiFunny = "كيتو ماستر"
                        
                    } else {
                        bmiStatus = UIImage(imageLiteralResourceName: "elephant")
                        
                        bmiFunny = "بو تمبة كسر اللمبة"
                        
                    }
                    
                }
                .padding(.bottom, 200)
                
            }
            .padding(.horizontal)
            
            VStack {
            Image(uiImage: bmiStatus)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            Text(bmiFunny)
                .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 50))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
