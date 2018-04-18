//
//  GlobalConstant.swift
//  iOS Coding Structure
//
//  Created by WOS on 08/02/18.
//  Copyright © 2018 WOS. All rights reserved.
//

import UIKit
import AVFoundation


struct Constants {
  
  let reachability = Reachability()!

  //MARK: Internet Active or Deactive Check
  static func internetChecker(reachability: Reachability) -> Bool {
    // print("\(reachability.description) - \(reachability.connection)")
    var check:Bool = false
    
    if reachability.connection == .wifi {
      check = true
    }
    else if reachability.connection == .cellular {
      check = true
    }
    else
    {
      check = false
    }
    return check
  }

  //MARK: Show Loader
  static func showLoader(loaderText: String) {
    DispatchQueue.main.async {
      
       let Storyboard = UIStoryboard(name: "Main", bundle: nil)
      let loaderVc = Storyboard.instantiateViewController(withIdentifier: "LoaderVC") as! LoaderVC
      loaderVc.modalPresentationStyle = .overFullScreen
      loaderVc.modalTransitionStyle = .crossDissolve
      loaderVc.strLoaderText = loaderText
      UIApplication.shared.keyWindow?.rootViewController?.present(loaderVc, animated: true, completion: nil)
    
      
//      let Storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let loaderVc = Storyboard.instantiateViewController(withIdentifier: "LoaderVC") as! LoaderVC
//      loaderVc.strLoaderText = loaderText
//      viewController.addChildViewController(loaderVc)
//      loaderVc.view.frame = viewController.view.frame
//      viewController.view.addSubview(loaderVc.view)
    }
  }

  
  // MARK: Hide Loader
  static func hideLoader() {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hideloader"), object: nil)
  }
}
