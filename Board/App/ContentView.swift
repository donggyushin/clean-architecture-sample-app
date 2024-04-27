//
//  ContentView.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import SwiftUI

struct ContentView: View {
    
    let boardRepository = BoardRepositoryImpl.shared
    
    var body: some View {
        BoardListView(viewModel: .init(getUsecase: .init(boardRepository: boardRepository),
                                       postUsecase: .init(repository: boardRepository),
                                       deleteUsecase: .init(repository: boardRepository)))
    }
}

#Preview {
    ContentView()
}
