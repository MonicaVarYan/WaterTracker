//
//  BeverageRowView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-03.
//

import SwiftUI

struct BeverageRowView: View {
    var beverage: Beverage
    
    var body: some View {
        HStack{
            Image(beverage.icon)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
            VStack(alignment: .trailing){
                Text(beverage.name)
                    .font(.title)
            }
            Spacer()
        }
    }
}

struct BeverageRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeverageRowView(beverage: beverageData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
