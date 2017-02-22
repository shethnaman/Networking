

import UIKit
import MobileCoreServices
import CoreLocation


typealias webCompletionHandler = (_ data : Data) -> Void;
typealias webFailuerHandler = (_ error : NSError,_ isCustomError : Bool) -> Void;

//typealias webHandler = (status:Bool,message:String?,userDict:NSMutableDictionary?)->Void



let failureStatusCode = 0;
let successStatusCode = 200;

class WebServiceCall :NSObject {
    
    static var webService = WebServiceCall();
    
    override init() {
        
    }
    
    func setRequiredHeadersForRequest(_ urlRequest:NSMutableURLRequest)
    {
        
        urlRequest.setValue("ios", forHTTPHeaderField: "ostype")
        urlRequest.setValue("1.0", forHTTPHeaderField: "appversion");
        
        
        if (AppData.sharedInstance().isUserSignedIn())
        {
            let user = AppData.sharedInstance().getModelForKey(key: KEMUserDefault.KeyUserInfo) as! User
            urlRequest.setValue(user.userLoginToken!, forHTTPHeaderField: UserData.kUserAccessToken)
            
        }
        else
        {
            urlRequest.setValue("", forHTTPHeaderField: UserData.kUserAccessToken)
        }
        
//        print(urlRequest.value(forHTTPHeaderField: UserData.kUserAccessToken))
//          print(urlRequest.value(forHTTPHeaderField: "ostype"))
//          print(urlRequest.value(forHTTPHeaderField: "appversion"))
        
    }
    
