import Foundation

let left = 13
let right = 17

func solution(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    
    for n in left...right {
        if floor(sqrt(Double(n))) == sqrt(Double(n)) {
            answer -= n
        } else {
            answer += n
        }
    }
    
    return answer
}

solution(left, right)
