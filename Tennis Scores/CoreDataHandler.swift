//
//  CoreDataHandler.swift
//  Tennis Scores
//
//  Created by Amine Ben Jemia on 7/7/22.
//

import Foundation
import UIKit
import CoreData

class CoreDataHandler {
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createObject(entityName: String) -> NSManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext) else { return nil }
        let managedObject = NSManagedObject(entity: entity, insertInto: managedContext)
        return managedObject
    }
    
//    func fetchObjects(managedObject: NSManagedObject) -> [NSManagedObject] {
//        do {
//            let fetchedObjects = try managedContext.fetch(managedObject.fetchRequest())
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
    
    func save() {
        do {
            try managedContext.save()
        } catch {
            print("Could not save. \(error.localizedDescription)")
        }
    }
}

