import Foundation

let N = 5
let number = 12

func dfs(_ N: Int, _ number: Int, _ depth: Int, _ temp: Int, _ answer: inout Int) {
    if depth > 8 { return }
    if answer > 0 && answer <= depth { return }
    if temp == number && (answer == -1 || answer > depth ) {
        answer = depth
    }
    
    var calc = 0
    
    for index in 1...(9 - depth) {
        calc = calc * 10 + N
        dfs(N, number, depth + index, temp + calc, &answer)
        dfs(N, number, depth + index, temp - calc, &answer)
        dfs(N, number, depth + index, temp * calc, &answer)
        dfs(N, number, depth + index, temp / calc, &answer)
    }
}

func solution(_ N:Int, _ number:Int) -> Int {
    var answer = -1
    dfs(N, number, 0, 0, &answer)
    return answer
}

solution(N, number)

