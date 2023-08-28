//
//  AdjustSizeView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-30.
//

import SwiftUI

struct AdjustSizeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var db = WaterTrackDB.shared
    
    @State private var ml = 250
    @State private var presentAlertUp = false
    @State private var presentAlertDown = false
    
    var beverageSelected: Beverage
    
    var body: some View {
        ZStack{
            Color("BlueF")
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                
                Text("Add your consumption")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BlueP"))
                    .transition(.opacity)
                    .multilineTextAlignment(.center)
                Text("Adjust the size using the arrows")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(Color("BlueS"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                //Up Button
                Button(action: {
                    if( ml >= 0 && ml < 2000){
                        ml += 50
                    }
                    else {
                        presentAlertUp = true
                    }
                    
                }) {
                    Image("Up")
                        .renderingMode(.template)
                        .scaledToFill()
                        .foregroundColor(Color("BlueP"))
                    
                } //: BUTTON
                .frame(width: 100, height: 100, alignment: .center)
                .accentColor(Color.white)
                .alert("Limit reached", isPresented: $presentAlertUp, actions: {
                    // actions
                }, message: {
                    Text("Your limit is 2000 ml")
                })
                
                //Label
                Text("\(ml) ml")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BlueA"))
                    .transition(.opacity)
                    .multilineTextAlignment(.center)
                
                //Down Button
                Button(action: {
                    if( ml >= 50 && ml <= 2000){
                        ml -= 50
                    }
                    else {
                        presentAlertDown = true
                    }
                    
                }) {
                    Image("Down")
                        .renderingMode(.template)
                        .scaledToFill()
                        .foregroundColor(Color("BlueP"))
                    
                } //: BUTTON
                .frame(width: 100, height: 100, alignment: .center)
                .accentColor(Color.white)
                .alert("Limit reached", isPresented: $presentAlertDown, actions: {
                    // actions
                }, message: {
                    Text("The limit is 0")
                })
                
                Text(beverageSelected.name)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(Color("BlueS"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                //Done Button
                Button(action: {
                    db.insert(idBeverage: Int64(beverageSelected.id), icon: beverageSelected.icon, nameBeverage: beverageSelected.name, date: Date(), quantity: Int64(ml))
                    
                    dismiss()
                }) {
                    Text("DONE")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                } //: BUTTON
                .frame(width: 160, height: 80, alignment: .center)
                .accentColor(Color("BlueP"))
                .background(
                    Capsule().strokeBorder(Color("BlueP"), lineWidth: 1.25)
                )
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct AdjustSizeView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustSizeView(beverageSelected: beverageData[0])
    }
}
