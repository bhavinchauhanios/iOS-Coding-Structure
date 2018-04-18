//
//  WebServices.swift
//  GlobalAPICall
//
//  Created by Ravi on 06/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration
import Alamofire
import SwiftyJSON
import SVProgressHUD


let reachability = Reachability()!

@available(iOS 10.0, *)
class WebServices: NSObject
{

  static func CallGlobalAPI(url:String, headers:NSDictionary?,parameters:NSDictionary, HttpMethod:String?, completionHandler:@escaping (_ jsonResponce:JSON? ,_ error: Error? ) -> Void )  {
    
    // get a reference to the app delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    print("URL: \n\(url)")
    // print("Headers: \n\(headers)")
    print("Parameters: \n\(parameters)")
    
    SVProgressHUD.show()

    //Internet Checking
    if Constants.internetChecker(reachability: Reachability()!){

            if (HttpMethod == "POST")
            {
                var req = URLRequest(url: try! url.asURL())
                req.httpMethod = "POST"
                req.setValue("application/json", forHTTPHeaderField: "content-type")
                req.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
                req.timeoutInterval = 30 // 10 secs

                Alamofire.request(req).responseJSON { response in
                  
                    if((response.result.value) != nil) {
                      
                      let jsonResponce = JSON(response.result.value!)
                      completionHandler(jsonResponce, nil)
                      print("Responce: \n\(jsonResponce)")
                      SVProgressHUD.dismiss()

                    }
                    else
                    {
                      completionHandler(nil, response.result.error!)
                        print(response.result.error ?? "")
                      SVProgressHUD.dismiss()
                      appDelegate.showAlertAppDelegate(title: "Application ", message: "msgErrorServiceCall".localized, buttonTitle: "Ok")

                    }
                }
            }
            else if (HttpMethod == "GET")
            {
                var req = URLRequest(url: try! url.asURL())
                req.httpMethod = "GET"
                req.setValue("application/json", forHTTPHeaderField: "content-type")
                req.timeoutInterval = 30 // 30 secs

                Alamofire.request(req).responseJSON { response in
                    
                    if((response.result.value) != nil) {
                        
                      let jsonResponce = JSON(response.result.value!)
                      completionHandler(jsonResponce, nil)
                     // print("Responce: \n\(jsonResponce)")
                      SVProgressHUD.dismiss()

                    }
                    else
                    {
                      completionHandler(nil, response.result.error!)
                      SVProgressHUD.dismiss()
                      appDelegate.showAlertAppDelegate(title: "Application ", message: "msgErrorServiceCall".localized, buttonTitle: "Ok")

                    //  print(response.result.error ?? "")
                  }
                }
              }
          }
          else
          {
            SVProgressHUD.dismiss()
            appDelegate.showAlertAppDelegate(title: "Application ", message: "msgErrorInternetConnection".localized, buttonTitle: "Ok")

          }
     }
}

