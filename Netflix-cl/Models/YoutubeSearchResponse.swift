//
//  YoutubeSearchResponse.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 16.05.2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoItem]
    
}

struct VideoItem: Codable {
    let id: VideoIdItem
}

struct VideoIdItem: Codable {
    let kind: String
    let videoId: String
}

//etag = "nn_Ih6r95JKAesBbHpycaDYycYQ";
//id =             {
//    kind = "youtube#video";
//    videoId = H5v3kku4y6Q;
//};
//kind = "youtube#searchResult";
