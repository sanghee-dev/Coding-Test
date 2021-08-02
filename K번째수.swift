import Foundation

var array = [1, 5, 2, 6, 3, 7, 4]
var commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    for command in commands {
        let i = command[0]
        let j = command[1]
        let k = command[2]
        
        let arr = array[i - 1...j - 1]
        let sortedArr = arr.sorted()
        
        answer.append(sortedArr[k - 1])
    }
    return answer
}

solution(array, commands)
