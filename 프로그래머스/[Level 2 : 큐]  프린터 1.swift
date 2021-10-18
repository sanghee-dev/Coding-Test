import Foundation

let priorities = [2, 1, 3, 2]
let location = 2

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [(Int, Int)] = []
    var count: Int = 1
    
    for (index, priority) in priorities.enumerated() {
        queue.append((index, priority))
    }
    
    while true {
        guard let maxNum = queue.map({ $0.1 }).max() else { break }
        
        if queue[0].1 == maxNum {
            if queue[0].0 == location { break }
            queue.removeFirst()
            count += 1
        } else {
            queue.append(queue.removeFirst())
        }
    }
    
    return count
}

solution(priorities, location)
