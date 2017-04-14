//
//  HustleController.swift
//  Hustle
//
//  Created by Eve Denison on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class HustleController: UIViewController {
    
    var allJobSearchRecords = [JobSearch]()


    @IBOutlet weak var hustleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hustleTableView.delegate = self
        self.hustleTableView.dataSource = self

        
        CloudKit.shared.getJobSearchRecords { (jobSearch) in
            OperationQueue.main.addOperation {
                self.allJobSearchRecords = jobSearch  ?? []
                print(self.allJobSearchRecords.count)
                self.hustleTableView.reloadData()
            }
        }

        let jobSearchNibCell = UINib(nibName: JobSearchNibCell.identifier, bundle: nil)
        self.hustleTableView.register(jobSearchNibCell, forCellReuseIdentifier: JobSearchNibCell.identifier)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateJobSearchRecords()
        self.hustleTableView.reloadData()
            
    }
    
    func updateJobSearchRecords() {
        CloudKit.shared.getJobSearchRecords { (jobSearchRecord) in
            if let jobSearchRecord = jobSearchRecord {
                self.allJobSearchRecords = jobSearchRecord
                self.hustleTableView.reloadData()
            }
        }
    }
    
}

extension HustleController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allJobSearchRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hustleTableView.dequeueReusableCell(withIdentifier: JobSearchNibCell.identifier, for: indexPath) as! JobSearchNibCell
        
        let jobSearchRecord = self.allJobSearchRecords[indexPath.row]

        cell.jobSearchRecords = jobSearchRecord
        
        return cell
    }
}

// Border features by Axel Guilmin
@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}

