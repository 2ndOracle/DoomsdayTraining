//
//  DBClient.swift
//  Doomsday Training
//
//  Created by Александр Шакмаков on 05.11.2022.
//

import CoreData

// MARK: - Old Start
struct DBClient {
    let put: (_ object: DBPuttable) -> ()
    let saveChanges: () -> ()
}

extension DBClient {
    static let live = Self(
        put: { object in
            object.put(in: Self.livePersistentContainer.viewContext)
        },
        saveChanges: {
            do {
                try livePersistentContainer.viewContext.save()
            } catch {
                fatalError("Container saving \(error)")
            }
        }
     )

    //todo
    func fetchModels<T: DBFetchable>() -> [T] {
        return T.fetch(from: Self.livePersistentContainer.viewContext)
    }
    
    //todo
    func fetchModels(of type: AnyClass) {
//        print(type)
//        let tr = type as! NSFetchRequestResult
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
//        fetchRequest = type.fetchRequest()
    }
}

extension DBClient {
    private static let livePersistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Loading persistent store \(error)")
            }
        }
        return container
    }()
}

// TODO: Remove all fatalError
// MARK: - Old End

// MARK: - New Start
enum DBContainerProvider {
    fileprivate static let mainContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Loading persistent store \(error)")
            }
        }
        return container
    }()
}

protocol DBClientProtocol {//todo
    func put(_ object: DBPuttable) -> ()
    func saveChanges()
    func fetchModels<M: DBFetchable>() -> [M]
}

final class DBClientImplementation: DBClientProtocol {//todo
    
    func put(_ object: DBPuttable) -> () {
        object.put(in: DBContainerProvider.mainContainer.viewContext)
    }
    
    func saveChanges() {
        do {
            try DBContainerProvider.mainContainer.viewContext.save()
        } catch {
            fatalError("Container saving \(error)")
        }
    }
    
    func fetchModels<M: DBFetchable>() -> [M] {
        M.DBModel
            .fetch(from: DBContainerProvider.mainContainer.viewContext)
            .compactMap { model in
                M.init(from: model)
            }
    }
}

//todo
protocol AnyFetcher {
    func callAsFunction<T: DBFetchable>(_ type: T.Type) -> [T]
}

struct Fetcher: AnyFetcher {
    //todo передать closure, который будет принимать Any.type
//    var closure: ((Any.type) -> [Any])? = nil
    func callAsFunction<T: DBFetchable>(_ type: T.Type) -> [T] {
        return type.DBModel
            .fetch(from: DBContainerProvider.mainContainer.viewContext)
            .compactMap { model in
                type.init(from: model)
            }
    }
}

struct DBClient2<T: AnyFetcher> {
    let fetch: T
}

let fetcher = Fetcher()
let db = DBClient2(fetch: fetcher)
let fetchedObjects = db.fetch(GuessAttempt.self)



