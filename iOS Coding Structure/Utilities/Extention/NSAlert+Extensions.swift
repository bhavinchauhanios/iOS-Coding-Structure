//
//  NSAlert+Extensions.swift
//  BuildTimeAnalyzer
//

import UIKit

extension UIAlertController {
  
  static func showAlertMessage(title:String, message:String) -> Void {
  
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    
  }
}
