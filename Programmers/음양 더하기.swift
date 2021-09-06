import Foundation

let absolutes = [4, 7, 12]
let signs = [true, false, true]

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(absolutes, signs).map({ $1 ? $0 : -1 * $0 }).reduce(0, +)
}

solution(absolutes, signs)
