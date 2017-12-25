//
//  CustomTableViewCell.swift
//  NexflixView
//
//  Created by Richard Crichlow on 12/24/17.
//  Copyright © 2017 Richard Crichlow. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // data
    var images  = [[#imageLiteral(resourceName: "4-up on 11-17-17 at 9.43 PM (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 8.46 PM #5 (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 9.44 PM #5 (compiled)")], [#imageLiteral(resourceName: "4-up on 11-17-17 at 9.43 PM (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 9.45 PM (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 9.44 PM (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 8.47 PM (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 9.44 PM (compiled)")], [#imageLiteral(resourceName: "4-up on 11-17-17 at 8.46 PM #5 (compiled)"), #imageLiteral(resourceName: "4-up on 11-17-17 at 9.43 PM (compiled)")]]
    
    let cellSpacing:CGFloat = 10.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //As far as I can tell, this function sets up the datasource, delegate, and sets the tag of the collectionview to be equal to the indexpath of the tablecell.
    //You set it to the tag so that you can use it on a global scope. If not that value would only exist inside of this function.
    func configureCollectionView(forCell cell: CustomTableViewCell, forIndexPath indexPath: IndexPath) {
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        // tag the collectionView here to so you can access the correct data set in UICollectionViewDataSource
        cell.collectionView.tag = indexPath.row
        
        
        //This is a good place to setup your headers for your tableCells. For example, Categories of BestSellers is an Array that you can iterate through using indexPath.row to populate this Label.
        cell.headerTitle.text = "This is Row \(indexPath.row)"
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // here we use the tag to access the correct index of our data
        // e.g tag = 0, 1, 2, ...or the relavant index in the array
        return images[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellID", for: indexPath) as! CustomCollectionViewCell
        
        // here we use the tag to access the correct index in the matrix of our data
        // e.g tag = 0, 1, 2, ...or the relavant index in the array
        
        let image = images[collectionView.tag][indexPath.row]
    
        //Remember that a matrix is an array of arrays.
        //Look at this below
        //exampleArr[x][y]
        //In this example the matrix is exampleArr. The 'x' represents the index you want to access on the first level of the array - a.k.a which array you want to look at. The 'y' represents the index you want to access in the 'x' array - a.k.a the spot you want to look at inside the array you wanted to look at.
        
        cell.imageView.image = image
        
        //In this example we've made an array of images - which is why an imageView is used. But this can be any data we want - for example Game of Thrones episodes. You'd set up the cell the same way we did before for GOT.
        
        return cell
    }
    
}

//Literally the same collectionView Flow Layout we used before. If it ain't broke don't fix it.
extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 2.0 // cells visible in row
        let numSpaces: CGFloat = numCells + 1
        let screenWidth = UIScreen.main.bounds.width // screen width of device
        
        // retrun item size
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.bounds.height - (cellSpacing * 2))
    }
    
    // padding around our collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: 0, bottom: cellSpacing, right: 0)
    }
    
    // padding between cells / items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

