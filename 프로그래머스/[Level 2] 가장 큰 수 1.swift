import Foundation

let numbers = [0, 0, 0]

func solution(_ numbers:[Int]) -> String {
    let answer = numbers
        .sorted { "\($0)\($1)" > "\($1)\($0)" }
        .reduce("") { String($0) + String($1) }
    
    return answer.first == "0" ? "0" : answer
}

let answer = solution(numbers)
print(answer)

