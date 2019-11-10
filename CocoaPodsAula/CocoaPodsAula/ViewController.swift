//
//  ViewController.swift
//  CocoaPodsAula
//
//  Created by Thais Costa on 10/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import Lottie
import DragDropUI

class ViewController: UIViewController {
  @IBOutlet weak var animationView: DDView!

  let lottieView = AnimationView()

  override func viewDidLoad() {
    super.viewDidLoad()

    let animation = Animation.named("ChickenSave")

    lottieView.animation = animation
    lottieView.contentMode = .scaleAspectFit
    lottieView.frame = animationView.bounds
    lottieView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    lottieView.loopMode = .loop
    lottieView.play()

    animationView.addSubview(lottieView)
  }
}
