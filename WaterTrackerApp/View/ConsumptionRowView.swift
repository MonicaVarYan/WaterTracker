//
//  ConsumptionRowView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-07.
//

import SwiftUI

struct ConsumptionRowView: View {
    var consumption: Consumption
    var body: some View {
        HStack{
            Image(consumption.icon)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
            VStack(alignment: .leading, spacing: 5){
                Text(consumption.nameBeverage)
                    .font(.title)
                Text(itemFormatter.string(from: consumption.date))
                  .font(.caption)
                  .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            Text("\(consumption.quantity) ml")
                .font(.title)
        }
        
    }
}

struct ConsumptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumptionRowView(consumption: Consumption(id: 1, idBeverage: 1, icon: "Water", nameBeverage: "Water", date: Date(), quantity: 500))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
