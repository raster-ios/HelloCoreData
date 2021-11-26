//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Gena Raster on 26.11.21.
//

import Foundation
import CoreData
import Metal

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init () {
        //MARK: - Initialize Model and load store

        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func saveMovie(title: String) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save moive \(error)")
        }
        
    }
    
}
