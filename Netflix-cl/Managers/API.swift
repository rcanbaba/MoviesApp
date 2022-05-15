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
}

struct Endpoints {
    static let trendingMovies = "/3/trending/movie/day?api_key="
    static let trendingTvs = "/3/trending/tv/day?api_key="
    static let upcomingMovies = "/3/movie/upcoming?api_key="
    static let popularMovies = "/3/movie/popular?api_key="
    static let topRatedMovies = "/3/movie/top_rated?api_key="
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
    
}
