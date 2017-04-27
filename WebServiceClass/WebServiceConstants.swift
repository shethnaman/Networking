//
//  GoogleMap.swift
//  naman_Practical
//
//  Created by Naman Sheth on 14/04/17.
//  Copyright © 2017 naman. All rights reserved.
//
import Foundation

struct General {
    
    static let kUserID = "user_id"
    static let GoogleKey = "AIzaSyDirDVEzTJ1HkSkE7B8YtxzN_jSsg9TrLc"
}

////==========================================
//MARK: - Parameters for Direction
//==========================================
struct Direction
{
    static let kLocation                   = "location"
    static let kDestination                = "destination"
    static let kMode                       = "mode"
    static let kKey                        = "key"
}

////==========================================
//MARK: - parameters for Place
//==========================================
struct Place
{
    static let kLocation          = "location"
    static let kradius            = "radius"
    static let kTypes              = "types"
    static let kkey               = "key"
    
}

struct Geocode {
    static let klatlong = "latlng"
    static let kSensor = "sensor"
}

////==========================================
//MARK: - webservice Constant
//==========================================
struct Registration
{
    
    static let kFirstName                   = "Name"
    static let kLastName                    = "Lastname"
    static let kEmail                       = "Email"
    static let kGender                      = "gender"
    static let kBirthDate                   = "Birthdate"
    static let kPassword                    = "Password"
    static let kdeviceToken                 = "DeviceToken"
    static let kSetTimeZone                 = "timezone"
    static let kCity                        = "City"
    static let kuserID                      = "user_id"
    static let kProfileId                   = "profile_id"
    static let knew_password                = "new_password"
    static let kProfileImage                = "ProfileImage"
    static let kLatitude                    = "Latitude"
    static let kLongitude                   = "Longitude"
    static let kchecksum                    = "Checksum"
    
    
    static let kLoginWithFbid               = "fb_id"
    static let kLoginWithFbProfilePic       = "profile_pic"
}

struct FbRegistration {
    static let kFbId           =   "FB_ID"
    static let kName           =   "NAME,"
    static let kEmailid        =   "EMAIL_ID"
    static let kAccess_Token   =   "FB_ACCESS_TOCKEN"
    static let kDeviceToken    =   "FB_DEVICE_TOCKEN"
    static let kLatitude       =   "FB_LATITUDE"
    static let kLongitude      =   "FB_LONGITUDE"
    static let kProfileImage   =   "FB_PROFILE_IMAGE"
}

