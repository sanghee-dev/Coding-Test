import Foundation

let begin = "hit"
let target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if words.firstIndex(of: target) == nil { return 0 }
    var result = 0
    
    func bfs(currentWord: String, count: Int, visited: [Bool]) {
        if result > 0 && count >= result { return }
        
        for (index, word) in words.enumerated() {
            if isSimilar(currentWord, word) && !visited[index] {
                if word == target {
                    if result == 0 || count < result {
                        result = count + 1
                        break
                    }
                }
                var newVisited = visited
                newVisited[index] = true
                bfs(currentWord: word, count: count + 1, visited: newVisited)
            }
        }
    }
    
    bfs(currentWord: begin, count: 0, visited: Array(repeating: false, count: words.count))
    return result
}

func isSimilar(_ strA: String, _ strB: String) -> Bool {
    let strAArr = strA.map({ $0 })
    let strBArr = strB.map({ $0 })
    var result = 0
    for (index, char) in strAArr.enumerated() {
        if char != strBArr[index] { result += 1 }
    }
    return result == 1
}

solution(begin, target, words)
