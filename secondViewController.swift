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

    var answer = String()
    
    
    //ボタンの生成
    var text = UILabel()
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()

    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        qizu1()
        //ボタンのサイズ設定
        text.frame = CGRectMake(0, 0, 300, 150)
        button1.frame = CGRectMake(0, 0, 300, 100)
        button2.frame = CGRectMake(0, 0, 300, 100)
        button3.frame = CGRectMake(0, 0, 300, 100)
        button4.frame = CGRectMake(0, 0, 300, 100)
        //ボタンの背景色設定
        text.backgroundColor = UIColor.brownColor()
        button1.backgroundColor = UIColor.cyanColor()
        button2.backgroundColor = UIColor.redColor()
        button3.backgroundColor = UIColor.yellowColor()
        button4.backgroundColor = UIColor.greenColor()
        //ボタンの位置を指定する
        text.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.width/4)
        button1.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.width/1.2)
        button2.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.width/0.9)
        button3.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.width/0.7)
        button4.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.width/0.6)
        //ボタンを画面に表示させる
        self.view.addSubview(text)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
        
        //ボタンにイベントを追加する
        button1.addTarget(self, action: #selector(self.button1push), forControlEvents: .TouchUpInside)
        button2.addTarget(self, action: #selector(self.button2push), forControlEvents: .TouchUpInside)
        button3.addTarget(self, action: #selector(self.button3push), forControlEvents: .TouchUpInside)
        button4.addTarget(self, action: #selector(self.button4push), forControlEvents: .TouchUpInside)
        self.qizu1()
        
        appdelegate.session?.delegate = self
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //各ボタンが押された時に実行されるメソッド
    func button1push(sender: UIButton){
        print("1push")
        if answer == "1"{
        self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.blueColor()
        }
    }
    func button2push(sender: UIButton){
        if answer == "2"{
            self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.blueColor()
        }
        
    }
    func button3push(sender: UIButton){
        if answer == "3"{
            self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.blueColor()
        }
        
    }
    func button4push(sender: UIButton){
        if answer == "1"{
            self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.blueColor()
        }
        
    }
    func qizu1(){
    var qizu = arc4random()%5
        qizu += 1
    //クイズの内容
    switch qizu {
    case 0:
    text.text = "apple"
    button1.setTitle("りんご", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("バナナ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("みかん", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("なし", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "1"
    
    
    case 1:
    text.text = "orange"
    button1.setTitle("りんご", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("バナナ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("みかん", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("なし", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "3"
    
    case 2:
    text.text = "banana"
    button1.setTitle("りんご", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("バナナ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("みかん", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("なし", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "2"
    
    case 3:
    text.text = "dog"
    button1.setTitle("いぬ", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("ねこ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("うさぎ", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("ハムスター", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "1"
    case 4:
    text.text = "cat"
    button1.setTitle("いぬ", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("ねこ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("うさぎ", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("ハムスター", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "2"
    case 5:
    text.text = "rabbit"
    button1.setTitle("いぬ", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("ねこ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("うさぎ", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("ハムスター", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "3"
    
    default:
    text.text = "hum"
    button1.setTitle("いぬ", forState: UIControlState.Normal)
    button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button2.setTitle("ねこ", forState: UIControlState.Normal)
    button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button3.setTitle("うさぎ", forState: UIControlState.Normal)
    button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button4.setTitle("ハムスター", forState: UIControlState.Normal)
    button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    answer = "4"
    }
        
    }
    
    
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        
    }
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        

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
