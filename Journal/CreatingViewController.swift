//
//  CreatingViewController.swift
//  Journal
//
//  Created by Francis Tseng on 2017/8/4.
//  Copyright © 2017年 Francis Tseng. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

struct Event {
    var title: String
    var context: String
    var image: UIImage
}

class CreatingViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var addImageLabel: UILabel!
    
    @IBOutlet weak var titleTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var contextTextView: UITextView!
    
    let tapRec = UITapGestureRecognizer()
    
    var event = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapRec.addTarget(self, action: #selector(addImage))

        imageView.addGestureRecognizer(tapRec)

        imageView.isUserInteractionEnabled = true
        
        
        }

    @IBAction func exitPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func savePressed(_ sender: Any) {
        
        let saveManager = SaveManager()
        
        saveManager.saveToCoreData(titleTextField.text!, contextTextView.text, imageView.image!)
        
    }

}

extension CreatingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        addImageLabel.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
    }

}
