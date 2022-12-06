//
//  Repositories.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation

protocol StarWarsRepositoryProtocol {
    func fetchCharacterNames(onSuccess: @escaping ([String]) -> Void)
}

class StarWarsRespository: StarWarsRepositoryProtocol {
    private let characters = ["Anakin", "Obiwan", "Padme"]
    
    func fetchCharacterNames(onSuccess: @escaping ([String]) -> Void) {
        DispatchQueue.main.async { [weak self] in
            onSuccess(self?.characters ?? [])
        }
//        return characters
    }
}
