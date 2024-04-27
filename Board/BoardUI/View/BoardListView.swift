//
//  BoardListView.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import SwiftUI

struct BoardListView: View {
    
    @StateObject var viewModel: BoardListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                
                Button {
                    viewModel.postBoard(board: .init(id: UUID().uuidString,
                                                     title: UUID().uuidString,
                                                     description: UUID().uuidString))
                } label: {
                    Text("새로운 보드 생성")
                }
                
                ForEach(viewModel.boards, id: \.self) { board in
                    BoardViewListItem(board: board)
                        .padding()
                        .onTapGesture {
                            viewModel.deleteBoard(board: board)
                        }
                }
            }
        }
    }
}

#Preview {
    let boardRepository = BoardRepositoryImpl.shared
    
    let viewModel: BoardListViewModel = .init(getUsecase: .init(boardRepository: boardRepository),
                                              postUsecase: .init(repository: boardRepository),
                                              deleteUsecase: .init(repository: boardRepository))
    
    return BoardListView(viewModel: viewModel)
        .preferredColorScheme(.dark)
}
