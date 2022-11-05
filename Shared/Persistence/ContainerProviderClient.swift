//
//  ContainerProviderClient.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 05.11.2022.
//

import CoreData

struct ContainerProviderClient {
    let persistentContainer: NSPersistentContainer
}

extension ContainerProviderClient {
    static let live = Self(
        persistentContainer: livePersistentContainer
    )
    
    //todo переписать
    private static var livePersistentContainer: NSPersistentContainer {
      let container = NSPersistentContainer(name: "FaveFlicks")
      container.loadPersistentStores { _, error in
        if let error = error as NSError? {
          // You should add your own error handling code here.
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // The context couldn't be saved.
                // You should add your own error handling here.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
