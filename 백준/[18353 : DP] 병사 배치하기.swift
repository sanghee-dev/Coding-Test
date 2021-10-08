import Foundation

let input1 = readLine()
let input2 = readLine()

var N: Int = 0 // 7
var soldiers: [Int] = [] // [15, 11, 4, 8, 5, 2, 4]

if let input1 = input1, let input2 = input2 {
    N = Int(input1.components(separatedBy: " ")[0])!
    soldiers = input2.components(separatedBy: " ").map({ Int($0) ?? 0 })
}

func solution(_ N: Int, _ soldiers: [Int]) -> Int {
    var answer = Array(repeating: 1, count: N)
    
    for i in 0..<N {
        for j in 0..<i {
            if soldiers[i] < soldiers[j] && answer[i] < answer[j] + 1 {
                answer[i] += 1
            }
        }
    }

    return N - answer.max()!
}

let answer = solution(N, soldiers)
print(answer)
