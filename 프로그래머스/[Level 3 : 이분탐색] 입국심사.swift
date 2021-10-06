import Foundation

let n = 6
let times = [7, 10]

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var left: Int = 1
    var right: Int = times.max()! * n
    var result = 0
    
    while left <= right {
        let mid = (left + right) / 2
        let sum = times.map({ mid / $0 }).reduce(0, +)
        
        if sum >= n {
            right = mid - 1
            result = mid
        } else {
            left = mid + 1
        }
    }
    
    return Int64(result)
}

solution(n, times)
