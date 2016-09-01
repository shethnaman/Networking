

import UIKit
import MobileCoreServices
import CoreLocation


typealias webCompletionHandler = (data : NSData) -> Void;
typealias webFailuerHandler = (error : NSError,isCustomError : Bool) -> Void;


struct KEMUserDefault {
    
    static let KeyIsFaceBookUser        = "isFaceBookUser"
    static let KeyTimeZone              = "timezone"
    static let KeyUserInfo              = "userInfo"
    static let KeyDeviceToken           = "deviceToken"
    static let KeyFaceBookFriends          = "faceBookFriends"
    static let KeyPopUp                    = "popup"
    static let KeyAnimation                = "Animation"
    static let KeyCarbonTabIndex           = "Carbon"
}

let failureStatusCode = 0;
let successStatusCode = 200;

class WebServiceCall :NSObject {
    
    static var webService = WebServiceCall();
    
    override init() {
        
    }
    
    func setRequiredHeadersForRequest(urlRequest:NSMutableURLRequest)
    {
        
        urlRequest.setValue("ios", forHTTPHeaderField: "ostype")
        urlRequest.setValue("1.0", forHTTPHeaderField: "appversion");
        
        
//        if (user signed in)
//        {
//            let user = AppData.sharedInstance().getModelForKey(KEMUserDefault.KeyUserInfo) as! String
//            urlRequest.setValue(user, forHTTPHeaderField: UserData.kUserAccessToken)
//            
//        }
//        else
//        {
//            urlRequest.setValue("", forHTTPHeaderField: UserData.kUserAccessToken)
//        }
//        
        
        
    }
    
    func parseData(jsonData:NSData) -> NSMutableDictionary?
    {
        var mutableDict:NSMutableDictionary?
        do
        {
            mutableDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSMutableDictionary;
            
        }catch
        {
            NSLog("Error in parsing \n Please check this Response DATA \n\n  %@", NSString(data: jsonData, encoding: NSUTF8StringEncoding)!);
        }
        
        return mutableDict!;
    }

    
    func createBodyWithParameters(parameters: NSDictionary?,boundary: String) -> NSData {
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                
                print("key - \(key),\(value.dynamicType)")
                if(value is String || value is NSString){
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString("\(value)\r\n")
                }
                else if(value is NSNumber){
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString("\(value)\r\n")
                }
                else if(value is UIImage){
                    
                    let filename = "image.jpg"
                    let data = UIImageJPEGRepresentation(value as! UIImage,1);
                    let mimetype = mimeTypeForPath(filename)
                    
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
                    body.appendString("Content-Type: \(mimetype)\r\n\r\n")
                    body.appendData(data!)
                    body.appendString("\r\n")
                    
                }
                else if(value is NSData){
                
                    let filename = "image.mp4"
                    //let data = String(value)
                    let mimetype = mimeTypeForPath(filename)
                    
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
                    body.appendString("Content-Type: \(mimetype)\r\n\r\n")
                    body.appendData(value as! NSData)
                    body.appendString("\r\n")
                    
                    
                }
                else{
                    let filename = "image.mp4"
                    //let data = String(value)
                    let mimetype = mimeTypeForPath(filename)
                    
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
                    body.appendString("Content-Type: \(mimetype)\r\n\r\n")
                    body.appendData(value as! NSData)
                    body.appendString("\r\n")

                    
                }
            }
        }
        
        print("body",body)
        body.appendString("--\(boundary)--\r\n")
        
        
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
    func mimeTypeForPath(path: String) -> String {
        let str : NSString = path;
        let pathExtension = str.pathExtension
        var stringMimeType = "application/octet-stream";
        
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                stringMimeType = mimetype as NSString as String
            }
        }
        return stringMimeType;
    }
    
    
    
    func createRequest (param : NSDictionary , strURL : String) -> NSURLRequest {
        
        let boundary = generateBoundaryString()
        
        let url = NSURL(string: strURL)
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!)

        
        self.setRequiredHeadersForRequest(request);
        print(request)
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = createBodyWithParameters(param, boundary: boundary)
        return request
    }
    
    
     func callPostWebService(methodURL methodURL :String, param:NSMutableDictionary, completionHandler:webCompletionHandler, failureHandler: webFailuerHandler) -> Bool
    {
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler(error: myError, isCustomError: true);

            return false;
        }
        
//        if(sharedAppDelegate.isActivityLoaderRequired){
//            //Show Activity Indicator
//            DBActivityLoader.sharedActivityLoader.startAnimation()
//        }
        
        
        let request = self.createRequest(param, strURL: methodURL)
        print(request.allHTTPHeaderFields)
        let serviceTask = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
            data, response, error in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
              
