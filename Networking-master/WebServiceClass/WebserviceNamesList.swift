

//Base url used for Production

//let DEV_URL:String = "http://54.200.22.192/kemapp/api/" // AWS - Main
let DEV_URL:String =  "http://54.200.22.192/kemapp/api_1.1/"


//Local
//let DEV_URL:String = "http://192.168.1.172/drive/project/kemapp/api/" //Xmpp local

/// Current base url, either dev or dist url
let BASE_URL:String = DEV_URL;


////==========================================
//MARK: - Webservice names
//==========================================
struct WebserviceNames {
    static let ApiLogin             = "login"
    static let ApiRegister          = "register"
    static let ApiForgotPassword    = "forgotPassword"
    static let ApiSignUp            = "signUpUser"
    static let ApiContactlist       = "contactFriendList"
    static let ApiResendVerifyLink  = "resendVerifyLink"
    static let ApiIsFirstLogin      = "isFirstLogin"
    static let ApiInviteAndKeep     = "sentKeepRequest"
    static let ApiGetAllPost        = "getAllPost"
    static let ApiGetkeepList       = "getKeepList"
    static let ApiGetNotificatinList = "getNotificatinList"
    static let ApiGetKeepRequest    = "getKeepRequest"
    static let ApiLogoutUser        = "logout"
    static let ApiAddPost           = "addPost"
    static let ApiEditPost          = "editPost"
    static let ApiStandPost        = "feedsStand"
    static let ApiDeletePost        = "deletePost"
    static let ApiReactKeepRequest  = "reactKeepRequest"
    static let ApiViewFeed          = "viewFeed"
    static let ApiGetFeedComments   = "getFeedComments"
    static let ApiVibePost          = "vibePost"
    static let ApiUnvibePost        = "unvibePost"
    static let ApiAddReact          = "addReact"
    static let ApiEditReact         = "editReact"
    static let ApiDeleteReact       = "deleteReact"
    static let ApiAddBuzz           = "sharedFeeds"
    static let ApiRemoveBuzz        = "unsharedFeed"
    static let ApiReadUserNotification = "readNotificaction"
    static let ApigetUserAlbumList   = "getUserAlbumList"
    static let ApideleteAlbumItem    = "deleteAlbumItem"
    static let ApigetUserDetails    = "getUserDetails"
    static let ApigetMyPost         = "getMyPost"
    static let ApisearchUser        = "searchUser"
    static let ApigetBirthDayList   = "getBirthDayList"
    static let ApichangePassword   = "changePassword"
    static let ApisayHappyBirthDay  = "sayHappyBirthDay"
    static let ApigetBirthdayMessageList = "getBirthdayMessageList"
    static let ApieditProfile          = "editProfile"
    static let ApichangeProfilePic      = "changeProfilePic"
    static let ApikeepRemove            = "keepRemove"
    static let ApicancelFriendRequest   = "cancelFriendRequest"
    static let ApiUpcommingEvent   =    "getEventList"
    static let ApiMycommingEvent   =    "getMyeventList"
    static let ApiaddEvent         =    "addEvent"
    static let ApiviewEvent        =    "viewEvent"
    static let ApideleteEvent       =    "deleteEvent"
    static let ApieditEvent       =    "editEvent"
    static let ApichangeEventStatus      =     "changeEventStatus"
    static let ApigetUserChatHistory     = "getUserChatHistory"
    static let ApigetUserChatHistoryList = "getUserChatHistoryList"
    static let ApicreateGroup = "createGroup"
    static let ApihistoryCall = "getCallhistory"
    static let ApigroupDetails = "groupDetails"
    static let ApiexitUserInGroup   = "exitUserInGroup"
    static let ApiDeleteGroup      = "deleteGroup"
    static let ApiDeleteUserInGroup  = "deleteUserInGroup"
    static let ApiUpdateGroupDetails    = "updateGroupDetails"
    static let ApichangeGroupIcon     = "changeGroupIcon"
     static let ApisimpleUserDetails     = "simpleUserDetails"
    static let ApicreateCall        = "createCall"
}

////==========================================
//MARK: - Login and Registration Module
//==========================================
let URL_LOGIN = String(format: "\(BASE_URL)\(WebserviceNames.ApiLogin)");


let URL_Registration = String(format: "\(BASE_URL)\(WebserviceNames.ApiRegister)")

let URL_Forgot = String(format: "\(BASE_URL)\(WebserviceNames.ApiForgotPassword)")

let URL_USER_SIGN_UP = "\(BASE_URL)\(WebserviceNames.ApiSignUp)";

let URL_ContactListApi = "\(BASE_URL)\(WebserviceNames.ApiContactlist)"


let URL_USER_Resend_Mail = "\(BASE_URL)\(WebserviceNames.ApiResendVerifyLink)";


let URL_USER_SKIP = "\(BASE_URL)\(WebserviceNames.ApiIsFirstLogin)"


////==========================================
//MARK: - TabBar api and some internal
//==========================================


let URL_USER_GET_POST = "\(BASE_URL)\(WebserviceNames.ApiGetAllPost)";

let URL_InviteKeep = "\(BASE_URL)\(WebserviceNames.ApiInviteAndKeep)";

let URL_Get_KeepList = "\(BASE_URL)\(WebserviceNames.ApiGetkeepList)"

let URL_USER_GET_NOTI = "\(BASE_URL)\(WebserviceNames.ApiGetNotificatinList)";

let URL_GET_KEEPREQUEST = "\(BASE_URL)\(WebserviceNames.ApiGetKeepRequest)"

let URL_Add_Post = "\(BASE_URL)\(WebserviceNames.ApiAddPost)";

let URL_Edit_Post = "\(BASE_URL)\(WebserviceNames.ApiEditPost)"

