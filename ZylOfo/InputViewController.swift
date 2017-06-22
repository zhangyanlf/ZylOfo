//
//  InputViewController.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/21.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    var isFlashOn = false
    var isVoiceOn = true
    

    @IBOutlet weak var flashBtn: UIButton!
    
    @IBOutlet weak var voiceBtn: UIButton!
    @IBOutlet weak var inPutTextFlied: UITextField!
    
    @IBAction func flashButton(_ sender: UIButton) {
        isFlashOn = !isFlashOn
        if isFlashOn {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: .normal)
        } else {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: .normal)
        }
    }
    
    
    @IBAction func voiceButton(_ sender: UIButton) {
        isVoiceOn = !isVoiceOn
        if isVoiceOn {
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
        } else {
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
        }
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        //247 215 88
        inPutTextFlied.layer.borderWidth = 2
        inPutTextFlied.layer.borderColor = UIColor.ofo.cgColor
        
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
