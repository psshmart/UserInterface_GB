//
//  LoginFormController.swift
//  vkClient
//
//  Created by Svetlana Safonova on 03.09.2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "admin" {
            return true
        } else {
            let alert = UIAlertController(title: "Error", message: "Введены неверные данные", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
            
            loginInput.text = ""
            passwordInput.text = ""
            
            return false
        }
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "admin" {
            print("Успешная авторизация")
        } else {
            print("Ошибка авторизации")
        }
    }
}
