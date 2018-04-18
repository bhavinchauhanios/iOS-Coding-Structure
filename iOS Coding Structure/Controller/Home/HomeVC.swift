//
//  ViewController.swift
//  iOS Coding Structure
//
//  Created by WOS on 07/02/18.
//  Copyright © 2018 WOS. All rights reserved.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  // MARK: Outlet And Varible Define Here!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var tblContactList: UITableView!

  var arrContactList = NSMutableArray()
  var contactList = GetContact.self
  var data = [DataContact?]()

  //===========================================================================

  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    tblContactList.tableFooterView = UIView()

    tblContactList.estimatedRowHeight = 80.0
    tblContactList.rowHeight = UITableViewAutomaticDimension
    
    lblTitle.font = UIFont.circularStdBookWebfont(size: 18)
    lblTitle.text = "contacts".localized

    //ContactList load
    getContactList()
    
  }
  
  // MARK: Get Contacts API
  func getContactList(){
    

    var param = NSMutableDictionary()
     param = ["mynumber": "09512468722", "apikey" : "TEST"]
  

    //Internet Checking
    if Constants.internetChecker(reachability: Reachability()!){
      if #available(iOS 10.0, *) {
        WebServices.CallGlobalAPI(url: "https://jyapi.togglewave.com/rcci.svc/getcontacts", headers: nil, parameters: param, HttpMethod: "POST") { (jsonResponce, error) in
          
          if jsonResponce != nil{
            let contacts = GetContact.self.init(json: jsonResponce!)
            self.data = (contacts.getcontactsResult?.data)!
            self.tblContactList.reloadData()
            
            Constants.hideLoader()
          }
          else
          {
            
          }
        }
      } else {
        // Fallback on earlier versions
      }
    }
    else
    {
      Constants.hideLoader()
      UIAlertController.showAlertMessage(title: "Application ", message: "msgErrorInternetConnection".localized)
    }
  }
  
  // MARK: UITableViewDataSource Delegate
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell

    
    let contact = self.data[indexPath.row]
    
      cell.lblName.font = UIFont.circularMedium(size: 18)
      cell.lblContactNo.font = UIFont.circularStdBookWebfont(size: 16)
      cell.lblProfileName.font = UIFont.circularStdBookWebfont(size: 22)

      cell.lblContactNo.textColor = .gray
      
      cell.lblName.text = contact?.caption?.capitalized
      cell.lblContactNo.text = contact?.internationalNumber
    
    let imageURL = URL(string: (contact?.imagebase64)!)

    if imageURL != nil{
        
        DispatchQueue.main.async {
          cell.imgProfilePic.kf.setImage(with: imageURL)
        }
        cell.lblProfileName.isHidden = true
      }
      else{
        cell.lblProfileName.isHidden = false
        cell.lblProfileName.text = String(format:"\(contact?.caption?.first ?? " ")").capitalized
        cell.imgProfilePic.kf.setImage(with: nil)
      }
    
      if self.data[indexPath.row]?.isLineShared == true{
        cell.imgLineShare.isHidden = false
      }
      else{
        cell.imgLineShare.isHidden = true
      }
      
      cell.imgProfilePic.layer.masksToBounds = true
      cell.imgProfilePic.layer.cornerRadius = cell.imgProfilePic.frame.size.height / 2

    return cell
  }
  
  //  MARK: UITableView Delegate
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
}

