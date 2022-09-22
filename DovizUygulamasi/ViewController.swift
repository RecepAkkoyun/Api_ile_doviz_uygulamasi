//
//  ViewController.swift
//  DovizUygulamasi
//
//  Created by Recep Akkoyun on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblUSD: UILabel!
    @IBOutlet weak var lblTRY: UILabel!
    @IBOutlet weak var lblGBP: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCevir(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("error")
            }else{
                
                if data != nil{
                    do{
                   let jsonRequest = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions
                    .mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonRequest["rates"] as? [String : Any] {
                                if let usd = rates["USD"] as? Double {
                                    self.lblUSD.text = "USD : \(usd)"
                                }
                                if let tl = rates["TRY"] as? Double {
                                    self.lblTRY.text = "TRY : \(tl)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.lblGBP.text = "GBP : \(gbp)"
                                }
                            }
                        }
                        
                    }catch{
                        print("hata")
                    }
            }
        }
       
        
        
        
    }
        task.resume()
}

}
