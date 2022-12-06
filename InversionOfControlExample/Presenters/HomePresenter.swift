//
//  HomePresenter.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation


class RandomWordHomePresenter: HomePresenterProtocol {
    
    weak var homeView: HomeViewProtocol?
    
    private let words = ["Hello", "hola", "hi"]

    func userDidPressActionButton() {
        let index = Int.random(in: 0...2)
        homeView?.displayNewWord(words[index])
    }
    
    func setViewDelegate(view: HomeViewProtocol) {
        self.homeView = view
    }
}

protocol HomePresenterProtocol {
    func setViewDelegate(view: HomeViewProtocol)
    func userDidPressActionButton()
}

protocol HomeViewProtocol: AnyObject {
    func displayNewWord(_ word: String)
}
