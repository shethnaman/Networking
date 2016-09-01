
 
import Foundation

@objc class AppData: NSObject {

    //==========================================
    //MARK: - Singleton Instance of AppData
    //==========================================
    class func sharedInstance() -> AppData {
        
        let sharedInstance = AppData()
        return sharedInstance
        
    }

    //==========================================
    //MARK: - Helper Methods
    //==========================================
    
    func saveModel(model : AnyObject, forKey key : String) {
        
        let encodedObject = NSKeyedArchiver.archivedDataWithRootObject(model)
        NSUserDefaults.standardUserDefaults().setObject(encodedObject, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func getModelForKey(key : String) -> AnyObject? {
        
        let encodedObject = NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData
        let savedModel = encodedObject != nil ? NSKeyedUnarchiver.unarchiveObjectWithData(encodedObject!) : nil
        return savedModel
    }
    
    func removeModelForKey(key : String){
        
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
       // self.user = nil
        
    }
    

}
 
 
