//
//  ViewController.swift
//  chuukan2
//
//  Created by 山口航輝 on 2016/10/23.
//  Copyright © 2016年 山口航輝. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class ViewController: UIViewController,MCSessionDelegate,MCNearbyServiceBrowserDelegate,MCNearbyServiceAdvertiserDelegate {
    
    let peer : MCPeerID = MCPeerID(displayName: UIDevice.currentDevice().name)
    var session : MCSession?
    var browser : MCNearbyServiceBrowser?
    var advertis : MCNearbyServiceAdvertiser?
    let service = "p2p"
    

    override func viewDidLoad() {
        self.session = MCSession(peer: peer)
        self.session!.delegate = self
        self.browser = MCNearbyServiceBrowser(peer: peer, serviceType: service)
        self.browser!.delegate = self
        self.advertis = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: service)
        self.advertis?.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func browser(sender: AnyObject) {
        
        self.browser!.startBrowsingForPeers()
    }

    @IBAction func advertiser(sender: AnyObject) {
        self.advertis!.startAdvertisingPeer()
    }
    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("[MCNearbyServiceBrowserDelegate] browser:foundPeer:withDiscoveryInfo:")
        print("  + peerID = \(peerID.displayName)")
        print("  + info = \(info)")
        browser.invitePeer(peerID, toSession: self.session!, withContext: nil, timeout: 10)
    }
    
    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("[MCNearbyServiceBrowserDelegate] browser:lostPeer:")
        print("  + peerID = \(peerID.displayName)")
    }
    
    
    // MARK:- MCNearbyServiceAdvertiserDelegate
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: (Bool, MCSession) -> Void) {
        print("[MCNearbyServiceAdvertiserDelegate] advertiser:didReceiveInvitationFromPeer:withContext:invitationHandler:")
        print("  + peerID = \(peerID.displayName)")
        
        let alert = UIAlertController(title: "招待を受けました", message: "from \(peerID.displayName)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "参加", style: .Default) { action in
            invitationHandler(true, self.session!)
            })
        alert.addAction(UIAlertAction(title: "拒否", style: .Cancel) { action in
            invitationHandler(false, self.session!)
            })
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        let viewcontroller = self.storyboard!.instantiateViewControllerWithIdentifier("view2") 
        self.presentViewController(viewcontroller,animated: true, completion: nil)
        print("change window")
        
    }
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        print("[MCSessionDelegate] session:didReceiveData:fromPeer:")
    }
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
    }
    
}

