//
//  HomeViewController.swift
//  PicFeed
//
//  Created by Adam Wallraff on 7/25/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var selectedImageView: UIImageView!
    
    @IBOutlet weak var leadingConstraintForFilterButton: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraintForPostButton: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.selectedImageView.image != nil{
            animateInButtons()
        }
    }
    
    
    @IBAction func userTappedImage(_ sender: Any) {
        print("user tapped image")
//        presentImagePicker(sourceType: .camera)
        
        presentAlertController()
    }
    
    @IBAction func postButtonPressed(_ sender: Any) {
        
        if let newImage = self.selectedImageView.image {
            let newPost = Post(image: newImage)
            
            CloudKit.shared.save(post: newPost, completion: { (success) in
                if success {
                    print("Successfully Saved to the Cloud!")
                } else {
                    print("Unsuccessful in saving to Cloud...")
                }
            })
        }
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Filters", message: "Please Select a filter:", preferredStyle: .alert)
        
        let chromeAction = UIAlertAction(title: "Chrome", style: .default) { (action) in
            Filters.filter(image: self.selectedImageView.image!, withFilter: .CIPhotoEffectChrome, completion: { (filteredImage) in
                self.selectedImageView.image = filteredImage
            })
        }
        
        let blackAndWhiteAction = UIAlertAction(title: "Black and White", style: .default) { (action) in
            if let imageViewImage = self.selectedImageView.image {
                Filters.filter(image: imageViewImage, withFilter: .CIPhotoEffectMono, completion: { (filteredImage) in
                    self.selectedImageView.image = filteredImage
                })
            }
        }
    
        alertController.addAction(blackAndWhiteAction)
        alertController.addAction(chromeAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    func presentAlertController(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.presentImagePicker(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    func presentImagePicker(sourceType: UIImagePickerControllerSourceType){
        
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = sourceType
        
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            self.selectedImageView.image = image

            print(image)
        }
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func animateInButtons(){
        self.leadingConstraintForFilterButton.constant = 0
        self.trailingConstraintForPostButton.constant = 0
        
        UIView.animate(withDuration: 0.5) { 
            self.view.layoutIfNeeded()
            self.selectedImageView.layer.cornerRadius = 100
        }
    }
    
}






