//
//  BoardRepository.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import Foundation
import Combine

protocol BoardRepository {
    var boards: [BoardDomain] { get }
    var boardsPublisher: AnyPublisher<[BoardDomain], Never> { get }
    
    func post(data: BoardDomain)
    func delete(data: BoardDomain)
}
