//
//  BoardViewListItem.swift
//  Board
//
//  Created by 신동규 on 4/27/24.
//

import SwiftUI

struct BoardViewListItem: View {
    
    var board: BoardV
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(board.title).fontWeight(.black)
                if let description = board.description {
                    Text(description)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    BoardViewListItem(board: .init(id: "1", title: "title", description: "description"))
}