//                //Hide Activity
//                DBActivityLoader.sharedActivityLoader.stopAnimating()
//                sharedAppDelegate.isActivityLoaderRequired = true
                if(error != nil){
                    
                    failureHandler(error: error!, isCustomError: false);
                }
                else{
//                    print(NSString(data: data!, encoding: NSUTF8StringEncoding));
                    let response = self.parseData(data!)
                    
                    let status = response!.objectForKey("status_code") as! Int;
                    
                    if(status == successStatusCode){
                        completionHandler(data: data!)
                    }
                    else {
                        let msg = response!.objectForKey("message") as! String
                        let error = NSError(domain: msg, code: Int(status), userInfo: nil);
                        failureHandler(error: error, isCustomError: true);
                    }
                    
                }
                
            })
        })
        serviceTask.resume();
        
        return true;
    }
    
    func callGetWebService(methodURL :String, completionHandler:webCompletionHandler, failureHandler: webFailuerHandler) -> Bool
    {
        
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler(error: myError, isCustomError: true);
//            AlertView.showMessageAlert(myError.domain)
            return false;
        }
        

        
        let url: NSURL = NSURL(string: methodURL)!
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        self.setRequiredHeadersForRequest(request);
        
        request.HTTPMethod = "GET";
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response:NSURLResponse?, data: NSData?, error: NSError?) -> Void in
        

            if(error != nil){
                
                let myError = NSError(domain: error!.description, code: error!.code, userInfo: nil)
                failureHandler( error: myError ,isCustomError: false);
            }
            else{
                
                let parsedObject: NSMutableDictionary?
                
                do {
                    parsedObject = try NSJSONSerialization.JSONObjectWithData(data!,
                        options: NSJSONReadingOptions.AllowFragments) as? NSMutableDictionary;
                } catch _ {
                    NSLog("Get method Parsing error ");
                    parsedObject = nil
                }
//                let responseString : NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!;
//                print(responseString);
//                print(parsedObject);
                
                if(parsedObject?.objectForKey("status_code")?.integerValue == 200){
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionHandler( data: data!);
                    })
                    
                }
                else if(parsedObject?.objectForKey("status_code")?.integerValue == 200){
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionHandler( data: data!);
                    })
                    
                }
                else if(parsedObject?.objectForKey("status_code")?.integerValue == 504){
                     let dictRequests = self.parseData(data!)
//                    UtilityClass.showAlertWithMessage("Error", andMessage: dictRequests!.objectForKey("message") as! String, andAlertType: AlertType.SUCCESS, withDismissHandler: {
//                        
//                        
//                        sharedAppDelegate.sessionExpired()
//                    })

                }
                else{
                    
                    if(parsedObject != nil){
                        
                        let message = parsedObject?.objectForKey("message") as! String;
                        var code : Int?
                        code = parsedObject?.objectForKey("status_code")?.integerValue;
                        
                        if (code == nil){
                            code = parsedObject?.objectForKey("status_code")?.integerValue;
                        }
                        
                        let myError = NSError(domain: message, code: code!, userInfo: nil)
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            failureHandler(error: myError ,isCustomError: true);
                        })
                    }
                    
                }
                
            }
        }
        
        return true;
    }
    
    func callGetWebServiceReturnFullData(methodURL :String, completionHandler:webCompletionHandler, failureHandler: webFailuerHandler) -> Bool
    {
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler( error: myError ,isCustomError: false);
            return false;
        }
//        if(sharedAppDelegate.isActivityLoaderRequired){
//            //Show Activity Indicator
//            DBActivityLoader.sharedActivityLoader.startAnimation()
//        }
        let characterSet = NSCharacterSet.URLQueryAllowedCharacterSet();
        let finalmethodURL = methodURL.stringByAddingPercentEncodingWithAllowedCharacters(characterSet);
        
        let url: NSURL = NSURL(string: finalmethodURL!)!
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "GET";
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response:NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            //Hide Activity
//            DBActivityLoader.sharedActivityLoader.stopAnimating()
//            sharedAppDelegate.isActivityLoaderRequired = true
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                
                if(error != nil){
                    let myError = NSError(domain: error!.description, code: error!.code, userInfo: nil)
                    
                    failureHandler( error: myError ,isCustomError: false);
                }
                else{
                    
                    if(data != nil){
                        completionHandler(data: data!)
                    }
                }
            })
        }
        
        return true;
    }
    
    func stringFromDictionary (dic:NSMutableDictionary)->String{
        var strFormData : String = "";
        var i = 0;
        
        for (key,value) in dic {
            
            if (i == 0){
                strFormData += "\(key)=\(value)";
            }else{
                strFormData += "&\(key)=\(value)";
            }
            i += 1;
        }
        return strFormData;
    }
    
    func dataFromDictionary(dic:NSMutableDictionary)->NSData{
        
        let strFormData = self.stringFromDictionary(dic);
        
        let formData : NSData = strFormData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!;
        return formData;
        
    }
    
    func isInternetHasConnectivity() -> Bool {
        
        var flag = false
        
        do {
            let reachability  = try Reachability.reachabilityForInternetConnection()
            flag = reachability.isReachable()
        }
        catch {
            
        }
        
        return flag
        
    }

    
}
