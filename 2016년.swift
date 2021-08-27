import Foundation

let a = 5
let b = 24

func solution(_ a:Int, _ b:Int) -> String {
    let weeks = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let count = months[0..<a - 1].reduce(0, +) + b

    return weeks[count % 7]
}

solution(a, b)
