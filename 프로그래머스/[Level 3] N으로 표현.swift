import Foundation

let N = 5
let number = 83

func getAnswer(count: Int, now: Int) {
    if count > 8 { return }
    if (result != -1) && (count >= result) { return }

    if now == number {
        result = count
        return
    }
    
    var newNum = 0
    for i in 1..<(9-count) {
        newNum = newNum * 10 + N
        getAnswer(count: count + i, now: now + newNum)
        getAnswer(count: count + i, now: now - newNum)
        getAnswer(count: count + i, now: now * newNum)
        getAnswer(count: count + i, now: now / newNum)
    }
}

func solution(_ N: Int, _ number: Int) -> Int {
    var result = -1
    getAnswer(count: 0, now: 0)
    
    return result
}

solution(N, number)
