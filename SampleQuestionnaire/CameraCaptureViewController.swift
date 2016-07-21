//
//  CameraCaptureViewController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/07/13.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit
import AVFoundation

class CameraCaptureViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var input:AVCaptureDeviceInput!
    var output:AVCaptureStillImageOutput!
    var session:AVCaptureSession!
    var preView:UIView!
    var camera:AVCaptureDevice!
    
    @IBOutlet weak var albumButton: UIButton!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var captureFooterView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        // 画面タップでシャッターを切るための設定
        //        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped:")
        //        // デリゲートをセット
        //        tapGesture.delegate = self;
        //        // Viewに追加.
        //        self.view.addGestureRecognizer(tapGesture)
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: #selector(CameraCaptureViewController.onClickcloseButton(_:)))
        self.navigationItem.setLeftBarButtonItem(closeButton, animated: true)
    }
    
    
    // メモリ管理のため
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        // スクリーン設定
        setupDisplay()
        // カメラの設定
        setupCamera()
    }
    
    // メモリ管理のため
    override func viewDidDisappear(animated: Bool) {
        // camera stop メモリ解放
        session.stopRunning()
        
        for output in session.outputs {
            session.removeOutput(output as? AVCaptureOutput)
        }
        
        for input in session.inputs {
            session.removeInput(input as? AVCaptureInput)
        }
        session = nil
        camera = nil
    }
    
        func setupDisplay(){
            // プレビュー用のビューを生成
            preView = UIView(frame: CGRectMake(0.0, 0.0, UIScreenUtil.screenWidth(), UIScreenUtil.screenHeight()))
    
        }
    
    func setupCamera(){
        
        // セッション
        session = AVCaptureSession()
        
        for caputureDevice: AnyObject in AVCaptureDevice.devices() {
            // 背面カメラを取得
            if caputureDevice.position == AVCaptureDevicePosition.Back {
                camera = caputureDevice as? AVCaptureDevice
            }
            // 前面カメラを取得
            //if caputureDevice.position == AVCaptureDevicePosition.Front {
            //    camera = caputureDevice as? AVCaptureDevice
            //}
        }
        
        // カメラからの入力データ
        do {
            input = try AVCaptureDeviceInput(device: camera) as AVCaptureDeviceInput
        } catch let error as NSError {
            print(error)
        }
        
        // 入力をセッションに追加
        if(session.canAddInput(input)) {
            session.addInput(input)
        }
        
        // 静止画出力のインスタンス生成
        output = AVCaptureStillImageOutput()
        // 出力をセッションに追加
        if(session.canAddOutput(output)) {
            session.addOutput(output)
        }
        
        // セッションからプレビューを表示を
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        previewLayer.frame = self.preView.bounds
//        previewLayer.videoGravity = AVLayerVideoGravityResize
//        previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        // レイヤーをViewに設定
        // これを外すとプレビューが無くなる、けれど撮影はできる
        self.view.layer.addSublayer(previewLayer)
        
        session.startRunning()
        //captureFooterViewを一番前に持ってくる
        self.view.bringSubviewToFront(captureFooterView)
    }
    
    
    //    // タップイベント.
    //    func tapped(sender: UITapGestureRecognizer){
    //        print("タップ")
    //        takeStillPicture()
    //    }
    @IBAction func onClickCaptureButton(sender: UIButton) {
        takeStillPicture()
    }
    
    func takeStillPicture(){
        
        // ビデオ出力に接続.
        if let connection:AVCaptureConnection? = output.connectionWithMediaType(AVMediaTypeVideo){
            // ビデオ出力から画像を非同期で取得
            output.captureStillImageAsynchronouslyFromConnection(connection, completionHandler: { (imageDataBuffer, error) -> Void in
                
                // 取得画像のDataBufferをJpegに変換
                let imageData:NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
                
                // JpegからUIImageを作成.
                let image:UIImage = UIImage(data: imageData)!
                let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake((self.navigationController?.navigationBar.frame.size.height)! + UIApplication.sharedApplication().statusBarFrame.height, 0.0 , image.size.width, image.size.height - self.captureFooterView.frame.height))
                let cropImage = UIImage(CGImage: cropCGImageRef!, scale: image.scale, orientation: image.imageOrientation)
                
                // アルバムに追加.
                print("\(image.scale)")
                print("\(cropImage)")
                print("\(image)")
                UIImageWriteToSavedPhotosAlbum(cropImage, self, nil, nil)
                
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func onClickcloseButton(sender: UIButton){
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

