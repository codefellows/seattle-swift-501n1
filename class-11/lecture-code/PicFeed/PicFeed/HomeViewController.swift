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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userTappedImage(_ sender: Any) {
        print("user tapped image")
//        presentImagePicker(sourceType: .camera)
        
        presentAlertController()
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
    
}






