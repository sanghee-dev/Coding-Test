import Foundation

let brown = 24
let yellow = 24

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for h in 3...Int(sqrt(Double((brown + yellow)))) {
        let w = (brown + yellow) / h
        if (w - 2) * (h - 2) == yellow { return [w, h]}
    }
    return []
}

solution(brown, yellow)
