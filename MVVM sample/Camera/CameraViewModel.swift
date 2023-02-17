//
//  CameraViewModel.swift
//  MVVM sample
//
//  Created by Andrei Sushkou on 17.02.23.
//

import AVFoundation
import UIKit


class CameraViewModel {
    let userDefaults = UserDefaults.standard
    let dataBaseService = DataBaseMockService()
}


// MARK: - CameraViewModelProtocol
extension CameraViewModel: CameraViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsLivePhotoEnabled")
        }
    }
    
    var isWideScreenAvailable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera,
                                           for: .video,
                                           position: .back) {
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsWideScreenEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsWideScreenEnabled")
        }
    }
    
    var isCameraFlipAvailable: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvailableCameraModes() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        modes.append(.pano)
        if let _ = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
            modes.append(.portrait)
        }
        if #available(iOS 11.0, *) {
            modes.append(.slowMo)
        }
        return modes
    }
    
    func getRecentImage() -> UIImage? {
        dataBaseService.getRecentImage()
    }
}
