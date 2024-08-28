//
//  RegisterVC.swift
//  SpeedoTransfer
//
//  Created by Abd Elrahman Atallah on 27/08/2024.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
            print("========================")
        }
    }
}
