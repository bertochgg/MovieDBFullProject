//
//  MVDBHelpInteractor.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 25/09/24.
//

import Foundation

final class MVDBHelpInteractor: MVDBHelpInteractorInputProtocol {
    weak var presenter: MVDBHelpInteractorOutputProtocol?
    private let entity: MVDBHelpEntity
    
    init(entity: MVDBHelpEntity) {
        self.entity = entity
    }
    
    func getCopiesForDesign() {
        let copiesHelpDesign = (title: entity.title, description: entity.description, buttonTitle: entity.customerServiceButtonTitle)
        presenter?.didObtainedCopiesForView(with: copiesHelpDesign)
    }
    
}
