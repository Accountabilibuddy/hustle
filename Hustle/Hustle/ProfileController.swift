//
//  ProfileController.swift
//  Hustle
//
//  Created by Luay Younus on 4/11/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        CloudKit.shared.getUserID { (profileName) in
            self.profileName.text = profileName
        }

        
        CloudKit.shared.getProfileImageRecord { (image) in
            print("the image we got back for profile\(String(describing: image))")
            if image != nil {
                self.profileImage.image = image
            }
        }
    }
    
    
    @IBAction func imageTapped(_ sender: Any) {
        self.presentActionSheet()
    }
    
    
    func presentImagePickerWith(sourceType: UIImagePickerControllerSourceType){
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = sourceType
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func presentActionSheet(){
        let actionSheetController = UIAlertController(title: "Source", message: "Please Select Source Type", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.presentImagePickerWith(sourceType: .camera)
            self.imagePicker.allowsEditing = true
        }
        
        let photoAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.presentImagePickerWith(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            actionSheetController.addAction(cameraAction)
        }
        
        actionSheetController.addAction(photoAction)
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.pad {
            actionSheetController.addAction(cancelAction)
        }
        
        let popover = actionSheetController.popoverPresentationController
        popover?.sourceView = profileImage
        popover?.sourceRect = profileImage.bounds
        popover?.permittedArrowDirections = UIPopoverArrowDirection.any
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
}

//MARK: UIImagePickerController Delegate
extension ProfileController : UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image = UIImage()
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originalImage
        }
        
        self.dismiss(animated: true) {
            UIView.transition(with: self.profileImage,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.profileImage.image = image
            }, completion: nil)
        }
        saveImageAfterPicking(image:image)
    }
    
    func saveImageAfterPicking(image: UIImage){
        let newUser = User(profileImage: image)
        
        CloudKit.shared.saveProfileImage(user: newUser, completion: { (success) in
            if success {
                print("Profile Image Saved Successfully to the cloud")
            } else {
                print("Unsuccessful save of Profile Image to the cloud")
            }
            
        })
    }
}


