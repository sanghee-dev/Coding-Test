import Foundation

var d = [1, 3, 2, 5, 4]
var budget = 9

func solution(_ d:[Int], _ budget:Int) -> Int {
    let costs = d.sorted()
    var sum = 0
    
    for (index, cost) in costs.enumerated() {
        sum += cost
        if sum > budget { return index }
    }
    
    return d.count
}

solution(d, budget)
