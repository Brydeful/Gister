//
//  GistListAssembly.swift
//  Gister
//
//  Created by Вячеслав Грудкин on 16.03.2023.
//

import UIKit

class GistListAssembly {

    static func assembly() -> UIViewController {
        let interactor = GistListInteractor(gistsFetchService: GistsFetchServiceImplementation())
        let router = GistListRouter()
        let view = GistListViewController()
        let presenter = GistListPresenter(interactor: interactor,
                                          router: router,
                                          view: view)
        interactor.output = presenter
        view.output = presenter
        return view
    }

}
