//
//  PhotoCaptureViewController.swift
//  InstagramCopy
//
//  Created by Deep S Randhawa on 3/8/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit
import ParseUI
import Whisper

class PhotoCaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // OUTLETS
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    // GLOBAL VARS
    var instagramPost: PFObject!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem.init(title: "Capture", image: UIImage.init(named: "ic_add_a_photo"), tag: 2)
    }
    
    @IBAction func submitPost(_ sender: Any) {
        Post.postUserImage(image: photoView.image, withCaption: captionTextField.text) { (success: Bool, error: Error?) in
            if success {
                Whisper.show(whistle: Murmur.init(title: "Successfully submitted new post!"), action: .show(2))
            } else {
                Whisper.show(whistle: Murmur.init(title: "Something went wrong!"), action: .show(2))
                print(error?.localizedDescription)
            }
        }
    }
    @IBAction func selectNewImage(_ sender: Any) {
        let controller = UIImagePickerController.init()
        controller.delegate = self
        controller.allowsEditing = false
        controller.sourceType = .photoLibrary
        
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        captionTextField.placeholder = "Enter Caption Here"
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.photoView.image = image
            self.dismiss(animated: true, completion: nil)
        } else {
            print("Something went wrong!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
