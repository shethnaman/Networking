
import Foundation

class WebserviceCalls
{
    
    static var service = WebServiceCall();
    
    

    
    class func getParamValueStringForURLFromDictionary(dict:Dictionary<String,AnyObject>) -> String
    {
        var finalStr = "";
        
        for str in dict.keys
        {
            if finalStr == ""
            {
                finalStr = "\(str)=\(dict[str]!)"
            }
            else
            {
                finalStr = "\(finalStr)&\(str)=\(dict[str]!)"
            }
        }
        
        return finalStr;
    }
    
    
  
    
    ////==========================================
    //MARK: - Forgot Password
    //==========================================
    class func callForgotPassword(loginInfo : NSMutableDictionary,completionHandler:webCompletionHandler, failureHandler: webFailuerHandler) -> Bool{
        return WebServiceCall.webService.callPostWebService(methodURL: URL_Forgot, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Get NewsFeed
    //==========================================
    class func callWSGetChatHistory(userDetailDict:NSMutableDictionary,completionHandler:webCompletionHandler, failureHandler: webFailuerHandler) -> Bool
        {
            let url = "\(URL_Forgot)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
              return WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
    
        }

}