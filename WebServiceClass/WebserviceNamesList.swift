//
//  WebserviceNamesList.swift
//  naman_Practical
//
//  Created by Naman Sheth on 14/04/17.
//  Copyright © 2017 naman. All rights reserved.
//

//Base url used for Production

let DEV_URL:String = "http://losepin.com/zinncity/api1/index.php/" // AWS - Main


/// Current base url, either dev or dist url
let BASE_URL:String = DEV_URL;

////==========================================
//MARK: - Webservice names
//==========================================
struct WebserviceNames {
    static let ApiLogin             = "login"
    static let ApiRegister          = "register"
    static let ApiForgotPassword    = "forget"
    static let ApiFaceBook          = "fb_login"
    static let ApiDeviceToken       = "Update_device_token"
    static let ApiUser_details      = "user_details"
}

////==========================================
//MARK: - WebService Group
//==========================================
struct groupByService{
    static let groupPlace = "place/nearbysearch/json"
    static let groupDirection = "directions/json"
    static let geoCodeJson = "geocode/json?"
}


////==========================================
//MARK: - Login and Registration Module
//==========================================
let URL_Login = String(format: "\(BASE_URL)\(WebserviceNames.ApiLogin)");

let URL_Register = String(format: "\(BASE_URL)\(WebserviceNames.ApiRegister)")

let URL_Forgot = String(format: "\(BASE_URL)\(WebserviceNames.ApiForgotPassword)")

let URL_FaceBook = String(format: "\(BASE_URL)\(WebserviceNames.ApiFaceBook)")

let URL_DeviceToken = String(format: "\(BASE_URL)\(WebserviceNames.ApiDeviceToken)")

let URL_User_details = String(format: "\(BASE_URL)\(WebserviceNames.ApiUser_details)")
