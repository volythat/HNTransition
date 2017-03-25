//
//  ViewController.swift
//  HNTransition
//
//  Created by oneweek on 3/23/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var clView : UICollectionView!
    
//    let animator = HNTransition()
//    let interactive = HNInteractive()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        navigationController?.delegate = self
//        self.automaticallyAdjustsScrollViewInsets = false
    }

    func show() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let view2 = story.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(view2, animated: true)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.backgroundColor = UIColor.cyan
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        show()
    }

}
