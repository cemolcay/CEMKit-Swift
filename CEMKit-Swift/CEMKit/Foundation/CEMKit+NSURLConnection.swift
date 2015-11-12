//
//  CEMKit+NSURLConnection.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension NSURLConnection {

    class func urlRequest (
        url: String,
        success: (NSData?)->Void,
        error: ((NSError)->Void)? = nil) {
            
        if let nsurl = NSURL (string: url) {
            sendAsynchronousRequest(
                NSURLRequest (URL: nsurl),
                queue: NSOperationQueue.mainQueue(),
                completionHandler: { response, data, err in
                    if let e = err {
                        error? (e)
                    } else {
                        success (data)
                    }
            })
        }
    }
    
    class func imageRequest (
        url: String,
        success: (UIImage?)->Void) {
            
        urlRequest(url,
            success: {
                data in
                data?.toImage()
            })
    }

    class func jsonRequest (
        url: String,
        success: (AnyObject?->Void),
        error: ((NSError)->Void)?) {
            
            urlRequest(url,
                success: {
                    data in
                    success (data?.toJSONDictionary())
                },
                error: {
                    e in
                    error? (e)
                })
    }
    
}

