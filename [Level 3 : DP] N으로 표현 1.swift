import Foundation

let N = 5
let number = 12

func dfs(_ N: Int, _ number: Int, _ count: Int, _ tempNum: Int, _ result: inout Int) {
    if count > 8 { return }

    if result != -1 && count >= result {
        return
    } else if tempNum == number  {
        result = count
    }
    
    var newNum = 0
    for idx in 1...(9 - count) {
        newNum = newNum * 10 + N
        dfs(N, number, count + idx, tempNum + newNum, &result)
        dfs(N, number, count + idx, tempNum - newNum, &result)
        dfs(N, number, count + idx, tempNum * newNum, &result)
        dfs(N, number, count + idx, tempNum / newNum, &result)
    }
}

func solution(_ N:Int, _ number:Int) -> Int {
    var result = -1
    dfs(N, number, 0, 0, &result)
    return result
}

solution(N, number)
