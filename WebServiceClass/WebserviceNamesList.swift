//
//  WebserviceNamesList.swift
//  DayDate
//
//  Created by Mehul Thakkar on 12/01/16.
//  Copyright © 2016 ArvaanTechnolabs. All rights reserved.
//

//Base url used for Production

let DEV_URL:String = "http://api.beaverq.com/api/" // AWS - Main


//Local
//let DEV_URL:String = "http://192.168.1.172/drive_buddy/api/v1/index.php/" // local

/// Current base url, either dev or dist url
let BASE_URL:String = DEV_URL;


////==========================================
//MARK: - WebService Group
//==========================================
struct groupByService{
    static let groupUser = "user/"
    static let groupInfluencers = "Influencers/"
}

////==========================================
//MARK: - Webservice names
//==========================================
struct WebserviceNames {
    static let ApiLogin             = "login"
    static let ApiRegister          = "register"
    static let ApiForgotPassword    = "forgotPassword"
    static let ApiResendVerifyLink  = "resendVerifyLink"
    static let ApiLogoutUser        = "logout"
    static let ApieditProfile       = "editProfile"
    static let ApichangePassword    = "changePassword"
    static let ApigetCameras        = "getCameras"
    static let ApichangeProfilePic  = "changeProfilePic"
    
    // Added for BeaverQ
    static let ApiGetCountries      = "GetCountries"
    static let ApiGetFeatures       = "GetFeatures"
   }

////==========================================
//MARK: - Login and Registration Module
//==========================================
let URL_LOGIN = String(format: "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApiLogin)");

let URL_Registration = String(format: "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApiRegister)")

let URL_Forgot = String(format: "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApiForgotPassword)")

let URl_ChangePassword = "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApichangePassword)"

let URL_ChangeProfilePic = "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApichangeProfilePic)"

let URL_User_Profile_Update = "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApieditProfile)"

let URL_USER_Resend_Mail = "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApiResendVerifyLink)";

let URL_LogOut = "\(BASE_URL)\(groupByService.groupUser)\(WebserviceNames.ApiLogoutUser)";

let URL_GetCountries = "\(BASE_URL)\(groupByService.groupInfluencers)\(WebserviceNames.ApiGetCountries)";

let URL_GetFeatures = "\(BASE_URL)\(groupByService.groupInfluencers)\(WebserviceNames.ApiGetFeatures)";
