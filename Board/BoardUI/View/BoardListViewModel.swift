//
//  BoardListViewModel.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import Combine
import Foundation

final class BoardListViewModel: ObservableObject {
    
    @Published var boards: [BoardV] = []
    
    let getUsecase: GetBoardUsecase
    let postUsecase: PostBoardUsecase
    let deleteUsecase: DeleteBoardUsecase
    
    private var cancellables = Set<AnyCancellable>()
    
    init(getUsecase: GetBoardUsecase, 
         postUsecase: PostBoardUsecase,
         deleteUsecase: DeleteBoardUsecase) {
        self.getUsecase = getUsecase
        self.postUsecase = postUsecase
        self.deleteUsecase = deleteUsecase
        
        bind()
    }
    
    func postBoard(board: BoardV) {
        postUsecase.implement(data: .init(id: board.id, title: board.title, description: board.description))
    }
    
    func deleteBoard(board: BoardV) {
        deleteUsecase.implement(data: .init(id: board.id, title: board.title, description: board.description))
    }
    
    private func bind() {
        getUsecase.implement()
            .sink { [weak self] boards in
                self?.boards = boards.map({ .init(id: $0.id, title: $0.title, description: $0.description) })
            }
            .store(in: &cancellables)
    }
    
}
