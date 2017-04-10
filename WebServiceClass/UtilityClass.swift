//
//  UtilityClass.swift
//
//  Created by Arvaan on 08/07/16.
//  Copyright © 2016 Pooja. All rights reserved.
//


//MARK:- GTNotification Alert Background Colors
//================================================================================//

let Alert_Background_Color_Failure:UIColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0);
let Alert_Background_Color_Warning:UIColor = UIColor(red: 255/255.0, green: 149/255.0, blue: 0/255.0, alpha: 1.0);
let Alert_Background_Color_Success:UIColor = UIColor(red: 45.0/255.0, green: 188.0/255.0, blue: 96.0/255.0, alpha: 1.0);


enum AlertType : Int {
    
    case SUCESS = 0
    case FAILURE = 1
    case WARNING = 2
}

let kAPIStatus = "status_code"
let kAPIMessage = "message"


import UIKit

func isInternetHasConnectivity() -> Bool {
    
    let flag = Reachability()?.isReachable
    return flag!
    
}


//MARK : UIApllication Extension

extension UIApplication {
    
    class func topViewController(_ base: UIViewController?) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

class UtilityClass: NSObject {
    
  
    
    //==========================================
    //MARK: - Parse Data
    //==========================================
    
    
    class func parseData(_ jsonData:Data) -> NSMutableDictionary?
    {
        var mutableDict:NSMutableDictionary?
        do
        {
            mutableDict = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSMutableDictionary;
            
        }catch
        {
            NSLog("Error in parsing \n Please check this Response DATA \n\n  %@", NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)!);
        }
        
        return mutableDict!;
    }
    

}
    


