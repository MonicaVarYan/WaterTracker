//
//  ConsumptionListView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-07.
//

import SwiftUI

struct ConsumptionListView: View {
    var dayConsumption: [Consumption] = []
    
//    private var db = WaterTrackDB.shared
//
//    private func getConsumption() -> [Consumption] {
//        var today: [Consumption] = []
//        today = db.getDayConsumption(todayDate: Date())
//        return today
//    }
    
    init(today: [Consumption]) {
        self.dayConsumption = today
    }
    
    var body: some View {
        ZStack{
            Color("BlueF")
                .ignoresSafeArea(.all, edges: .all)
            VStack (spacing: 20){
                Text("This is your consumption for the day")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BlueP"))
                    .multilineTextAlignment(.center)
                
                List{
                    ForEach(dayConsumption) { item in
                        ConsumptionRowView(consumption: item)
                            .padding(.vertical, 2)
                    }
                }
                .background(Color("BlueF"))
                .scrollContentBackground(.hidden)
                .foregroundColor(Color("BlueA"))
            }
        }
    }
}

struct ConsumptionListView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumptionListView(today: [])
    }
}
