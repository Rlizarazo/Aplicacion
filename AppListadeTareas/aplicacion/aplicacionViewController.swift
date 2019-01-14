//
//  aplicacionViewController.swift
//  aplicacion
//
//  Created by user150462 on 1/9/19.
//  Copyright © 2019 user150462. All rights reserved.
//

import UIKit

class aplicacionViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {
    static let title = "Aplicacion"
    static let cellIdentifier = "CellIdentifier"
   static let cacheKey = "CacheKey"
    @IBOutlet weak var tableView: UITableView?
    
    var items: NSMutableArray = NSMutableArray()
    var cache: CacheProtocol = KeyedArchiverCache() // UserDefaultsCache()
    override func viewDidLoad() {
    super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load persisted data, if any exists
        self.load()
        
        self.title = aplicacionViewController.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(aplicacionViewController.didTapAdd(_sender:)))
    
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: aplicacionViewController.cellIdentifier)

    }
    override func setEditing(_ editing: Bool, animated: Bool){
        super.setEditing(editing, animated: animated)
        self.tableView?.isEditing = editing
        self.navigationItem.rightBarButtonItem?.isEnabled = !editing
    }
    // MARK: AddItemViewControllerProtocol
    
        func addItem(item: String) {

        // Add the new item to our items array
        
        self.items.insert(item, at: 0)
        
        // Modify the tableview / listview to display this new item
    
            let indexPath = IndexPath(row: 0, section: 0)

            self.tableView?.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            // Save the current data set to disk
            self.save()
}
// MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: aplicacionViewController.cellIdentifier)!
        let item = self.items[indexPath.row] as? String
        cell.textLabel?.text = item
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.items.removeObject(at: indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            // Save the current data set to disk
            self.save()
            
        }
    }
// MARK: Actions
    
    @objc func didTapAdd(_sender: UIBarButtonItem)
    {
        
        let viewController = AddItemViewController()
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = UIColor.white
        
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
// MARK: Cache Actions
    func load () {
        let object = self.cache.loadObjectForKey(key: aplicacionViewController.cacheKey)
        if let object = object as? NSArray {
            self.items = NSMutableArray(array: object)
        }
    }
    func save () {
        print("save")
        self.cache.saveObject(object: self.items, key: aplicacionViewController.cacheKey)
    }
    }
        

