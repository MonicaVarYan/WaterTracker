//
//  BeveragesListView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-30.
//

import SwiftUI

struct BeveragesListView: View {
    var beverages: [Beverage] = beverageData
    
    init() {

        UINavigationBar.appearance().tintColor = UIColor(named: "BlueA")

        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "BlueA") ?? .black]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "BlueA") ?? .black]
    }
    
    var body: some View {
        ZStack{
            Color("BlueF")
                .ignoresSafeArea(.all, edges: .all)
            
            NavigationStack{
                List{
                    ForEach(beverages.shuffled()) { item in
                        NavigationLink(destination: AdjustSizeView(beverageSelected: item)) {
                            BeverageRowView(beverage: item)
                                .padding(.vertical, 2)
                        }
                    }
                }
                .background(Color("BlueF"))
                .scrollContentBackground(.hidden)
                .navigationTitle("Beverages")
                .foregroundColor(Color("BlueA"))
            }
        }
    }
}

struct BeveragesListView_Previews: PreviewProvider {
    static var previews: some View {
        BeveragesListView()
    }
}
