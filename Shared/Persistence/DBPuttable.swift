//
//  DBPuttable.swift
//  DoomsdayTraining
//
//  Created by Александр Шакмаков on 05.11.2022.
//

import CoreData

protocol DBPuttable {
    func put(in context: NSManagedObjectContext)
}
