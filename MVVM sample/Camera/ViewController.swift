//
//  ViewController.swift
//  MVVM sample
//
//  Created by Andrei Sushkou on 17.02.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var flashButton: UIButton!
    @IBOutlet private var livePhotoButton: UIButton!
    
    var viewModel: CameraViewModelProtocol = CameraViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFlashButton()
        configureLivePhotoButton()
    }
    
    @IBAction func didTapFlashButton() {
        viewModel.isFlashEnabled = !viewModel.isFlashEnabled
        configureFlashButton()
    }
    
    @IBAction func didTapLivePhotoButton() {
        viewModel.isLivePhotoEnabled = !viewModel.isLivePhotoEnabled
        configureLivePhotoButton()
    }
    
    private func configureFlashButton() {
        let systemName = viewModel.isFlashEnabled ? "lightbulb" : "lightbulb.slash"
        flashButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    private func configureLivePhotoButton() {
        let systemName = viewModel.isFlashEnabled ? "livephoto" : "livephoto.slash"
        livePhotoButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}

