import Foundation

let n = 6
let edge = [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var connections: [Int: [Int]] = [:]
    
    func getConnections(_ key: Int, _ value: Int) {
        if connections[key] != nil {
            connections[key]?.append(value)
        } else {
            connections[key] = [value]
        }
    }
    
    for e in edge {
        getConnections(e[0], e[1])
        getConnections(e[1], e[0])
    }
    
    print(connections)

    var visited: [Bool] = Array(repeating: false, count: n+1)
    var queue: [(Int, Int)] = [] // (node, depth)
    var db: [Int: [Int]] = [:]
    
    func bfs(_ from: Int, _ depth: Int) {
        guard connections[from] != nil else { return }
        
        for node in connections[from]! {
            guard !visited[node] else { continue }
            
            visited[node] = true
            queue.append((node, depth))
            
            if db[depth] != nil {
                db[depth]?.append(node)
            } else {
                db[depth] = [node]
            }
        }
    }
    
    // 먼저 1을 방문함
    queue.append((1, 0))
    visited[0] = true
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        bfs(node.0, node.1 + 1)
    }
    
    let maxDepth = db.keys.max() ?? 1

    return db[maxDepth]?.count ?? 1
}

let answer = solution(n, edge)
print(answer)

