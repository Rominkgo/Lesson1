//
//  StarWarsVilliansRepository.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation


//class StarWarsVilliansRepository: StarWarsRepositoryProtocol {
//
//    private let villians = ["Darth Vader", "Darth Maul", "Emporer"]
//
//    func fetchCharacterNames() -> [String] {
//        return villians
//    }
//
//
//}


class StarWarsVilliansRepository: StarWarsRepositoryProtocol {
    
    private let villians = ["Darth Vader", "Darth Maul", "Emporer"]
    
    func fetchCharacterNames(onSuccess: @escaping ([String]) -> Void) {
        DispatchQueue.main.async { [weak self] in
            onSuccess(self?.villians ?? [])
        }
    }
    
    
}
