//
//  ViewController.swift
//  ScreenMirrorDemo
//
//  Created by iapp on 10/07/23.
//

import UIKit
import ReplayKit
import AVFoundation
import MediaPlayer
import AVKit


class ViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if screen mirroring is available
        //        guard UIScreen.main.canUseAirPlayScreen() else {
        //            print("Screen mirroring is not available")
        //            return
        //        }

        // Configure and start the screen mirroring session
        //        configureCaptureSession()
        //        startScreenMirroring()

        let av = AVRoutePickerView()
        av.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
        av.backgroundColor = UIColor.red
        self.view.addSubview(av)


        //        AVRoutePickerView *routePickerView = [[AVRoutePickerView alloc] initWithFrame:CGRectMake(0.0f, 30.0f, 30.0f, 30.0f)];
        //           routePickerView.backgroundColor = [UIColor lightGrayColor];
        //           [self.view addSubview:routePickerView];
        //
        //           AVAsset *asset = [AVAsset assetWithURL:[NSURL URLWithString:@"https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"]];
        //           AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithAsset:asset];
        //           AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
        //           AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        //           [playerLayer setFrame:CGRectMake(0.0f, 40.0f, self.view.frame.size.width, self.view.frame.size.height - 40.0f)];
        //           [self.view.layer addSublayer:playerLayer];
        //           [player seekToTime:kCMTimeZero];
        //           [player play];


    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Stop screen mirroring when the view disappears
        // stopScreenMirroring()
    }

    func configureCaptureSession() {
        // Create a new capture session
        captureSession = AVCaptureSession()

        // Set the capture session's preset to match the screen resolution
        if captureSession!.canSetSessionPreset(.hd1920x1080) {
            captureSession!.sessionPreset = .hd1920x1080
        }

        // Create a screen capture input
//        guard let screenInput = AVCaptureScreenInput(display: "UIScreen.main") else {
//            print("Failed to create screen capture input")
//            return
//        }

        // Add the screen capture input to the capture session
//        if captureSession!.canAddInput(screenInput) {
//            captureSession!.addInput(screenInput)
//        }

        // Create a preview layer to display the screen capture
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        previewLayer?.frame = view.bounds
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
    }

    func startScreenMirroring() {
        // Start the capture session
        captureSession?.startRunning()
    }

    func stopScreenMirroring() {
        // Stop the capture session
        captureSession?.stopRunning()

        // Remove the preview layer from the view
        previewLayer?.removeFromSuperlayer()
    }
}


/*
// Screen Mirroring
class ViewController: UIViewController {

    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if screen mirroring is available

        /*
         guard UIScreen.main.isScreenMirroringEnabled else {
         print("Screen mirroring is not available")
         return
         }*/

        // Add an observer to detect when the screen mirroring status changes
        NotificationCenter.default.addObserver(self, selector: #selector(screenMirroringStatusDidChange), name: UIScreen.didConnectNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(screenMirroringStatusDidChange), name: UIScreen.didDisconnectNotification, object: nil)

        // Start screen mirroring
        startScreenMirroring()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Stop screen mirroring when the view disappears
        stopScreenMirroring()
    }

    //MARK :- Methods
    func startScreenMirroring() {
        // Start screen mirroring using ReplayKit
        let broadcastPicker = RPSystemBroadcastPickerView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        broadcastPicker.preferredExtension = "com.iTest.iTestApp.Ext"
        view.addSubview(broadcastPicker)
    }

    func stopScreenMirroring() {
        // Stop screen mirroring
        for subview in view.subviews {
            if let broadcastPicker = subview as? RPSystemBroadcastPickerView {
                broadcastPicker.removeFromSuperview()
            }
        }
    }
}
extension ViewController {
    // Screen Mirroring Change
    @objc func screenMirroringStatusDidChange() {
        if UIScreen.main.mirrored != nil {
            // Screen mirroring is active
            print("Screen mirroring is active")
        } else {
            // Screen mirroring is not active
            print("Screen mirroring is not active")
        }
    }
} */
