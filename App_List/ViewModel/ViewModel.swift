//
//  ViewModel.swift
//  App_List
//
//  Created by Lucas da Silva Reis on 21/10/23.
//

import Foundation
import Alamofire
import Combine

class ViewModel: ObservableObject {
 
    
    @Published var datas = [Listtype]()
    
    private let dataManager: DataManager
    private var cancellables = Set<AnyCancellable>()
    
    init(dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.fetchDatas()
            .replaceError(with: [])
            .assign(to: &$datas)
    }
    
}
