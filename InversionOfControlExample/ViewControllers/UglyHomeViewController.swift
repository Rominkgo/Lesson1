//
//  UglyHomeViewController.swift
//  InversionOfControlExample
//
//  Created by Default on 12/6/22.
//

import Foundation
import UIKit

class UglyViewController: UIViewController {
    
    private let topLabel: UILabel = UILabel(frame: .zero)
    private let nextButton: UIButton = UIButton(type: .contactAdd)
    
    private var presenter: HomePresenterProtocol!
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTopLabel()
        setupNextButton()
        presenter.setViewDelegate(view: self)
        // Do any additional setup after loading the view.
    }
    
    
    private func setupTopLabel() {
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.font = .preferredFont(forTextStyle: .largeTitle)
        topLabel.backgroundColor = .cyan
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Size.small),
            topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        topLabel.text = "Hola Amigo!"
    }
    
    private func setupNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            nextButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        nextButton.setTitle("Give me a new word!!", for: .normal)
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
    }
    
    @objc
    private func didPressNextButton() {
        presenter.userDidPressActionButton()
    }
}

extension UglyViewController: HomeViewProtocol {
   
    func displayNewWord(_ word: String) {
        topLabel.text = "sdafjhsdf \(word) asdfafewak"
    }
    
    
}
