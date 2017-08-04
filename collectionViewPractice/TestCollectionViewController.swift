//
//  TestCollectionViewController.swift
//  collectionViewPractice
//
//  Created by Collin Cannavo on 8/3/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TestCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

}