    func createBodyWithParameters(_ parameters: NSDictionary?,boundary: String) -> Data {
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                
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
                    body.append(data!)
                    body.appendString("\r\n")
                    
                } else if(value is NSArray || value is NSMutableArray ){
                    let images = value as! NSArray
                    var i = 0;
                    
                    for item in images {
                        let image = item as! UIImage
                        let filename = "image\(i).jpg"
                        let data = UIImageJPEGRepresentation(image ,1);
                        let mimetype = mimeTypeForPath(filename)
                        print("arra filename \(filename) image set \(mimetype) of size  \((data?.count)! / 1024)");
                        body.appendString("--\(boundary)\r\n")
                        body.appendString("Content-Disposition: form-data; name=\"\(key)[\(i)]\"; filename=\"\(filename)\"\r\n")
                        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
                        body.append(data!)
                        body.appendString("\r\n")
                        i+=1;
                    }
                }
                else {
                    
                    let filename = "image.mp4"
                    //let data = String(value)
                    let mimetype = mimeTypeForPath(filename)
                    
                    body.appendString("--\(boundary)\r\n")
                    body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
                    body.appendString("Content-Type: \(mimetype)\r\n\r\n")
                    body.append(value as! Data)
                    body.appendString("\r\n")
                    
                    
                }
            }
        }
        body.appendString("--\(boundary)--\r\n")
        return body as Data
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    func mimeTypeForPath(_ path: String) -> String {
        let str : NSString = path as NSString;
        let pathExtension = str.pathExtension
        var stringMimeType = "application/octet-stream";
        
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                stringMimeType = mimetype as NSString as String
            }
        }
        return stringMimeType;
    }
    
    
    
    func createRequest (_ param : NSDictionary , strURL : String) -> URLRequest {
        
        let boundary = generateBoundaryString()
        
        let url = URL(string: strURL)
        let request = NSMutableURLRequest(url: url!)
        
        self.setRequiredHeadersForRequest(request);
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = createBodyWithParameters(param, boundary: boundary)
        return request as URLRequest
    }
    
    
    func callPostWebService(methodURL :String, param:NSDictionary, completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler(myError, true);
//            AlertView.showMessageAlert(myError.domain)
            return
        }
        
        if(sharedAppDelegate.isActivityLoaderRequired){
            //Show Activity Indicator
            DBActivityLoader.sharedActivityLoader.startAnimation()
        }
        
        let request = self.createRequest(param, strURL: methodURL)
        
        let serviceTask = URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            
            DispatchQueue.main.async(execute: { () -> Void in
                //Hide Activity
                DBActivityLoader.sharedActivityLoader.stopAnimating()
                sharedAppDelegate.isActivityLoaderRequired = true

                if(error != nil){
                    
                    failureHandler(error! as NSError, false);
                }
                else{
                   print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!);
                    let response = UtilityClass.parseData(data!)
                   // print(response)
                    let status = response?.object(forKey: "status_code") as? Int;
                    
                    if(status == successStatusCode){
                        completionHandler(data!)
                    }else if(status == 504){
                        let dictRequests = UtilityClass.parseData(data!)
                        UtilityClass.showAlertWithMessage("Error", andMessage: dictRequests!.object(forKey: "message") as! String, andAlertType: AlertType.SUCESS, withDismissHandler: {
                            
                            
                            sharedAppDelegate.sessionExpired()
                        })
                    }
                    else {
                        let msg = response?.object(forKey: "message") as! String
                        let error = NSError(domain: msg, code:status!, userInfo: nil);
                        failureHandler(error, true);
                    }
                    
                }
                
            })
        })
        
        serviceTask.resume();
        
        
    }
    
    func callGetWebService(_ methodURL :String, completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler(myError, true);
            //            AlertView.showMessageAlert(myError.domain)
            
        }
        
        if(sharedAppDelegate.isActivityLoaderRequired){
            //Show Activity Indicator
            DBActivityLoader.sharedActivityLoader.startAnimation()
        }
        
        print("methodURL \(methodURL)")

      //  let url: URL = URL(string: methodURL.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!
        let url: URL = URL(string: methodURL)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url:url)
        
        self.setRequiredHeadersForRequest(request);
        
        request.httpMethod = "GET";
        
        let urlseesion = URLSession.shared.dataTask(with: request as URLRequest) { (data, resposne, error) in
           
            //Hide Activity
            DBActivityLoader.sharedActivityLoader.stopAnimating()
            sharedAppDelegate.isActivityLoaderRequired = true

            if(error != nil){
                
                let myError = NSError(domain: (error as! NSError).description, code: (error as! NSError).code, userInfo: nil)
                failureHandler( myError ,false);
            }
            else{
                
                let parsedObject: NSMutableDictionary?
                
                do {
                    parsedObject = try JSONSerialization.jsonObject(with: data!,options: [JSONSerialization.ReadingOptions.allowFragments, JSONSerialization.ReadingOptions.mutableContainers]) as? NSMutableDictionary;
                    print(parsedObject)
                } catch _ {
                    NSLog("Get method Parsing error ");
                    parsedObject = nil
                }
               
                if(parsedObject?.object(forKey: "status_code") as? Int == 200){
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler( data!);
                    })
                    
                }
                else if(parsedObject?.object(forKey: "status_code") as? Int == 200){
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler( data!);
                    })
                    
                }
                else if((parsedObject!.object(forKey: "status_code")! as AnyObject).intValue == 504){
                    let dictRequests = UtilityClass.parseData(data!)
                    UtilityClass.showAlertWithMessage("Error", andMessage: dictRequests!.object(forKey: "message") as! String, andAlertType: AlertType.SUCESS, withDismissHandler: {
                        
                        
                        sharedAppDelegate.sessionExpired()
                    })
                }
                else{
                    
                    if(parsedObject != nil){
                        
                        let message = parsedObject?.object(forKey: "message") as! String;
                        var code : Int?
                        code = parsedObject?.object(forKey: "status_code") as? Int
                        
                        if (code == nil){
                            code = (parsedObject?.object(forKey: "status_code") as AnyObject).intValue;
                        }
                        
                        let myError = NSError(domain: message, code: code!, userInfo: nil)
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            failureHandler(myError ,true);
                        })
                    }
                    
                }
                
            }
            
        }
        
        urlseesion.resume()
    }
    
    func callGetWebServiceReturnFullData(_ methodURL :String, completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        if (isInternetHasConnectivity() == false ) {
            let myError = NSError(domain: "Internet is not available", code: 1001, userInfo: nil)
            failureHandler( myError ,false);
        }
        
        if(sharedAppDelegate.isActivityLoaderRequired){
            //Show Activity Indicator
            DBActivityLoader.sharedActivityLoader.startAnimation()
        }
        
        let characterSet = CharacterSet.urlQueryAllowed;
        let finalmethodURL = methodURL.addingPercentEncoding(withAllowedCharacters: characterSet);
        
        let url: URL = URL(string: finalmethodURL!)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        
        request.httpMethod = "GET";
        print(methodURL);
        
        let urlseesion = URLSession.shared.dataTask(with: request as URLRequest) { (data, resposne, error) in
            
            DispatchQueue.main.async(execute: { () -> Void in
                //Hide Activity
                DBActivityLoader.sharedActivityLoader.stopAnimating()
                sharedAppDelegate.isActivityLoaderRequired = true

                
                if(error != nil){
                    let myError = NSError(domain: (error as! NSError).description, code: (error as! NSError).code, userInfo: nil)
                    
                    failureHandler( myError ,false);
                }
                else{
                    
                    if(data != nil){
                        completionHandler(data!)
                    }
                }
            })
            
        }
        
        urlseesion.resume()
        
    }
    
    func stringFromDictionary (_ dic:NSMutableDictionary)->String{
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
    
    func dataFromDictionary(_ dic:NSMutableDictionary)->Data{
        
        let strFormData = self.stringFromDictionary(dic);
        
        let formData : Data = strFormData.data(using: String.Encoding.utf8, allowLossyConversion: false)!;
        return formData;
        
    }
    
    class func parseQueryParams(_ str : String) -> NSMutableDictionary{
        
        let dic = NSMutableDictionary()
            for parameter in str.components(separatedBy: "&"){
                let parts = parameter.components(separatedBy: "=")
                if parts.count > 1{
                    let key = (parts[0] as String).removingPercentEncoding
                    let value = (parts[1] as String).removingPercentEncoding
                    if key != nil && value != nil{
                        dic.setObject(value!, forKey: key! as NSCopying)
                    }
                }
            }
        
        return dic
    }
}
