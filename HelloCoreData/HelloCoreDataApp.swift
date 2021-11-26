//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Gena Raster on 23.11.21.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
