import Foundation

let numbers = [6, 10, 2]

func solution(_ numbers:[Int]) -> String {
    let sortedNumArr = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }

    let answer = sortedNumArr.map({ String($0) }).reduce("") { $0 + $1 }
    
    return answer
}

solution(numbers)

