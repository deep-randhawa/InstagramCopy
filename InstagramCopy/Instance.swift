//
//  Instance.swift
//  InstagramCopy
//
//  Created by Deep S Randhawa on 3/8/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit

class Instance: NSObject {

    let caption: String?
    let photoURL: URL?
    
    init(caption: String, photoURL: URL) {
        self.caption = caption
        self.photoURL = photoURL
    }
    
}
