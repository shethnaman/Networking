//
//  CoreDataHelper.swift
//  coreDataExample
//
//  Created by JG.
//  Copyright © JG. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class CoreDataHelper: NSObject {
    
    class func insertObject(_ entityName: String) -> NSManagedObject{
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext)
        
        let result = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
        
        do {
            
            try managedObjectContext.save()
            
        } catch let error as NSError{
            
            print("Couldn't Save/Update Data: \(error), \(error.userInfo)")
            
        }
        return result
    }
    
    class func fetchObjects(_ entityName: String, predicate: NSPredicate?, sortDescriptor: NSSortDescriptor?) -> AnyObject{
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if predicate != nil{
            
            fetchRequest.predicate = predicate!
        }
        
        if sortDescriptor != nil{
            
            fetchRequest.sortDescriptors = [sortDescriptor!]
        }
        
        do {
            
            let items = try managedObjectContext.fetch(fetchRequest)
            
            return items as AnyObject
            
        } catch let error as NSError{
            
            print("Couldn't Fetch Data: \(error), \(error.userInfo)")
        }
        
        return [NSManagedObject]() as AnyObject
    }
    
    class func deleteObject(_ managedObject: [NSManagedObject], index: Int){
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        managedObjectContext.delete(managedObject[index])
        
        do {
            
            try managedObjectContext.save()
            
        } catch let error as NSError{
            
            print("Couldn't Delete Data: \(error), \(error.userInfo)")
        }
        
    }
    
}
