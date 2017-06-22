//
//  UIViewHelper.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/22.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//


extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        
        set {
            self.layer.borderColor = newValue.cgColor
        }
        
    }
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }

}

@IBDesignable class MyPreviewLabel: UILabel {
    
}


import AVFoundation
import SwiftySound

func turnTruch() {
    guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else {
        return
    }
    
    if device.hasTorch && device.isTorchAvailable {
        try?device.lockForConfiguration()
        
        if device.torchMode == .off {
            device.torchMode = .on
        } else {
            device.torchMode = .off
        }
        
        device.unlockForConfiguration()
    }
}

func voiceBtnStatus(voiceBtn: UIButton, soundFile: String) -> Bool {
    let defaults = UserDefaults.standard
    
    if defaults.bool(forKey: "isVoiceOn") { //true
        voiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
        Sound.play(file: soundFile)
        
        return true
    } else { //false
        voiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
        return false
    }
    
}









