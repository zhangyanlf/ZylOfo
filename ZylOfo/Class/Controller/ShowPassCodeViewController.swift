//
//  ShowPassCodeViewController.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/22.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//

import UIKit
import SwiftyTimer
import SwiftySound

class ShowPassCodeViewController: UIViewController {

    var isTouchOn = false
    var isVoiceOn = true
    let defaults = UserDefaults.standard
    var timer : Timer!
    
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    var remindSeconds = 121
    
    /// 灯光按钮
    @IBOutlet weak var touchBtn: UIButton!
    
    /// 声音按钮
    @IBOutlet weak var voiceBtn: UIButton!
    
    /// 点击打开灯光
    ///
    /// - Parameter sender: sender
    @IBAction func touchBtnTap(_ sender: UIButton) {
        turnTruch()
        
        if isTouchOn {
            touchBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: .normal)
        } else {
            touchBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: .normal)
        }
        
        isTouchOn = !isTouchOn
    }
    
    
    /// 点击声音按钮动作
    ///
    /// - Parameter sender: sender
    @IBAction func voiceBtnTap(_ sender: UIButton) {
        
        
        if isVoiceOn {
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
            defaults.set(false, forKey: "isVoiceOn")
        } else {
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
            defaults.set(true, forKey: "isVoiceOn")
        }
        
        isVoiceOn = !isVoiceOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.every(1) { (timer: Timer) in
            self.remindSeconds -= 1
            print(self.remindSeconds)
            self.timer = timer
            self.countDownLabel.text = self.remindSeconds.description
            if self.remindSeconds == 0 {
                timer.invalidate()
            }
        }
        let isVoiceOn = voiceBtnStatus(voiceBtn: voiceBtn, soundFile: "骑行结束_LH.m4a")
        self.isVoiceOn = isVoiceOn
       
//        Sound.play(file: "骑行结束_LH.m4a")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer.invalidate()
    }

    /// 保修按钮
    ///
    /// - Parameter sender: sender
    @IBAction func reportBtnTap(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
