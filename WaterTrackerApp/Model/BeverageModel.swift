//
//  BeverageModel.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-03.
//

import Foundation

struct Beverage: Codable, Identifiable {
    let id: Int
    let name: String
    let icon: String
    let color: String
}
