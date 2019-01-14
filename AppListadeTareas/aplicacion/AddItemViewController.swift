//
//  AddItemViewController.swift
//  aplicacion
//
//  Created by user150462 on 1/10/19.
//  Copyright © 2019 user150462. All rights reserved.
//

import UIKit

protocol AddItemViewControllerProtocol {
    func addItem(item: String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {
     static let title = "Add Item"

    @IBOutlet weak var textField: UITextField?
    
    var delegate: AddItemViewControllerProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = AddItemViewController.title
        
        self.edgesForExtendedLayout = UIRectEdge()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: Selector(("didTapAdd:")))
        
        self.textField?.becomeFirstResponder()
        self.textField?.delegate = self
    }
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dismiss()
        return false
    }
    
    // MARK: Actions
    
    func didTapcancel(sender: UIBarButtonItem) {
        
        self.dismiss()
        
    }
    // MARK: Private API
    func dismiss() {
        self.dismiss(animated: true) { () -> Void in
        if let delegate = self.delegate, let item = self.textField?.text, item.count > 0 {
            delegate.addItem(item: item)
    
        }
        }
    }
    
}
      


