import Foundation

let arr = [2, 6, 8, 14]

//func solution(_ arr: [Int]) -> Int {
//    var result: Int = 1
//    var numbers = arr
//
//    for divisor in 2...Int.max {
//        while true {
//            let dividedNumbers = numbers.map {($0 % divisor == 0) ? ($0 / divisor) : $0 }
//            if numbers != dividedNumbers {
//                numbers = dividedNumbers
//                result *= divisor
//            } else {
//                break
//            }
//        }
//        if numbers.filter({$0 != 1}).count == 0 { break }
//    }
//
//    return result
//}

func gcd(_ a: Int, _ b: Int) -> Int {
    (a % b != 0) ? gcd(b, a % b) : b
}

func lcm(_ m: Int, _ n: Int) -> Int {
    m * n / gcd(m, n)
}

func solution(_ arr: [Int]) -> Int {
    arr.reduce(1) { lcm($0, $1) }
}

let answer = solution(arr)
print(answer)

