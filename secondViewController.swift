//
//  secondViewController.swift
//  chuukan2
//
//  Created by 山口航輝 on 2016/11/02.
//  Copyright © 2016年 山口航輝. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Modori(sender: AnyObject) {
        let viewcontroller = self.storyboard!.instantiateViewControllerWithIdentifier("view1")
        self.presentViewController(viewcontroller,animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
