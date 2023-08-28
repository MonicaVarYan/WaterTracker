//
//  SettingsView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-30.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            Color("BlueF")
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                GroupBox(label: SettingsHeaderView(labelText: "Restart", labelImage: "info.circle")
                ) {
                  Divider().padding(.vertical, 4)
                  
                  Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                    .padding(.vertical, 8)
                    .frame(minHeight: 60)
                    .layoutPriority(1)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    
                    Text("IMPORTANT: This restart will not delete the data saved")
                      .padding(.vertical, 8)
                      .bold()
                      .frame(minHeight: 60)
                      .layoutPriority(1)
                      .font(.footnote)
                      .multilineTextAlignment(.leading)
                  
                  Toggle(isOn: $isOnboardingViewActive) {
                    if isOnboardingViewActive {
                      Text("Restarted".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    } else {
                      Text("Restart".uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(Color.secondary)
                    }
                  }
                  .padding()
                  .background(
                    Color(UIColor.tertiarySystemBackground)
                      .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                  )
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
