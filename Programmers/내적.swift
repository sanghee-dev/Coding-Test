import Foundation

let a = [1, 2, 3, 4]
let b = [-3, -1, 0, 2]

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    for i in 0..<a.count {
        answer += a[i] * b[i]
    }
    
    return answer
}

solution(a, b)
