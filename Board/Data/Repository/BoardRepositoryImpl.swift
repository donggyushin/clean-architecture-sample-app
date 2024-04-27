//
//  BoardRepositoryImpl.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import Foundation
import Combine

final class BoardRepositoryImpl: BoardRepository {
    static let shared = BoardRepositoryImpl()
    
    var boards: [BoardDomain] {
        _boards
    }
    
    var boardsPublisher: AnyPublisher<[BoardDomain], Never> {
        $_boards.eraseToAnyPublisher()
    }
    
    @Published private var _boards: [BoardDomain] = []
    
    private init() {
        _boards = fetchDataFromServer()
    }
    
    func post(data: BoardDomain) {
        _boards.append(data)
    }
    
    func delete(data: BoardDomain) {
        if let index = _boards.firstIndex(where: { $0.id == data.id }) {
            _boards.remove(at: index)
        }
    }
    
    private func fetchDataFromServer() -> [BoardDomain] {
        let fetchedRawData: [BoardData] = [
            .init(id: "1", title: "제목", description: "첫 게시글"),
            .init(id: "2", title: "안녕하세요. 첫 글 올립니다.", description: nil),
            .init(id: "3", title: "요즘 다들 카메라 어디서 사시나요", description: "잘 부탁드립니다. ")
        ]
        
        let converted: [BoardDomain] = fetchedRawData.map({ .init(id: $0.id, title: $0.title, description: $0.description) })
        
        return converted
    }
}
