import Foundation

let priorities = [2, 1, 3, 2]
let location = 2

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue: [(Int, Int)] = []
    var priorityQueue = priorities.sorted(by: >)
    var result = 0
    
    for (index, value) in priorities.enumerated() {
        queue.append((index, value))
    }
    
    while !queue.isEmpty {
        if queue.first!.1 == priorityQueue.first {
            result += 1
            if queue.first!.0 == location {
                return result
            }
            queue.removeFirst()
            priorityQueue.removeFirst()
        } else {
            queue.append(queue.removeFirst())
        }
    }
    
    return result
}

solution(priorities, location)
