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
    private init() {}
    static let shared = CoreDataHandler()
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createObject(entityName: String) -> NSManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext) else { return nil }
        let managedObject = NSManagedObject(entity: entity, insertInto: managedContext)
        return managedObject
    }
    
    func fetchObjects<T: NSManagedObject>(fetchRequest: NSFetchRequest<T>) -> [T]? {
        let fetchedObjects: [T]?
        do {
            fetchedObjects = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
        return fetchedObjects
    }
    
    func save() {
        do {
            try managedContext.save()
        } catch {
            print("Could not save. \(error.localizedDescription)")
        }
    }
}

