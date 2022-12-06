//
//  DisneyWordPresenter.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation

class DisneyWordPresenter: HomePresenterProtocol {
   
    weak var homeView: HomeViewProtocol?
    
    let disneyWords: [String] = ["Aladdin", "Beauty and the Beast", "Ariel"]
    
    func setViewDelegate(view: HomeViewProtocol) {
        self.homeView = view
    }
    
    func userDidPressActionButton() {
        var word = disneyWords[0]
        homeView?.displayNewWord(word)
    }
    
    
}
