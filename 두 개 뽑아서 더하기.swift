import Foundation

let numbers = [2,1,3,4,1]

func solution(_ numbers:[Int]) -> [Int] {
    let length = numbers.count
    var result: Set<Int> = []
    
    for i in 0..<length {
        for j in 0..<length {
            if i != j {
                result.insert(numbers[i] + numbers[j])
            }
        }
    }
        
    return result.sorted()
}

solution(numbers)
