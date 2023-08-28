//
//  HomeView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-30.
//

import SwiftUI

struct HomeView: View {
    
    @State private var percent = 70.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State var timerTest : Timer?
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("BlueF")
                    .ignoresSafeArea(.all, edges: .all)
                
                VStack(spacing: 20){
                    
                    //Header
                    VStack{
                        Text("Add your consumption")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(Color("BlueP"))
                            .transition(.opacity)
                            .multilineTextAlignment(.center)
                        Text("Click + to add a new beverage")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(Color("BlueS"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    //Fill Glass animation
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: 200, height: 220)
                            .foregroundColor(Color.white)
                            .clipped()
                        
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .frame(width: 200, height: 220)
                        Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .opacity(0.5)
                            .frame(width: 200, height: 220)
                    }
                    .mask(
                        Image("EmptyGlass")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 200, height: 200)
                    )
                    
                    NavigationLink(destination: BeveragesListView(), label: {
                        HStack{
                            
                            Image("Add")
                                .renderingMode(.template)
                                .foregroundColor(Color("BlueP"))
                                .frame(width: 40, height: 40)
                            
                            
                            Text("Add")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color("BlueP"))
                        }
                        .controlSize(.large)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.clear)
                        
                    })
                    
                    Spacer()
                        .frame(height: 50)
                    
                }
                
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
                    self.waveOffset2 = Angle(degrees: -180)
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
