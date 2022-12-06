//
//  StarwarsCharactersPresenter.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation

class StarwarsCharactersPresenter: HomePresenterProtocol {
    
    private let repository: StarWarsRepositoryProtocol
    private var characterNames = [String]()
    
    init(repository: StarWarsRepositoryProtocol) {
        self.repository = repository
    }
    
    private weak var viewDelegate: HomeViewProtocol?
    
    
    func setViewDelegate(view: HomeViewProtocol) {
        self.viewDelegate = view
    }
    
//    func userDidPressActionButton() {
//        if characterNames.isEmpty {
//           let newCharacters = repository.fetchCharacterNames()
//            characterNames.append(contentsOf: newCharacters)
//        }
//        let index = Int.random(in: 0..<characterNames.count)
//        let characterName = characterNames[index]
//        viewDelegate?.displayNewWord(characterName)
//    }
    
    func userDidPressActionButton() {
        if characterNames.isEmpty {
            repository.fetchCharacterNames() { [weak self] newCharacters in
                self?.characterNames.append(contentsOf: newCharacters)
                self?.displayCharacters()
            }
        } else {
            displayCharacters()
        }
    }
    
    private func displayCharacters() {
        let index = Int.random(in: 0..<characterNames.count)
        let characterName = characterNames[index]
        viewDelegate?.displayNewWord(characterName)
    }
    
}
