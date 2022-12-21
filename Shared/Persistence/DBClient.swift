//
//  DBClient.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 05.11.2022.
//

import CoreData

// TODO: Remove all fatalError
// TODO: Rewrite clear all

struct DBClient {
    let put: (_ object: DBPuttable) -> ()
    let saveChanges: () -> ()
    let fetch: AnyDBFetcher
    let clearAll: (String) -> ()
}

extension DBClient {
    static let live = Self(
        put: { object in
            object.put(in: Self.livePersistentContainer.viewContext)
            do {
                try Self.livePersistentContainer.viewContext.save()
            } catch {
                fatalError("Container saving \(error)")
            }
        },
        saveChanges: {
            do {
                try livePersistentContainer.viewContext.save()
            } catch {
                fatalError("Container saving \(error)")
            }
        },
        fetch: DBFetcher(),
        clearAll: { name in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: name)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try livePersistentContainer.viewContext.execute(deleteRequest)
            } catch {
                fatalError("Container deleting \(error)")
            }
        }
     )
}

// MARK: - Container
extension DBClient {
    fileprivate static let livePersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Loading persistent store \(error)")
            }
        }
        return container
    }()
}

// MARK: - Fetcher
protocol AnyDBFetcher {
    func callAsFunction<T: DBFetchable>(_ type: T.Type) -> [T]
}

private struct DBFetcher: AnyDBFetcher {
    func callAsFunction<T: DBFetchable>(_ type: T.Type) -> [T] {
        return type.DBModel
            .fetch(from: DBClient.livePersistentContainer.viewContext)
            .compactMap { model in
                type.init(from: model)
            }
    }
}
