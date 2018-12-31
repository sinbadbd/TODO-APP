//
//  ListController.swift
//  IOSDEV
//
//  Created by sinbad on 10/15/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
class ListController: UIViewController , GDHeaderDeletegate, NewItemPopupDelegate{
    
    
    func addItemToList(text:String) {
         print("add item to text\(text)")
    }
    
    func openAddItenPopup() {
        print("trying to add item to the list")
    }
    
    
    let header = GDHeaderView( title: "Stuff to get done", subtitle: "10 LEFT")
    let popUp = NewItemPopup()
    
    var keybordHeight:CGFloat = 280
    
    
    let bg:UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        return view
    }()
    
    
    
    // keyboard handle
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keybordHeight = keyboardSize.height
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        
        view.addSubview(header)
        //popUp.backgroundColor = UIColor.red
        
        // Header contraint
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // popup constraint
        
        view.addSubview(popUp)
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        popUp.editText.delegate = self
        popUp.delegate = self
        // edit text field
        //view.addSubview(editField)
        
        
       header.delegate = self
        
        
    }
}


extension ListController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: -keybordHeight), duration: 0.40)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.60)
    }
}





