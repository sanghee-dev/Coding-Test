import Foundation

let citations = [3, 0, 6, 1, 5]

func solution(_ citations:[Int]) -> Int {
    let n = citations.count
    
    for h in (0...n).reversed() {
        if citations.filter({ $0 >= h }).count >= h {
            return h
        }
    }
    
    return 0
}

solution(citations)

