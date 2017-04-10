//
//  WebserviceCalls.swift
//  DayDate
//
//  Created by Mehul Thakkar on 12/01/16.
//  Copyright © 2016 ArvaanTechnolabs. All rights reserved.
//

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
        
        return  finalStr;
    }
    
    
    ////==========================================
    //MARK: - Login with email id
    //==========================================
    class func callLogin(loginInfo : NSMutableDictionary , url : String,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
        
        WebServiceCall.webService.callPostWebService(methodURL: url, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)

    }
    
    ////==========================================
    //MARK: - Login with FaceBook or signUp
    //==========================================
    class func callRegistration(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
       
         WebServiceCall.webService.callPostWebService(methodURL: URL_Registration, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
  
    
    ////==========================================
    //MARK: - Resend Mail
    //==========================================
    class func callResendMail(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
         WebServiceCall.webService.callPostWebService(methodURL: URL_USER_Resend_Mail, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    

      ////==========================================
    //MARK: - Forgot Password
    //==========================================
    class func callForgotPassword(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Forgot, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
   ////==========================================
    //MARK: - Change Password - POST
    //==========================================
    class func callWSToChangePassword(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URl_ChangePassword, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }


    ////==========================================
    //MARK: -  UpdateProfile - Post Type
    //==========================================
    class func callToUpdateProfile(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_User_Profile_Update, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: -  Get Camera - Post Type
    //==========================================
  /*  class func callToGetCameras(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_GetCameras, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
 */
    ////==========================================
    //MARK: -  UpdateProfile - Post Type
    //==========================================
    class func callToUpdateProfilePic(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_ChangeProfilePic, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - LogOut
    //==========================================
    class func callWSToLogoutPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_LogOut, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Example of get service
    //==========================================
    class func callUpCommingEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        //let url = "\(Url_GetUpCommningEvent)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
        // WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////======================================================
    //MARK:- GetCountries - Get Type
    //========================================================
    class func callGetCountries(completionHandler:@escaping webCompletionHandler , failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callGetWebServiceReturnFullData(URL_GetCountries, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    ////======================================================
    //MARK:- GetFeatures  - Get Type
    //========================================================
    class func callGetFeatures(completionHandler:@escaping webCompletionHandler , failureHandler: @escaping webFailuerHandler) {
        WebServiceCall.webService.callGetWebServiceReturnFullData(URL_GetFeatures, completionHandler: completionHandler, failureHandler: failureHandler)
    }

   
}


