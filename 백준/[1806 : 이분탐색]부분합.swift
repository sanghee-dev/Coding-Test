import Foundation

// 예제 입력 1
// 10 15
// 5 1 3 5 10 7 4 9 2 8

// 예제 출력 1
// 2

let input1 = readLine()
let input2 = readLine()

var N = 0  // 10
var S = 0 // 15
var numbers: [Int] = [] // [5, 1, 3, 5, 10, 7, 4, 9, 2, 8]

if let input1 = input1, let input2 = input2 {
    let array = input1.components(separatedBy: " ")
    
    N = Int(array[0]) ?? 0
    S = Int(array[1]) ?? 0
    numbers = input2.components(separatedBy: " ").map({ Int($0) ?? 0 })
}

func solution(_ N: Int, _ S: Int, _ numbers: [Int]) -> Int {
    var left = 0
    var right = 0
    var sum = 0
    var result = N + 1
    
    while left <= right {
        if sum >= S {
            result = min(result, right - left)
            sum -= numbers[left]
            left += 1
        } else if right == N {
            break
        } else {
            sum += numbers[right]
            right += 1
        }
    }
    
    return result == N + 1 ? 0 : result
}

let answer = solution(N, S, numbers)
print(answer)
