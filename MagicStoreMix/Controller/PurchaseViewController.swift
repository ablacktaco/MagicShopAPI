//
//  PurchaseViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    private let screenBounds: CGRect = UIScreen.main.bounds
    var vc: MagicShopViewController?
    var levelMode: ShopViewState.levelMode?
    var shopMode: ShopViewState.shopMode?
    var index: Int?
    
    @IBOutlet var purchaseView: PurchaseView! {
        didSet {
            setViewBorder(view: purchaseView, configSetting: .viewBorder)
        }
    }
    @IBOutlet var tauntingView: TauntingView! {
        didSet {
            setViewBorder(view: tauntingView, configSetting: .viewBorder)
            tauntingView.center = CGPoint(x: screenBounds.width / 2, y: screenBounds.height / 2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tauntingView.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
