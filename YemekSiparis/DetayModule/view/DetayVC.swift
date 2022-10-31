//
//  DetayVC.swift
//  YemekSiparis
//
//  Created by Yagizozturk on 27.10.2022.
//

import UIKit
import Kingfisher

class DetayVC: UIViewController {
    
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekIsimLabel: UILabel!
    @IBOutlet weak var miktarStepper: UIStepper!
    @IBOutlet weak var buttonSepet: UIBarButtonItem!
    @IBOutlet weak var buttonSepeteEkle: UIButton!
    
    var yemek : Yemekler?
    //var favYemek : Bool?
    var yemekDetayPresenterNesnesi : ViewToPresenterDetayProtocol?
    let kullanici_adi : String = "yagizozturk"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.createModule(ref: self)
        if let y = yemek {
            yemekIsimLabel.text = y.yemek_adi!
            yemekFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
            let urlStr = "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)"
            let url = URL(string: urlStr)
            yemekImageView.kf.setImage(with: url)
        }
        
        self.navigationItem.title = "\(yemek!.yemek_adi!) Detay"
        let gorunus = UINavigationBarAppearance()
        gorunus.backgroundColor = UIColor.lightText
        gorunus.titleTextAttributes = [.font: UIFont(name: "Caveat-Bold", size: 25),.foregroundColor: UIColor.darkGray]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = gorunus
        navigationController?.navigationBar.compactAppearance = gorunus
        navigationController?.navigationBar.scrollEdgeAppearance = gorunus
        
        yemekIsimLabel.font = UIFont(name: "Caveat-Bold", size: 23)
        yemekFiyatLabel.font = UIFont(name: "Caveat-SemiBold", size: 20)
        yemekFiyatLabel.textColor = UIColor.darkGray
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //buttonSepeteEkle.setTitle("Sepete Adet Ekle", for: .)
        buttonSepeteEkle.titleLabel?.text = "Sepete Adet Ekle"
        buttonSepeteEkle.configuration?.attributedTitle?.font = UIFont(name: "Caveat-SemiBold", size: 25)
        buttonSepeteEkle.titleLabel?.font = UIFont(name: "Caveat-SemiBold", size: 25)
        buttonSepet.image = UIImage(named: "shopping_cart-shopping_cart_symbol")
        
        yemekIsimLabel.font = UIFont(name: "Caveat-Bold", size: 23)
        yemekFiyatLabel.font = UIFont(name: "Caveat-SemiBold", size: 20)
        yemekFiyatLabel.textColor = UIColor.darkGray
        
    }
    
    @IBAction func miktarButton(_ sender: UIStepper) {
        let yemekAdet = String(Int(sender.value))
        buttonSepeteEkle.titleLabel?.text = "\(yemekAdet) Adet Ekle"
        buttonSepeteEkle.titleLabel?.font = UIFont(name: "Caveat-SemiBold", size: 25)
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        if miktarStepper.value > 0 {
            self.dismiss(animated: true)
            let stepperDeger = String(Int(miktarStepper.value))
            yemekDetayPresenterNesnesi?.sepeteEkle(kullanici_adi: self.kullanici_adi, yemek_siparis_adet: stepperDeger, yemek_resim_adi: yemek!.yemek_resim_adi!, yemek_adi: yemek!.yemek_adi!, yemek_fiyat: yemek!.yemek_fiyat!)
            
            let alertOk = UIAlertController(title: "Basarili", message: "\(Int(miktarStepper.value)) adet \(yemek!.yemek_adi!) sepete eklendi.", preferredStyle: .alert)
            let tamamActOk = UIAlertAction(title: "Tamam", style: .cancel)
            alertOk.addAction(tamamActOk)
            self.present(alertOk, animated: true)
            
        }else if miktarStepper.value == 0 {
            let alert = UIAlertController(title: "Uyari", message: "Lutfen sepete eklemek istediginiz miktari seciniz!", preferredStyle: .alert)
            let tamamAct = UIAlertAction(title: "Tamam", style: .cancel)
            alert.addAction(tamamAct)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func buttonSepet(_ sender: Any) {
        performSegue(withIdentifier: "toSepet", sender: nil)
    }
}
extension DetayVC : PresenterToViewDetayProtocol {

}
