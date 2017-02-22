

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
    static let kUserAccessToken    = "logintoken"
    static let kGroup_id           = "group_id"



}

struct Other {
    static let kOffset = "offset"
    static let kFirstPostId = "first_post_id"
    static let ktype = "type"
    static let ktext = "text"
    static let kfile = "file"
    static let kTag  = "tag_id"
    static let kNotificationId  = "notification_id"
    static let kPostId = "post_id"
    static let kKeepId = "keep_id"
    static let kStatus = "status"
    static let kReact = "react"
    static let kReactId = "react_id"
    static let kCommentId = "comment_id"
    static let kshared_Id = "shared_id"
    static let kMessage = "message"
    static let kis_direct = "is_direct"
    static let klink_text = "link_text"
    static let kTitle_text = "title"
    static let kEventDate = "event_date"
    static let kEventTime = "event_time"
    static let kEventAddress = "address"
    static let kEventDescription = "description"
    static let kBanner = "banner"
    static let kEvent_id  = "event_id"
    static let kGroup_name = "group_name"
    static let kGroup_image = "group_image"
    static let kDelete_id    = "delete_id"
    static let kAlbum_id    = "album_id"
    static let kReceiver_id = "receiver_id"
     static let kdate_time = "datetime"
     static let kduration = "duration"
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
