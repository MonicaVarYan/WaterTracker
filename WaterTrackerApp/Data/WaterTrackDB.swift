//
//  WaterTrackDB.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-07.
//

import Foundation
import SQLite3
import SQLite

class WaterTrackDB{
    
    static let DIR_TASK_DB = "WaterDB"
    static let STORE_NAME = "water.sqlite3"
    
    private let consumptions = Table("consumptions")
    
    private let id = Expression<Int64>("id")
    private let idBeverage = Expression<Int64>("idBeverage")
    private let icon = Expression<String>("icon")
    private let nameBeverage = Expression<String>("nameBeverage")
    private let date = Expression<Date>("date")
    private let quantity = Expression<Int64>("quantity")
    
    static let shared = WaterTrackDB()
    
    private var db: Connection? = nil
    
    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(Self.DIR_TASK_DB)
            
            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                let dbPath = dirPath.appendingPathComponent(Self.STORE_NAME).path
                db = try Connection(dbPath)
                createTable()
                print("SQLiteDataStore init successfully at: \(dbPath) ")
            } catch {
                db = nil
                print("SQLiteDataStore init error: \(error)")
            }
        } else {
            db = nil
        }
    }
    
    private func createTable() {
        guard let database = db else {
            return
        }
        do {
            try database.run(consumptions.create { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(idBeverage)
                table.column(icon)
                table.column(nameBeverage)
                table.column(date)
                table.column(quantity)
            })
            print("Table Created...")
        } catch {
            print(error)
        }
    }
    
    func insert(idBeverage: Int64, icon: String, nameBeverage: String, date: Date, quantity: Int64){
        guard let database = db else { return }
        
        let insert = consumptions.insert(self.idBeverage <- idBeverage,
                                         self.icon <- icon,
                                         self.nameBeverage <- nameBeverage,
                                         self.date <- date,
                                         self.quantity <- quantity)
        do {
            _ = try database.run(insert)
        } catch {
            print(error)
        }
    }
    
    func getDayConsumption(todayDate: Date) -> [Consumption] { //Check select by date
        var result: [Consumption] = []
        guard let database = db else { return [] }
        
        do {
            for c in try database.prepare(self.consumptions) {
                result.append(Consumption(id: Int(c[id]), idBeverage: Int(c[idBeverage]), icon: c[icon], nameBeverage: c[nameBeverage], date:  c[date], quantity: Int(c[quantity])))
            }
        }
        catch {
            print(error)
        }
        return result
    }
}
