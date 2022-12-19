//
//  DBFetchable.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 06.11.2022.
//

import CoreData

protocol DBFetchable {
    associatedtype DBModel: DBFetchableModel
    
    init?(from model: DBModel)
}

extension DBFetchable {
    static func fetch(from context: NSManagedObjectContext) -> [Self] {
        DBModel.fetch(from: context).compactMap { model in
            self.init(from: model)
        }
    }
}

protocol DBFetchableModel: NSManagedObject {}

extension DBFetchableModel {
    static func fetch(from context: NSManagedObjectContext) -> [Self] {
        let fetchRequest = Self.fetchRequest() as! NSFetchRequest<Self>
        
        let objects = try! context.fetch(fetchRequest)
        
        return objects
    }
}
