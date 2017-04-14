//
//  JobSearchController.swift
//  Hustle
//
//  Created by Kyle Hillman on 4/10/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class JobSearchController: UIViewController, UITextViewDelegate, BEMCheckBoxDelegate {

    var jobSearch : JobSearch!
    
//    @IBOutlet weak var didHighVolumeSearch: UISwitch!
    @IBOutlet weak var targetedSearch: UISwitch!
    @IBOutlet weak var targetedEvents: UISwitch!
    
    @IBOutlet weak var infoCoffee: UISwitch!
    @IBOutlet weak var meetUp: UISwitch!
    @IBOutlet weak var visitCompanies: UISwitch!
    @IBOutlet weak var followUp: UISwitch!
    
    @IBOutlet weak var commitToGitHub: UISwitch!
    @IBOutlet weak var codingWars: UISwitch!
    @IBOutlet weak var whiteBoarding: UISwitch!
    @IBOutlet weak var interviewQuestions: UISwitch!
    
    @IBOutlet weak var textFieldNotes: UITextView!
    
    @IBOutlet weak var didHighVolumeSearchBox: BEMCheckBox!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didHighVolumeSearchBox.delegate = self
        
        textFieldNotes.placeholder = "Place notes here"
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        print("User tapped \(checkBox.on)")
    }
    
    @IBAction func saveJobSearch(_ sender: Any) {
        
        let didHighVolumeSearch = self.didHighVolumeSearchBox.on
        let targetedSearch = self.targetedSearch.isOn
        let targetedEvents = self.targetedEvents.isOn
        
        let committedToGitHub = self.commitToGitHub.isOn
        let codingWars = self.codingWars.isOn
        let whiteBoarding = self.whiteBoarding.isOn
        let interviewQuestions = self.interviewQuestions.isOn
        
        let infoCoffee = self.infoCoffee.isOn
        let meetUps = self.meetUp.isOn
        let visitCompanies = self.visitCompanies.isOn
        let followUp = self.followUp.isOn
        
        let textFieldNotes = self.textFieldNotes.text ?? ""

        
        let currentJobSearch = JobSearch.init(didHighVolumeSearch: didHighVolumeSearch, targetedSearch: targetedSearch, targetedEvents: targetedEvents, committedToGitHub: committedToGitHub, codingWars: codingWars, whiteBoarding: whiteBoarding, interviewQuestions: interviewQuestions, infoCoffee: infoCoffee, meetupEvents: meetUps, visitCompanies: visitCompanies, followUp: followUp, textFieldNotes: textFieldNotes)
        
        
        if let recordSaved = JobSearch.recordFor(jobSearch: currentJobSearch){
            CloudKit.shared.save(record: recordSaved, completion: { (success) in
                print("Saving Record: \(success)")
            })
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}


/// Credit to Tijme Gommers for placeholder text
extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.characters.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.characters.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}
