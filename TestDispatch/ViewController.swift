//
//  ViewController.swift
//  TestDispatch
//
//  Created by Akekapon Suebprom on 9/18/2560 BE.
//  Copyright © 2560 kratostracking. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var imageLoad : [String] = ["https://newevolutiondesigns.com/images/freebies/space-wallpaper-1.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-2.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-3.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-4.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-5.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-6.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-7.jpg",
                                    "https://newevolutiondesigns.com/images/freebies/space-wallpaper-8.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageLoad.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        //cell.imgWallpaper.image = #imageLiteral(resourceName: "loadingdots")
        
        DispatchQueue.global().async {
            let url = URL(string:self.imageLoad[indexPath.row])
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.imgWallpaper.image = UIImage(data: data!)
            }
        }
        
        
        
        
        
        return cell
    }


}

