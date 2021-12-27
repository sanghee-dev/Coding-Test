import Foundation

let board = [[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]

func solution(_ board: [[Int]]) -> Int {
    var arrays = board
    var max = 0

    if board.count == 1 {
        return board[0].contains(1) ? 1 : 0
    }

    if  board[0].count == 1 {
        return board.flatMap {$0}.contains(1) ? 1 : 0
    }

    for row in 1..<board.count {
        for column in 1..<board[0].count {
            if arrays[row][column] == 1 {
                let min = [arrays[row-1][column-1], arrays[row-1][column], arrays[row][column-1]].min()
                arrays[row][column] += min ?? 0
                max = (max > arrays[row][column]) ? max : arrays[row][column]
            }
        }
    }

    return max * max
}

let answer = solution(board)
print(answer)

