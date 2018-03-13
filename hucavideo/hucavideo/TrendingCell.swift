//
//  TrendingCell.swift
//  hucavideo
//
//  Created by HungNV on 2/27/18.
//  Copyright © 2018 HungNV. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideo() {
        APIService.sharedInstance.fetchTrendingFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
