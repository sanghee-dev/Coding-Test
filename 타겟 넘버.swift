import Foundation

let numbers = [1, 1, 1, 1, 1]
let target = 3

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(idx: Int, sum: Int) {
        guard idx != numbers.count else {
            if sum == target { result += 1 }
            return
        }
        dfs(idx: idx + 1, sum: sum + numbers[idx])
        dfs(idx: idx + 1, sum: sum - numbers[idx])
    }
    
    dfs(idx: 0, sum: 0)

    return result
}

solution(numbers, target)
