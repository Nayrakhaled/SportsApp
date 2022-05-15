//
//  ComingEventsPresenter.swift
//  SportsApp
//
//  Created by Aya Abdelraouf on 5/14/22.
//  Copyright © 2022 NayraKhaled. All rights reserved.
//

import Foundation



protocol ComingTableViewCell: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol ComingoCellCollectionView {
    //func configTableCell (todo :[Todo]!)
    func labelname (name :Int)
}


class ComingVCPresenter {
    
    private weak var view: ComingTableViewCell?
    private let interactor = TodosInteractor(baseUrl: "https://jsonplaceholder.typicode.com/")
    private var todos = [Todo]()
    
    init(view: ComingTableViewCell) {
        self.view = view
    }
    
    func viewDidLoad() {
        getTodos()
    }
    
    func getTodos(){
        view?.showIndicator()
        interactor.getTodos(endPoint: "todos", completionHandler: { [weak self] todos, error in
            
            print("Completion handler ")
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            
            if let error = error {
                self.view?.showError()
            } else {
                guard let todos = todos else { return }
                self.todos = todos
                print("Completion handler success \(todos.count)")
                self.view?.fetchingDataSuccess()
            }
        })
    }
    
    func getTodosCount() -> Int {
        return todos.count
    }
    
    func configure(cell : ComingoCellCollectionView , index : Int) {
        let todo = todos[index]
        cell.labelname(name: todo.id)
       
    }
    
}
