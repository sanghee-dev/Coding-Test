import Foundation

let n = 3
let computers = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var result: Int = 0
    
    func visit(_ index: Int) {
        visited[index] = true
        for i in 0..<n {
            if computers[i][index] == 1 && !visited[i] {
                visit(i)
            }
        }
    }
    
    for index in 0..<n {
        if !visited[index] {
            result += 1
            visit(index)
        }
    }
    
    return result
}

let answer = solution(n, computers)
print(answer)
