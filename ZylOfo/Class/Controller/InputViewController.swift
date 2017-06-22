//
//  InputViewController.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/21.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//

import UIKit
import APNumberPad
import SwiftySound

class InputViewController: UIViewController,APNumberPadDelegate,UITextFieldDelegate {
    
    var isFlashOn = false
    var isVoiceOn = true
    let defaults = UserDefaults.standard

    @IBOutlet weak var flashBtn: UIButton!
    
    @IBOutlet weak var voiceBtn: UIButton!
    @IBOutlet weak var inPutTextFlied: UITextField!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func flashButton(_ sender: UIButton) {
        turnTruch()
        isFlashOn = !isFlashOn
        if isFlashOn {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: .normal)
        } else {
            flashBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: .normal)
        }
    }
    
    
    @IBAction func voiceButton(_ sender: UIButton) {
        isVoiceOn = !isVoiceOn
        
        if isVoiceOn { //false
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
            
             defaults.set(true, forKey: "isVoiceOn")
        } else { //true
            voiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
            
            defaults.set(false, forKey: "isVoiceOn")
        }
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.title = "车辆解锁"
        //247 215 88
        inPutTextFlied.layer.borderWidth = 2
        inPutTextFlied.layer.borderColor = UIColor.ofo.cgColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "扫码用车", style: .plain, target: self, action: #selector(backToScan))
        
        let numberPad = APNumberPad(delegate: self)
        numberPad.leftFunctionButton.setTitle("确认", for: .normal)
        numberPad.leftFunctionButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        inPutTextFlied.inputView = numberPad
        inPutTextFlied.delegate = self
        
        goButton.isUserInteractionEnabled = false
        
        let isVoiceOn = voiceBtnStatus(voiceBtn: voiceBtn, soundFile: "上车前_LH.m4a")
        self.isVoiceOn = isVoiceOn
        //Sound.play(file: "上车前_LH.m4a")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isVoiceOn = voiceBtnStatus(voiceBtn: voiceBtn, soundFile: "")
        self.isVoiceOn = isVoiceOn
    }
    func backToScan() {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - APNumberPad Delegate
    func numberPad(_ numberPad: APNumberPad, functionButtonAction functionButton: UIButton, textInput: UIResponder) {
        print("点击了")
        if !inPutTextFlied.text!.isEmpty {
            performSegue(withIdentifier: "showPassSode", sender: self)
        }
    }
   
    // MARK: -  TextFliedDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {
            return true
        }
        
        let newLength = text.characters.count + string.characters.count - range.length
        if newLength > 0 {
            goButton.setImage(#imageLiteral(resourceName: "nextArrow_enable"), for: .normal)
            goButton.backgroundColor = UIColor.ofo
            goButton.isUserInteractionEnabled = true
            
        } else {
            goButton.setImage(#imageLiteral(resourceName: "nextArrow_unenable"), for: .normal)
            goButton.backgroundColor = UIColor.groupTableViewBackground
            goButton.isUserInteractionEnabled = false
            
        }
        return newLength <= 8
        
        
        
    }
    
    
    

}
