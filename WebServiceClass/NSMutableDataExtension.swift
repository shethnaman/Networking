

import Foundation

extension NSMutableData {
    
    //==========================================
    //MARK: - To append string as a NSData
    //==========================================
    
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
    
}