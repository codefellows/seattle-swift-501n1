//
//  HomeViewController.swift
//  PicFeed
//
//  Created by Adam Wallraff on 7/25/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit
import Social

let gAnimationTime = 1.0


class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GalleryViewControllerDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var selectedImageView: UIImageView!
    
    @IBOutlet weak var leadingConstraintForFilterButton: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraintForPostButton: NSLayoutConstraint!
    
    let kAnimationTime = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        
        if let tabBarController = self.tabBarController, let viewControllers = tabBarController.viewControllers {
            
            for viewController in viewControllers {
                if let galleryController = viewController as? GalleryViewController {
                    galleryController.delegate = self
                }
            }
            
//OLD CODE
//            if let galleryController = viewControllers[1] as? GalleryViewController {
//                    galleryController.delegate = self
//            }
            
        }

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
        
        Filters.shared.createContext = true
        
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
        

        let allFilters = ["Chrome" : FilterNames.CIPhotoEffectChrome,
                          "Black and White" : FilterNames.CIPhotoEffectMono,
                          "Vintage" : FilterNames.CIPhotoEffectTransfer]
        
        for (key, value) in allFilters {
            let alertAction = alertActionForFilter(name: value, title: key)
            alertController.addAction(alertAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func userLongPressed(_ sender: UILongPressGestureRecognizer) {
        
        guard let image = self.selectedImageView.image else { return }
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            if let composeController = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
                composeController.add(image)
                
                self.present(composeController, animated: true, completion: nil)
            }
        }
        
    }
    
    
    private func alertActionForFilter(name: FilterNames, title: String) -> UIAlertAction {
        
        let alertAction = UIAlertAction(title: title, style: .default) { (action) in
            if let imageViewImage = self.selectedImageView.image {
                Filters.shared.filter(image: imageViewImage, withFilter: name, completion: { (filteredImage) in
                    self.selectedImageView.image = filteredImage
                })
            }
        }
        
        return alertAction
    }
    
    
    func presentAlertController(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.presentImagePicker(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = self.selectedImageView
        alertController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: self.selectedImageView.frame.size.width, height: self.selectedImageView.frame.size.height)
        
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
            self.collectionView.reloadData()
            print(image)
        }
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func galleryController(didSelect image: UIImage) {
        self.selectedImageView.image = image
        self.tabBarController?.selectedIndex = 0
    }
    
    func animateInButtons(){
        self.leadingConstraintForFilterButton.constant = 0
        self.trailingConstraintForPostButton.constant = 0
        
        UIView.animate(withDuration: kAnimationTime) {
            self.view.layoutIfNeeded()
            self.selectedImageView.layer.cornerRadius = 100
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! PostCell
        
        let filter = Filters.shared.allFilters[indexPath.row]
        
        if let image = self.selectedImageView.image {
            
            Filters.shared.filter(image: image, withFilter: filter, completion: { (filteredImage) in
                cell.postImageView.image = filteredImage
            })
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Filters.shared.allFilters.count
    }
    
}






