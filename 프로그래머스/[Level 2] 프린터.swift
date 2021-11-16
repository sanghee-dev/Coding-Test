import Foundation

let priorities = [1, 1, 9, 1, 1, 1]
let location = 0

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var sortedPrioirties = priorities.sorted(by: <)
    var queue: [[Int]] = []
    var count: Int = 0

    for (i, v) in priorities.enumerated() {
        queue.append([i, v])
    }

    while true {
        let print = queue.removeFirst()
        if print[1] == sortedPrioirties[sortedPrioirties.count - 1] {
            count += 1
            sortedPrioirties.removeLast()
            if print[0] == location { break }
        } else {
            queue.append(print)
        }
    }
    
    return count
}

let answer = solution(priorities, location)
print(answer)
