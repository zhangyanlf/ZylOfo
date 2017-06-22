//
//  ScanViewController.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/21.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//

import UIKit
import swiftScan
import FTIndicator
import SwiftySound

class ScanViewController: LBXScanViewController {
    var isFlashOn = false
    let defaults = UserDefaults.standard

    @IBOutlet weak var panelView: UIView!
    
    @IBOutlet weak var flashBtn: UIButton!
    
    /// 点击切换闪光灯
    ///
    /// - Parameter sender: sender
    @IBAction func flashBtnTap(_ sender: UIButton) {
        isFlashOn = !isFlashOn
        scanObj?.changeTorch()
        
        if isFlashOn {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch_w"), for: .normal)
        } else {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch_w"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "扫码用车"
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.white
        
        var style = LBXScanViewStyle()
        style.anmiationStyle = .NetGrid
        style.animationImage = UIImage(named: "CodeScan.bundle/qrcode_scan_part_net")
        
        scanStyle = style
        if defaults.bool(forKey: "isVoiceOn") {
            Sound.play(file: "上车前_D.m4a")
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.bringSubview(toFront: panelView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = UIColor.black
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        if let result = arrayResult.first {
            let msg = result.strScanned
            FTIndicator.setIndicatorStyle(.dark)
            FTIndicator.showToastMessage(msg)
        }
    }
    
}
