//
//  EditingViewController.swift
//  Journal
//
//  Created by Francis Tseng on 2017/8/4.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CoreData

class EditingViewController: UIViewController {

    @IBOutlet weak var editTitle: SkyFloatingLabelTextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let tapRec = UITapGestureRecognizer()
    
    var titleForSegue = ""
    var imageForSegue: UIImage!
    var contextForSegue = ""
    
    var titleOld = ""
    var imageOld: UIImage!
    var contextOld = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapRec.addTarget(self, action: #selector(addImage))
        
        editTitle.text = titleForSegue
        titleOld = editTitle.text!
        
        imageView.image = imageForSegue
        imageOld = imageView.image
        
        textView.text = contextForSegue
        contextOld = textView.text
        
        imageView.addGestureRecognizer(tapRec)
        
        imageView.isUserInteractionEnabled = true
        
        textView.text = contextForSegue
    
    }

    
    @IBAction func exitPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func updatePressed(_ sender: Any) {
        
        
        
        
    }

}

extension EditingViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            
            textView.text = nil
            
            textView.textColor = UIColor(red: 131/255.0, green: 156/255.0, blue: 152/255.0, alpha: 1)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Context ..."
            textView.textColor = UIColor.lightGray
        }
    }
    
}

extension EditingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func addImage() {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = selectedImage
            imageView.contentMode = .scaleAspectFill
            imageView.frame = CGRect(x: 0, y: 0, width: selectedImage.size.width, height: selectedImage.size.height)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
