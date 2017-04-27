//
//  WebserviceCalls.swift
//  naman_Practical
//
//  Created by Naman Sheth on 14/04/17.
//  Copyright © 2017 naman. All rights reserved.
//



import Foundation

class WebserviceCalls
{
    
    static var service = WebServiceCall();
    
    

    
    ////==========================================
    //MARK: - Login
    //==========================================
    class func callWSLogin(Dict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_Login, param: Dict, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    ////==========================================
    //MARK: - Register
    //==========================================
    class func callWSRegister(Dict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_Register, param: Dict, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    ////==========================================
    //MARK: - Forgot
    //==========================================
    class func callWSForgot(Dict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
      WebServiceCall.webService.callPostWebService(methodURL: URL_Forgot, param: Dict, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    ////==========================================
    //MARK: - FaceBook
    //==========================================
    class func callWSFaceBook(Dict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_FaceBook, param: Dict, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    ////==========================================
    //MARK: - Get Upcomming Event
    //==========================================
    class func callUpCommingEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_User_details)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
        WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
}
