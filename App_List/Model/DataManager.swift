//
//  DataManager.swift
//  App_List
//
//  Created by Lucas da Silva Reis on 21/10/23.
//

import Foundation
import Alamofire
import Combine

class DataManager {
    func fetchDatas() -> AnyPublisher<[Listtype], Error>{
        return AF.request("https://api.github.com/users/hadley/orgs").publishData()
            .tryMap { response in
                try JSONDecoder().decode([Listtype].self, from: response.data ?? Data())
        }
            .eraseToAnyPublisher()
        
    }
}
