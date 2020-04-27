//
//  ViewController.swift
//  VideoConfrenceProject
//
//  Created by Ali Mohamed on 4/27/20.
//  Copyright © 2020 Ali Mohamed. All rights reserved.
//

import UIKit
import JitsiMeet
class ViewController: UIViewController, JitsiMeetViewDelegate {

    @IBOutlet weak var meetingView: JitsiMeetView!
    
    fileprivate var pipViewCoordinator: PiPViewCoordinator?

    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let rect = CGRect(origin: CGPoint.zero, size: size)
        pipViewCoordinator?.resetBounds(bounds: rect)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        meetingView.delegate = self
        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            builder.welcomePageEnabled = true
        }
        meetingView.join(options)
    }

    func conferenceTerminated(_ data: [AnyHashable : Any]!) {
        DispatchQueue.main.async {
            
        }
    }

    func enterPicture(inPicture data: [AnyHashable : Any]!) {
        DispatchQueue.main.async {
            self.pipViewCoordinator?.enterPictureInPicture()
        }
    }
}

