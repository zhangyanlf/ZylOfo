//
//  NetworkHelper.swift
//  ZylOfo
//
//  Created by 张彦林 on 17/6/23.
//  Copyright © 2017年 zhangyanlin. All rights reserved.
//
import AVOSCloud

struct NetworkHelper {
    
}

extension NetworkHelper {
    static func getPass(code : String, completion:@escaping (String?) -> Void){
        let query = AVQuery(className: "ZylCode")
        
        query.whereKey("code", equalTo: code)
        
        query.getFirstObjectInBackground { (code, e) in
            if let e = e{
                print("出错",e.localizedDescription)
                completion(nil)
            }
            
            if let code = code, let pass = code["pass"] as? String{
                completion(pass)
            }
        }
        
    }
}
