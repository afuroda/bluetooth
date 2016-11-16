//
//  secondViewController.swift
//  chuukan2
//
//  Created by 山口航輝 on 2016/11/02.
//  Copyright © 2016年 山口航輝. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class secondViewController: UIViewController,MCSessionDelegate {

    @IBOutlet weak var imageview: UIImageView!
    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        appdelegate.session?.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //view1に戻る
    @IBAction func Modori(sender: AnyObject) {
        let viewcontroller = self.storyboard!.instantiateViewControllerWithIdentifier("view1")
        self.presentViewController(viewcontroller,animated: true, completion: nil)
    }

    @IBAction func send(sender: AnyObject) {
        let image = UIImage(named: "o.png")
        let data = UIImagePNGRepresentation(image!)
        do{
            try appdelegate.session?.sendData(data!, toPeers: (appdelegate.session?.connectedPeers)!, withMode: .Reliable)
            print("send data")
        }catch let error as NSError{
            print("sned error")
        }
       
    
    }
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        
    }
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        print("recived data")

    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
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
