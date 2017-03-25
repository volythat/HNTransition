//
//  ViewController2.swift
//  HNTransition
//
//  Created by oneweek on 3/24/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectButton(_ sender: Any) {
        show()
    }

    func show() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let view2 = story.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        view2.view.backgroundColor = UIColor.red
        navigationController?.pushViewController(view2, animated: true)
    }
}
