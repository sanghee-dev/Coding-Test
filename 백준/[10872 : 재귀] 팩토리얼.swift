import Foundation

let input = readLine()
let n = Int(input!)!

func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 1 }
    return n * factorial(n - 1)
}

print(factorial(n))

