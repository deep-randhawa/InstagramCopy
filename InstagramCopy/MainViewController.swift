//
//  MainViewController.swift
//  InstagramCopy
//
//  Created by Deep S Randhawa on 3/8/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit
import AFNetworking
import Parse

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // OUTLETS
    @IBOutlet weak var mainTableView: UITableView!
    
    // GLOBAL VARS
    var posts: [PFObject] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(named: "ic_home"), tag: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.estimatedRowHeight = 400
        mainTableView.rowHeight = UITableViewAutomaticDimension
        
        let query = PFQuery.init(className: "Post")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if error == nil {
                self.posts = posts!
                self.mainTableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        let post = posts[indexPath.row]
        
        cell.captionLabel.text = post["caption"] as? String
        if let postImage = post.value(forKey: "media") as? PFFile {
            postImage.getDataInBackground(block: { (imageData: Data?, error: Error?) in
                guard let data = imageData else {
                    return
                }
                cell.photoImageView.image = UIImage(data: data)
            })
        }
        return cell
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
