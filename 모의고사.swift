import Foundation

let answers = [1, 2, 3, 4, 5]

func solution(_ answers:[Int]) -> [Int] {
    let p1 = [1, 2, 3, 4, 5]
    let p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
 
    var counts = [1: 0, 2: 0, 3: 0]

    for i in 0..<answers.count {
        if answers[i] == p1[i % 5] { counts[1]! += 1 }
        if answers[i] == p2[i % 8] { counts[2]! += 1 }
        if answers[i] == p3[i % 10] { counts[3]! += 1 }
    }
            
    return counts.filter { $0.value == counts.values.max() }.keys.sorted()
}

solution(answers)
