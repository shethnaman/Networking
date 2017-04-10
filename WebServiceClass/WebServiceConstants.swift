//
//  WebServiceConstants.swift
//  KEM-App
//
//  Created by Arvaan on 12/07/16.
//  Copyright © 2016 Pooja. All rights reserved.
//

import Foundation


//MARK: - Request Parameters


struct General {
    
    static let kUserID = "user_id"
    
}

////==========================================
//MARK: - Parameters for Registration
//==========================================
struct Registration
{

    static let kFirstName                   = "first_name"
    static let kLastName                    = "last_name"
    static let kEmail                       = "email"
    static let kGender                      = "gender"
    static let kBirthDate                   = "birth_date"
    static let kPassword                    = "password"
    static let kdeviceToken                 = "push_id"
    static let kSetTimeZone                 = "timezone"
    static let kisSocial                    = "is_social"
    static let kuserID                      = "user_id"
    static let kProfileId                   = "profile_id"
    static let knew_password                = "new_password"
   
    
    
    static let kLoginWithFbid               = "fb_id"
    static let kLoginWithFbProfilePic       = "profile_pic"
}

////==========================================
//MARK: - parameters for userResponse
//==========================================
struct UserData
{
    
    static let kFirstName          = "first_name"
    static let kLastName           = "last_name"
    static let kEmail              = "email"
    static let kGender             = "gender"
    static let kBirthDate          = "birth_date"
    static let kPassword           = "password"
    static let kdeviceToken        = "push_id"
    static let kSetTimeZone        = "timezone"
    static let kisSocial           = "is_social"
    static let kisFirstLogin       = "is_first_login"
    static let kprofilePic         = "profile_pic"
    static let kuserId             = "user_id"
    static let kUserAccessToken    = "token"
    static let kGroup_id           = "group_id"
    static let kClientKey          = "clientkey"
     static let kClientsecret          = "clientsecret"


}

struct Other {
    static let klatitude = "latitude"
    static let klongitude = "longitude"
}



struct FriendList {
    
    static let kResult = "result"
}




struct Suggestion {
    
    static let KType             = "type"
    static let kInvite           = "invite"
    static let kKeep             = "keep"
    static let kSenderId         = "sender_id"

    
}
