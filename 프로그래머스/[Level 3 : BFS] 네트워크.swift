import Foundation

let n = 3
let computers = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    
    func bfs(_ index: Int) {
        visited[index] = true
        for i in 0..<n {
            if computers[i][index] == 1 && !visited[i] {
                visited[i] = true
                bfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            print(i)
            result += 1
            bfs(i)
        }
    }
    
    return result
}

solution(n, computers)