let URL_Stand_Post = "\(BASE_URL)\(WebserviceNames.ApiStandPost)";

let URL_Delete_Post = "\(BASE_URL)\(WebserviceNames.ApiDeletePost)";

let URL_User_notification = "\(BASE_URL)\(WebserviceNames.ApiReadUserNotification)"

let URL_User_Search = "\((BASE_URL))\(WebserviceNames.ApisearchUser)"

////==========================================
//MARK: - Post Reaction
//==========================================
let URL_VIBE_POST = "\(BASE_URL)\(WebserviceNames.ApiVibePost)"


let URL_Remove_VIBE_POST = "\(BASE_URL)\(WebserviceNames.ApiUnvibePost)"

let URL_Add_Comment = "\(BASE_URL)\(WebserviceNames.ApiAddReact)"

let URL_Edit_Added_Comment = "\(BASE_URL)\(WebserviceNames.ApiEditReact)"

let URL_ReactOnPost = "\(BASE_URL)\(WebserviceNames.ApiReactKeepRequest)"

//let URL_ReactBuzz = "\(BASE_URL)\(WebserviceNames.ApiReactKeepRequest)"

let URL_GetComment_On_Post = "\(BASE_URL)\(WebserviceNames.ApiGetFeedComments)"

let URL_GetFeed_On_Post = "\(BASE_URL)\(WebserviceNames.ApiViewFeed)"

let URL_DeleteReact_On_Post = "\(BASE_URL)\(WebserviceNames.ApiDeleteReact)"

let URL_Share_On_Post = "\(BASE_URL)\(WebserviceNames.ApiAddBuzz)"

let URL_RemoveShare_On_Post = "\(BASE_URL)\(WebserviceNames.ApiRemoveBuzz)"

////==========================================
//MARK: - Profile
//==========================================

let URL_ADD_Album_List = "\(BASE_URL)\(WebserviceNames.ApigetUserAlbumList)"
let URL_Get_User_List = "\(BASE_URL)\(WebserviceNames.ApigetUserDetails)"
let URL_Get_My_Post = "\(BASE_URL)\(WebserviceNames.ApigetMyPost)"
let URL_User_Profile_Update = "\(BASE_URL)\(WebserviceNames.ApieditProfile)"
let URL_ChangeProfilePic = "\(BASE_URL)\(WebserviceNames.ApichangeProfilePic)"
let URl_ToKeepRemove  = "\(BASE_URL)\(WebserviceNames.ApikeepRemove)"
let URL_ToCancelFriendRequest = "\(BASE_URL)\(WebserviceNames.ApicancelFriendRequest)"
let URL_ApideleteAlbumItem  = "\(BASE_URL)\(WebserviceNames.ApideleteAlbumItem)"
////==========================================
//MARK: - Side Bar
//==========================================
let Url_Birthday = "\(BASE_URL)\(WebserviceNames.ApigetBirthDayList)"

let URl_ChangePassword = "\(BASE_URL)\(WebserviceNames.ApichangePassword)"

let Url_SayHappyBirthday = "\(BASE_URL)\(WebserviceNames.ApisayHappyBirthDay)"

let Url_GetBirthDayMessage = "\(BASE_URL)\(WebserviceNames.ApigetBirthdayMessageList)"

let Url_GetUpCommningEvent = "\(BASE_URL)\(WebserviceNames.ApiUpcommingEvent)"

let Url_GetMyCommningEvent = "\(BASE_URL)\(WebserviceNames.ApiMycommingEvent)"

let URL_LogOut = "\(BASE_URL)\(WebserviceNames.ApiLogoutUser)";

////==========================================
//MARK: - Event
//============================================

let Url_ApiaddEvent = "\(BASE_URL)\(WebserviceNames.ApiaddEvent)"

let Url_ApiviewEvent = "\(BASE_URL)\(WebserviceNames.ApiviewEvent)"

let Url_ApichangeEventStatus = "\(BASE_URL)\(WebserviceNames.ApichangeEventStatus)"

////==========================================
//MARK: - Chat and call
//==========================================
let Url_ApiUserChatHistory = "\(BASE_URL)\(WebserviceNames.ApigetUserChatHistory)"

let Url_ApiUserChatHistoryList = "\(BASE_URL)\(WebserviceNames.ApigetUserChatHistoryList)"

let Url_ApideleteEvent  = "\(BASE_URL)\(WebserviceNames.ApideleteEvent)"

let Url_ApiEditEvent   = "\(BASE_URL)\(WebserviceNames.ApieditEvent)"

let Url_ApicreateGroup  = "\(BASE_URL)\(WebserviceNames.ApicreateGroup)"

let Url_ApihistoryCall = "\(BASE_URL)\(WebserviceNames.ApihistoryCall)"

let URL_ApigroupDetails = "\(BASE_URL)\(WebserviceNames.ApigroupDetails)"

let URL_ApiExitGroup = "\(BASE_URL)\(WebserviceNames.ApiexitUserInGroup)"

let URL_ApiDeleteGroup = "\(BASE_URL)\(WebserviceNames.ApiDeleteGroup)"

let URL_ApiDeleteUserInGroup = "\(BASE_URL)\(WebserviceNames.ApiDeleteUserInGroup)"

let URL_ApiUpdateGroupDetails = "\(BASE_URL)\(WebserviceNames.ApiUpdateGroupDetails)"

let URL_ApichangeGroupIcon    = "\(BASE_URL)\(WebserviceNames.ApichangeGroupIcon)"

let URL_ApisimpleUserDetails = "\(BASE_URL)\(WebserviceNames.ApisimpleUserDetails)"

let URL_ApicreateCall = "\(BASE_URL)\(WebserviceNames.ApicreateCall)"
