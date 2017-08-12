//
//  Filters.swift
//  PicFeed
//
//  Created by Adam Wallraff on 8/1/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit


typealias FilterCompletion = (UIImage?)->()

enum FilterNames: String{
    case CIPhotoEffectTransfer
    case CIPhotoEffectMono
    case CIPhotoEffectChrome
}

class Filters {
    
    static let shared = Filters()
    
    static var originalImage = UIImage()
    
    let context : CIContext
    
    var createContext = false
    
    init() {
        //GPU CONTEXT CODE
        let options = [kCIContextOutputColorSpace : NSNull()]
        
        guard let eAGLContext = EAGLContext(api: .openGLES2) else {
            fatalError("There was an issue accessing the GPU")
        }
        
        self.context = CIContext(eaglContext: eAGLContext, options: options)
    }
    
    func filter(image: UIImage, withFilter filterName: FilterNames, completion: @escaping FilterCompletion){
        
        OperationQueue().addOperation {
            
            guard let filter = CIFilter(name: filterName.rawValue) else {
                fatalError("There is an error with the filter name.")
            }
            
            let coreImage = CIImage(image: image)
            filter.setValue(coreImage, forKey: kCIInputImageKey)
            
            //Get final image after being filtered
            if let outputImage = filter.outputImage {
                
                if let cgImage = self.context.createCGImage(outputImage, from: outputImage.extent) {
                    let uiImage  = UIImage(cgImage: cgImage)
                    OperationQueue.main.addOperation {
                        completion(uiImage)
                    }
                }
                
            }
        }
    }
}















