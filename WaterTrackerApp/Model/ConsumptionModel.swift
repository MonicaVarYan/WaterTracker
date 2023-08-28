//
//  ConsumptionModel.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-03.
//

import Foundation

struct Consumption: Codable, Identifiable {
    let id: Int
    var idBeverage: Int
    var icon: String
    var nameBeverage: String
    var date: Date
    var quantity: Int
//    let unit: String
}
