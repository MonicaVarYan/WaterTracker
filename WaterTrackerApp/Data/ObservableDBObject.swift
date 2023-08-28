//
//  ObservableDBObject.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-07.
//

import Foundation
import SwiftUI

class ObservableDBObject: ObservedObject {
    @Published var today: [Consumption] = []
}
