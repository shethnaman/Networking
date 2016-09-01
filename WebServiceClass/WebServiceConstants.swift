
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
 
}
////==========================================
//MARK: - parameters for userResponse
//==========================================
struct UserData
{
    
    static let kFirstName          = "first_name"




}

struct Other {
    static let kOffset = "offset"
    static let kFirstPostId = "first_post_id"

}

////==========================================
//MARK: - Webservice names
//==========================================
struct WebserviceNames {
    static let LoginApi             = "login"
  
}

struct FriendList {
    
    static let kResult = "result"
}




struct Suggestion {
    
    static let KType             = "type"


    
}


//Base url used for development

let DEV_URL:String = "http://54.187.157.159/api/index.php/" // AWS
////http://54.187.157.159/api/index.php/login

//Base url used for live/production
let DIST_URL:String = "abcd.com/..."


/// Current base url, either dev or dist url
let BASE_URL:String = DEV_URL;


/** url for checking whether user is registered or not, if registered then response is having full user details else it will have status=0,
 
 params:fbID,deviceToken,OS(1=iOS,2=Android)
 
 ex: http://arvaantechnolab.in/daydate/api/check_fb_login
 */
let URL_SIGN_WITH_FB = "\(BASE_URL)signInUser";

/** url for getting all the criterias which we required to check for,
 
 params:
 
 ex:http://arvaantechnolab.in/daydate/api/getCriteria
 */
let URL_GET_CRITERIA_FOR_REGISTER = "\(BASE_URL)getSignUpDetails"




let URL_LOGIN = String(format: "\(BASE_URL)\(WebserviceNames.LoginApi)");



let URL_Forgot = String(format: "\(BASE_URL)forgotPassword")

