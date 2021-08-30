import Foundation

let progresses = [92, 90]
let speeds = [4, 4]

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var max = 0
    var count = 0
    var results: [Int] = []
    
    for i in 0..<progresses.count {
        let left = Int(ceil(Double((100 - Double(progresses[i])) / Double(speeds[i]))))
        
        if left > max {
            max = left
            if i != 0 { results.append(count) }
            count = 1
        } else {
            count += 1
        }
        if i == progresses.count - 1 { results.append(count) }
    }
    
    return results
}

solution(progresses, speeds)

