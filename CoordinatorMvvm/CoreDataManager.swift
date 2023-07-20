//
//  CoreDataManager.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 20/07/2023.
//

import UIKit
import CoreData


final class CoreDataManager{
    
    
    static let shared = CoreDataManager()
        
        private lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "EventsApp") // Replace with your actual model name
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        
        var moc: NSManagedObjectContext {
            return persistentContainer.viewContext
        }
    
    func saveEvent(name: String ,date: Date  , image: UIImage)
    {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKeyPath: "image")
        event.setValue(date, forKeyPath: "date")
        self.saveContext()
        
    }
        
        // MARK: - Core Data Saving support
        
        func saveContext () {
            if moc.hasChanges {
                do {
                    try moc.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
        
        // MARK: - Core Data Fetching support
        
        func fetchEntities<T: NSManagedObject>(_ entityClass: T.Type, predicate: NSPredicate? = nil) -> [T] {
            let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entityClass))
            fetchRequest.predicate = predicate
            
            do {
                let results = try moc.fetch(fetchRequest)
                return results
            } catch {
                print("Error fetching data: \(error)")
                return []
            }
        }
        
        // MARK: - Core Data Deleting support
        
        func deleteEntity(_ entity: NSManagedObject) {
            moc.delete(entity)
            saveContext()
        }
    
    
}
