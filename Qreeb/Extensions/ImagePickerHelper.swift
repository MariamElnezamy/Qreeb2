//
//  ImagePickerHelper.swift
//  Garsoncom
//
//  Created by Mohamed anwar on 11/13/18.
//  Copyright © 2018 Mohamed anwar. All rights reserved.
//

import UIKit
class ImagePickerHelper: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private weak var presentingViewController: UIViewController?
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        return imagePicker
    }()
    
    var imageSelected: ((_ image: UIImage) -> ())?
    
    init(viewController: UIViewController,
         sourceType: UIImagePickerController.SourceType  ) {
        super.init()
        presentingViewController = viewController

    }
    
    func presentImagePicker() {
        presentingViewController?.present(imagePicker, animated: true, completion: nil)
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageSelected?(pickedImage)
        } else if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageSelected?(pickedImage)
        }
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
