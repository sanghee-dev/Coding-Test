import Foundation

let n = 5
let lost = [2, 4]
let reserve = [3, 1]


func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = Array(repeating: 0, count: n)
    
    for i in lost { students[i - 1] -= 1 }
    for j in reserve { students[j - 1] += 1 }
    
    for (i, v) in students.enumerated() {
        if v == -1 {
            if i > 0 && students[i - 1] == 1 {
                students[i - 1] -= 1
                students[i] += 1
            } else if i < n - 1 && students[i + 1] == 1 {
                students[i + 1] -= 1
                students[i] += 1
            }
                
        }
    }
    return students.filter{$0 >= 0}.count
}

solution(n, lost, reserve)
