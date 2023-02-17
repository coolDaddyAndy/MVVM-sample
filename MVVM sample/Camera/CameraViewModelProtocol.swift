//
//  CameraViewModelProtocol.swift
//  MVVM sample
//
//  Created by Andrei Sushkou on 17.02.23.
//

import UIKit

protocol CameraViewModelProtocol {
    var isFlashEnabled:        Bool { get set }
    var isLivePhotoEnabled:    Bool { get set }
    var isWideScreenAvailable: Bool { get }
    var isWideScreenEnabled:   Bool { get set }
    var isCameraFlipAvailable: Bool { get }
    
    func getAvailableCameraModes() -> [CameraMode]
    func getRecentImage() -> UIImage?
}
