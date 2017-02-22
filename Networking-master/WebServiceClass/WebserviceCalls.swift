
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
    class func callLogin(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
        
        WebServiceCall.webService.callPostWebService(methodURL: URL_LOGIN, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)

    }
    
    ////==========================================
    //MARK: - Login with FaceBook or signUp
    //==========================================
    class func callLoginWithFaceBook(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
       
         WebServiceCall.webService.callPostWebService(methodURL: URL_Registration, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    //==========================================
    //MARK: - Send Suggestions from Facebook and Local addressbook email to webserver
    //==========================================

    class func sendContactEmailAndFacebookUserID(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler){
         WebServiceCall.webService.callPostWebService(methodURL: URL_ContactListApi, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    
    ////==========================================
    //MARK: - Resend Mail
    //==========================================
    class func callResendMail(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
         WebServiceCall.webService.callPostWebService(methodURL: URL_USER_Resend_Mail, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    

    ////==========================================
    //MARK: - Skip User
    //==========================================
    class func callToSkipUser(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_USER_SKIP, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Invite/Keep user
    //==========================================
    class func callWSToinvitekeep(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_InviteKeep, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Remove Friend/Keepup
    //==========================================
    class func callWSToRemovekeep(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URl_ToKeepRemove, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Cancel sent Request
    //==========================================
    class func callWSToCancelRequest(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_ToCancelFriendRequest, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Forgot Password
    //==========================================
    class func callForgotPassword(loginInfo : NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler) {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Forgot, param: loginInfo, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Get NewsFeed
    //==========================================
    class func callWSGetChatHistory(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
        {
            let url = "\(URL_USER_GET_POST)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
              WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
    
        }

    ////==========================================
    //MARK: - Add Post
    //==========================================
    class func callWSToAddPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_Add_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
 
    
    ////==========================================
    //MARK: - Edit Post
    //==========================================
    class func callWSToEditPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Edit_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    

    ////==========================================
    //MARK: - Call Tag - GET Type
    //============================================
    class func CallGetKeepList(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_Get_KeepList)?\(WebServiceCall.webService.stringFromDictionary(dicKeepList))"
        
         WebServiceCall.webService.callGetWebService(url,  completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Get Notification- GET Type
    //==========================================
    class func callWSGetNoti(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_USER_GET_NOTI)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    
    
    ////==========================================
    //MARK: - Get Notification - GET Type
    //==========================================
    class func callToGEt(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_USER_GET_NOTI)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - GetKeepRequest
    //==========================================
    class func callListoFKeepRequest(dicOfKeep:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_GET_KEEPREQUEST)?\(WebServiceCall.webService.stringFromDictionary(dicOfKeep))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Delete Post
    //==========================================
    class func callWSToDeletePost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
         WebServiceCall.webService.callPostWebService(methodURL: URL_Delete_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Stand Post
    //==========================================
    class func callWSToStandPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Stand_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: -  readNotificaction - Post Type
    //==========================================
    class func callReadNotification(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_User_notification, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - ViewFeed
    //==========================================
    class func callWSToGetFeedOnPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_GetFeed_On_Post)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Get Comments on Post
    //==========================================
    class func callWSToGetComentOnPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         let url = "\(URL_GetComment_On_Post)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
        WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Get Album List on Profile - get
    //==========================================
    class func callWSToGetAlbumList(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_ADD_Album_List)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Get Profile -  Get
    //==========================================
    class func callWSToGetProfile(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_Get_User_List)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
        
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Get MyPost -  Get
    //==========================================
    class func callWSToGetMyPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_Get_My_Post)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
        
        WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    ////==========================================
    //MARK: - To Delete single Image
    //==========================================
    class func callWSToDeleteImageOfPost(PostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: URL_ApideleteAlbumItem, param: PostDic, completionHandler: completionHandler, failureHandler: failureHandler)
    }

    ////==========================================
    //MARK: - Add Vibe onPost
    //==========================================
    class func callWSToAddVibeOnPost(PostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_VIBE_POST, param: PostDic, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    ////==========================================
    //MARK: - Remove Vibe onPost
    //==========================================
    class func callWSToRemoveVibeOnPost(PostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Remove_VIBE_POST, param: PostDic, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    
    ////==========================================
    //MARK: - React on post
    //==========================================
    class func callWSToReactONPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Add_Comment, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - React edit on post
    //==========================================
    class func callWSToEditONPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Edit_Added_Comment, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    
    ////==========================================
    //MARK: - Search USer -  Post
    //==========================================
    class func callWSToSearchUser(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_User_Search)?\(WebServiceCall.webService.stringFromDictionary(addPostDic).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
       print(url)
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)

    }
    ////==========================================
    //MARK: - Delete React on Post
    //==========================================
    class func callWSToDeleteReactONPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_DeleteReact_On_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    

    ////==========================================
    //MARK: - ReBuzz on post
    //==========================================
    class func callWSToReBuzzONPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_RemoveShare_On_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
  
    ////==========================================
    //MARK: - Buzz on Post
    //==========================================
    class func callWSToBuzzReactONPost(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_Share_On_Post, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - GetBirthDay -  Post
    //==========================================
    class func callWSToGETBirthDay(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
            let url = "\(Url_Birthday)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)

    }
    
    ////==========================================
    //MARK: - SayHappyBirthDay -  Post
    //==========================================
    class func callWSToSayBirthDay(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
 
         WebServiceCall.webService.callPostWebService(methodURL: Url_SayHappyBirthday, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
    }

    ////==========================================
    //MARK: - GetMessage -  Post
    //==========================================
    class func callWSToGETBirthDayMessage(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_GetBirthDayMessage)?\(WebServiceCall.webService.stringFromDictionary(addPostDic))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    ////==========================================
    //MARK: - Change Password - POST
    //==========================================
    class func callWSToChangePassword(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URl_ChangePassword, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }


    ////==========================================
    //MARK: - React for accept and deny
    //==========================================
    class func callWSToReactPostForAccept(addPostDic:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_ReactOnPost, param: addPostDic, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: -  UpdateProfile - Post Type
    //==========================================
    class func callToUpdateProfile(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: URL_User_Profile_Update, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
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
    //MARK: - Get Upcomming Event
    //==========================================
    class func callUpCommingEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_GetUpCommningEvent)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Get My Event
    //==========================================
    class func callMyEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_GetMyCommningEvent)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    
    ////==========================================
    //MARK: - Add Event
    //==========================================
    class func callAddEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        print(userDetailDict)
         WebServiceCall.webService.callPostWebService(methodURL: Url_ApiaddEvent, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - view Event
    //==========================================
    class func callApiViewEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_ApiviewEvent)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        

        
    }

    ////==========================================
    //MARK: - changeEvent Status
    //==========================================
    class func callChangeEventStatus(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: Url_ApichangeEventStatus, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Delete Event
    //==========================================
    class func callToDeleteEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: Url_ApideleteEvent, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - Edit Event
    //==========================================
    class func callToEditEvent(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        WebServiceCall.webService.callPostWebService(methodURL: Url_ApiEditEvent, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    ////==========================================
    //MARK: - Chat History List
    //==========================================
    class func callChatHistoryList(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_ApiUserChatHistoryList)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
  
    }
    
    ////==========================================
    //MARK: - Chat History Url_ApihistoryCall
    //==========================================
    class func callChatHistory(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_ApiUserChatHistory)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    ////==========================================
    //MARK: - call History
    //==========================================
    class func callCallHistory(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(Url_ApihistoryCall)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    ////==========================================
    //MARK: - Get Simple User Api
    //==========================================
    class func callUSerData(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_ApisimpleUserDetails)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
        
        
         WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)

      
        
    }
    
    ////==========================================
    //MARK: - Create group
    //==========================================
    class func callCreateGroup(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         WebServiceCall.webService.callPostWebService(methodURL: Url_ApicreateGroup, param: userDetailDict, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Group Details - GET Type
    //============================================
    class func CallGetGroupList(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        let url = "\(URL_ApigroupDetails)?\(WebServiceCall.webService.stringFromDictionary(dicKeepList))"
        
        WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)

        
    }
    ////==========================================
    //MARK: - Remove User from Group - POST Type
    //============================================
    class func CallRemoveUserList(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
          WebServiceCall.webService.callPostWebService(methodURL: URL_ApiDeleteUserInGroup, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
    }
    ////==========================================
    //MARK: - Exit Group  - POST Type
    //============================================
    class func CallExitGroup(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
        WebServiceCall.webService.callPostWebService(methodURL: URL_ApiExitGroup, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    ////==========================================
    //MARK: - Delete Group  - POST Type
    //============================================
    class func CallDeleteGroup(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
          WebServiceCall.webService.callPostWebService(methodURL: URL_ApiDeleteGroup, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Update Group  - POST Type
    //============================================
    class func CallUpdateGroupDetails(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
        WebServiceCall.webService.callPostWebService(methodURL: URL_ApiUpdateGroupDetails, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }

    ////==========================================
    //MARK: - Change  Group icon  - POST Type      //============================================
    class func CallUpdateGroupIcon(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
        WebServiceCall.webService.callPostWebService(methodURL: URL_ApichangeGroupIcon, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    
    ////==========================================
    //MARK: - Create Call   - POST Type
    //============================================
    class func CallCreate(dicKeepList:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
        
        WebServiceCall.webService.callPostWebService(methodURL: URL_ApicreateCall, param: dicKeepList, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
    


    ////==========================================
    //MARK: - Create Message history
    //==========================================
    class func callCreateGroupMessageHistory(userDetailDict:NSMutableDictionary,completionHandler:@escaping webCompletionHandler, failureHandler: @escaping webFailuerHandler)
    {
         let url = "\(Url_ApiUserChatHistory)?\(WebServiceCall.webService.stringFromDictionary(userDetailDict))"
          WebServiceCall.webService.callGetWebService(url, completionHandler: completionHandler, failureHandler: failureHandler)
        
    }
}
