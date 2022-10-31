//
//  YemeklerCevap.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import Foundation

class YemeklerCevap : Codable {
    
    var yemekler : [Yemekler]?
    var success : Int?
    
    init(yemekler: [Yemekler], success: Int) {
        self.yemekler = yemekler
        self.success = success
    }
}
