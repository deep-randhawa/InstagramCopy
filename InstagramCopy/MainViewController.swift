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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let query = PFQuery.init(className: "Post")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if error == nil {
                self.posts = posts!
                
                // TODO: Fix this once you're able to upload data
                // self.mainTableView.reloadData()
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
