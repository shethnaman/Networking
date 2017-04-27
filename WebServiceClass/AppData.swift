 //
//  AppData.swift
//  Doobi
//
//  Created by Arvaan on 26/04/16.
//  Copyright © 2016 Arvaan. All rights reserved.
//

 struct UserType {
    
    static let Parent       = "parent"
    static let BabySitter   = "babysitter"
 }
 
 
import Foundation

@objc class AppData: NSObject {

    
    //==========================================
    //MARK: - Variables
    //==========================================
    
    var user : User?
    
    //==========================================
    //MARK: - Singleton Instance of AppData
    //==========================================
    class func sharedInstance() -> AppData {
        
        let sharedInstance = AppData()
        return sharedInstance
        
    }
    
    
    override init() {
        
        super.init()
        user = getModelForKey(key: LosepinUserDefault.KeyUserInfo) as? User
    }
    

    //==========================================
    //MARK: - Helper Methods
    //==========================================
    
    func saveModel(model : AnyObject, forKey key : String) {
        
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: model)
        UserDefaults.standard.set(encodedObject, forKey: key)
        UserDefaults.standard.synchronize()
        
    }
    
    func getModelForKey(key : String) -> AnyObject? {
        
        let encodedObject = UserDefaults.standard.object(forKey: key) as? NSData
        let savedModel = encodedObject != nil ? NSKeyedUnarchiver.unarchiveObject(with: encodedObject! as Data) : nil
        return savedModel as AnyObject?
    }
    
    func removeModelForKey(key : String){
        
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.synchronize()
        self.user = nil
        
    }
    
    
    func isUserSignedIn () -> Bool {
        
        if(self.user == nil){
            
            return false
        }
        
        return true
    }
    

    
    
//    func isFaceBookUser () ->  Bool {
//        
//        return (Utilities.getObjectFromUserDefaultsForKey(KEMUserDefault.KeyIsFaceBookUser)?.boolValue)!
//        
//    }
    
    

}
 
 
