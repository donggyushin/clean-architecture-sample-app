//
//  PostBoardUsecase.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import Foundation

final class PostBoardUsecase {
    
    let repository: BoardRepository
    
    init(repository: BoardRepository) {
        self.repository = repository
    }
    
    func implement(data: BoardDomain) {
        repository.post(data: data)
    }
}
