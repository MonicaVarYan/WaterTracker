//
//  OnboardingView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-30.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var percent = 90.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State private var waveOffset3 = Angle(degrees: 250)
    @State var timerTest : Timer?
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0.0
    
    @State private var getStarted: Bool = false
    
    var body: some View {
        VStack {
            //Header
            VStack{
                Text("WATER")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("BlueP"))
                    .padding()
                Text("TRACK APP")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("BlueP"))
            }
            
            //Center
            ZStack{
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                    .fill(Color("BlueP"))
                    .opacity(0.8)
                
                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/100)
                    .fill(Color("BlueP"))
                    .opacity(0.5)
                
                Wave(offset: Angle(degrees: self.waveOffset3.degrees), percent: Double(percent)/100)
                    .fill(Color("BlueP"))
                    .opacity(0.3)
                
                //Fancy Button
                ZStack(alignment: .center){
                    
                    //Buton Background
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    //2 call to action static
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    
                    //3 capsule dynamic width
                    
                    HStack {
                        Capsule()
                            .fill(Color("BlueA"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    //                        NavigationLink("") {
                    HStack {
                        
                        ZStack {
                            Circle()
                                .fill(Color("BlueA"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                            getStarted = true
                                            
                                            
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .offset(y: 0)
                
            }
        }
        
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
                self.waveOffset3 = Angle(degrees: 90)
            }
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
