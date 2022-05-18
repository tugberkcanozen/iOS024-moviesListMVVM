//
//  NetworkConstants.swift
//  programmaticlyMovieAppMvvm
//
//  Created by Tuğberk Can Özen on 18.05.2022.
//

import Foundation

extension Constant {
    class NetworkConstant{
        enum SearchMovieServiceEndPoint: String {
            case BASE_URL = "http://www.omdbapi.com"
            case API_KEY = "apikey=be45f307"
            
            static func searchMovie(searchMovieName: String) -> String {
                "\(BASE_URL.rawValue)?s=\(searchMovieName)&\(API_KEY.rawValue)"
            }
            
            static func detailMovie(movieImdbId: String) -> String {
                "\(BASE_URL.rawValue)?i=\(movieImdbId)&\(API_KEY.rawValue)"
            }
        }
    }
}

//http://www.omdbapi.com/?s=searchMovieName&apikey=be45f307
//http://www.omdbapi.com/?i=movieImdbId=&apikey=be45f307
