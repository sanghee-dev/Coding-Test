import Foundation

let d = [2, 2, 3, 3]
let budget = 10

//func solution(_ d:[Int], _ budget:Int) -> Int {
//    var sum = 0
//
//    for (index, value) in d.sorted().enumerated() {
//        sum += value
//        if sum > budget { return index }
//    }
//
//    return d.count
//}

func solution(_ d: [Int], _ budget: Int) -> Int {
    var budget = budget
    
    return d.sorted().filter {
        budget -= $0
        return budget >= 0
    }.count
}

let answer = solution(d, budget)
print(answer)

