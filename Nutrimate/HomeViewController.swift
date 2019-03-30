//
//  ViewController.swift
//  Nutrimate
//
//  Created by Anish Adhikari on 3/30/19.
//  Copyright © 2019 Anish Adhikari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var counter = 0;
    
    var pickedImage: UIImage?
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var apple: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil )
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.pickedImage = image
            self.apple.image = image
            
            showInfo(val: counter)
            counter = (counter+1)%2
        }else{
            print("Something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showInfo(val: Int) {
        if val == 0 {
            imageView2.image = UIImage(named: "banana_fact")
        } else {
            imageView2.image = UIImage(named: "granola_bar")
        }
    }
    
}

