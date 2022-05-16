//
//  API.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 14.05.2022.
//

import Foundation

struct APIConstants {
    static let API_KEY = "f73bb57f5d978cd566999c467673d266"
    static let baseURL = "https://api.themoviedb.org"
    static let imageUrlPrefix = "https://image.tmdb.org/t/p/w500/"
    static let youtubeAPI_KEY = "AIzaSyC7LP6SIOzTVv2N48mVmObkuxWqpliHvso"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube"
}

struct Endpoints {
    static let trendingMovies = "/3/trending/movie/day?api_key="
    static let trendingTvs = "/3/trending/tv/day?api_key="
    static let upcomingMovies = "/3/movie/upcoming?api_key="
    static let popularMovies = "/3/movie/popular?api_key="
    static let topRatedMovies = "/3/movie/top_rated?api_key="
    static let discoverMovies = "/3/discover/movie?api_key="
    static let search = "/3/search/movie?api_key="
    static let youtubeSearch = "/v3/search?q="
}
// dil için gerekebilir gibi
//&language=en-US&page=1"

enum APIError: Error {
    case failedToGetData    
}

class API {
    
    static let shared = API()
        
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.trendingMovies + APIConstants.API_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.trendingTvs + APIConstants.API_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.upcomingMovies + APIConstants.API_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.popularMovies + APIConstants.API_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.topRatedMovies + APIConstants.API_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: APIConstants.baseURL + Endpoints.discoverMovies + APIConstants.API_KEY + "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: APIConstants.baseURL + Endpoints.search + APIConstants.API_KEY + "&query=" + query) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func searchOnYoutube(with query: String, completion: @escaping (Result<VideoItem, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: APIConstants.youtubeBaseURL + Endpoints.youtubeSearch + query + "&key=" + APIConstants.youtubeAPI_KEY) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, errror in
            guard let data = data, errror == nil else { return }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
