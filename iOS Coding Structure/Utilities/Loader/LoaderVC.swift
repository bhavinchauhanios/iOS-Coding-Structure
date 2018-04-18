//
//  LoaderVC.swift
//  Driva
//
//  Created by WOS on 07/02/18.
//  Copyright © 2018 WOS. All rights reserved.
//

import UIKit
import SwiftyGif


class LoaderVC: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblLoaderText: UILabel!
  

    var strLoaderText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        imgLogo.isHidden = false
        imgLogo.image = UIImage.init(named: "")
        imgLogo.backgroundColor = UIColor.clear
        
        //Set GIF Image
        let gifManager = SwiftyGifManager(memoryLimit:10)
        let gif = UIImage(gifName:"loader")
        imgLogo.setGifImage(gif, manager: gifManager)
     
        lblLoaderText.text = strLoaderText
     
      NotificationCenter.default.addObserver(self, selector: #selector(self.dismissLoader), name: NSNotification.Name(rawValue: "hideloader"), object: nil)

    }
    
    @objc func dismissLoader() {
      //self.view.removeFromSuperview()
      
      DispatchQueue.main.async {
      self.dismiss(animated: true, completion: nil)
    }
  }

}
