//
//  ViewController.swift
//  EffectivePageScroll
//
//  Created by Mohit Shrama on 15/09/19.
//  Copyright © 2019 vaibhav sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //Cell Reuse-ID
    let reuseId = "CollectionViewCell"
    let cellSpacing: CGFloat = 10
    let contentArray = [["image":"pizza", "content": "Pizza."],["image" : "burger", "content": "Burger."],["image" : "beautiful", "content": "Songs."],["image" : "nature", "content": "Nature."],["image" : "night", "content": "NightClub."],["image" : "travel", "content": "Travling."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //DataSource and Delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        //Register Cell Nib
        collectionView.register(UINib(nibName: reuseId, bundle: nil), forCellWithReuseIdentifier: reuseId)
        
        let screenSize = collectionView.bounds.size
        let cellWidth = floor(screenSize.width - cellSpacing) * 0.50
        let cellHeight = floor(screenSize.height - cellSpacing) * 0.55
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            collectionView.contentInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
        }
    }
    
    @IBAction func skip(_ sender: Any) {
        self.performSegue(withIdentifier: "SelectedViewController", sender: "Nothing.")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SelectedViewController {
            controller.selectedCategory = sender as? String
        }
    }
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let content = contentArray[indexPath.row]
        cell.updateData(title: content["content"] ?? "", image: content["image"] ?? "")
        return cell
    }
}
extension ViewController : UIScrollViewDelegate, UICollectionViewDelegateFlowLayout{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWithSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offSet = targetContentOffset.pointee
        let index = (offSet.x + scrollView.contentInset.left)/cellWithSpacing
        let roundedIndex = round(index)
        offSet = CGPoint(x: roundedIndex * cellWithSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offSet
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let content = contentArray[indexPath.row]
        self.performSegue(withIdentifier: "SelectedViewController", sender: content["content"])
    }
}
