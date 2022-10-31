//
//  SepetTableViewCell.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 28.10.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetImageView: UIImageView!
    @IBOutlet weak var yemekIsimLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekMiktarLabel: UILabel!
    @IBOutlet weak var yemekToplamLabel: UILabel!
    @IBOutlet weak var miktarStepper: UIStepper!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var adetL: UILabel!
    @IBOutlet weak var urunFLir: UILabel!
    @IBOutlet weak var toplamLir: UILabel!
    
    
    var sepetYemek: SepetYemekler?
    var sepetToplam: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let fontReg = "Caveat-Regular"
        yemekIsimLabel.font = UIFont(name: "Caveat-SemiBold", size: 20)
        yemekFiyatLabel.font = UIFont(name: fontReg, size: 15)
        yemekMiktarLabel.font = UIFont(name: fontReg, size: 15)
        adetL.font = UIFont(name: fontReg, size: 15)
        yemekToplamLabel.font = UIFont(name: fontReg, size: 17)
        urunFLir.font = UIFont(name: fontReg, size: 15)
        toplamLir.font = UIFont(name: fontReg, size: 17)
        cellView.backgroundColor = UIColor.systemGray6
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    @IBAction func miktarStepper(_ sender: UIButton) {
        yemekMiktarLabel.text = String(Int(miktarStepper.value))
        
                var miktar = Int(yemekMiktarLabel.text!)!
                var toplamSepet = Int(sepetToplam)
                let price = Int(yemekFiyatLabel.text!)!
                
                switch sender.tag {
                case 1:
                    if miktar > 1{
                        miktar -= 1
                        toplamSepet -= price
                    }
                    else {
                        return
                    }
                    
                case 2:
                   
                    if miktar < 10{
                        miktar += 1
                        toplamSepet += price
                    }
                    else {
                        return
                    }
                  
                default:
                    break
                }
                
                yemekMiktarLabel.text = String(miktar)
                let yemekAdet = Int(yemekMiktarLabel.text!)!
                let cost = price * yemekAdet
                yemekToplamLabel.text = String(cost)
                sepetToplam = Int(toplamSepet)
    }
}
