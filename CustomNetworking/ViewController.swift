//
//  ViewController.swift
//  CustomNetworking
//
//  Created by Alexey Kiselev on 01.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ArticlesWorker().fetchNews(page: 0){ result in
            print(result)
        }
    }


}

