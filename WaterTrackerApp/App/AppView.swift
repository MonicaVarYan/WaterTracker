//
//  AppView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-02.
//

import SwiftUI

//class StateManager : ObservableObject {
////    @Published var today:[Consumption] = []
//}

struct AppView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
//    @ObservedObject var todayList = StateManager()
    private var db = WaterTrackDB.shared
    
//    private func getConsumption() -> [Consumption] {
//        todayList.today = db.getDayConsumption(todayDate: Date())
//        return todayList.today
//    }
        private func getConsumption() -> [Consumption] {
            var today: [Consumption] = []
            today = db.getDayConsumption(todayDate: Date())
            return today
        }
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem({
                    Image("Drop")
                        .renderingMode(.template)
                    Text("Home")
                })
            ConsumptionListView(today: getConsumption())
                .tabItem({
                    Image("Calendar")
                        .renderingMode(.template)
                    Text("Today")
                })
                .refreshable {
                    ConsumptionListView(today: getConsumption())
                }
                
            SettingsView()
                .tabItem({
                    Image("Settings")
                        .renderingMode(.template)
                    Text("Settings")
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
