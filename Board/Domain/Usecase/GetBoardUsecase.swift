//
//  GetBoardUsecase.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import Foundation
import Combine

final class GetBoardUsecase {
    let boardRepository: BoardRepository
    
    init(boardRepository: BoardRepository) {
        self.boardRepository = boardRepository
    }
    
    func implement() -> AnyPublisher<[BoardDomain], Never> {
        boardRepository.boardsPublisher
    }
}
