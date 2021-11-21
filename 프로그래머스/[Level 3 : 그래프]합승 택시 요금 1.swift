import Foundation

let n = 6
let s = 4
let a = 6
let b = 2
let fares = [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var db: [[Int]] = Array(repeating: Array(repeating: 999999, count: n+1), count: n+1)
    var minFare = 9999999
    
    for fare in fares {
        db[fare[0]][fare[1]] = fare[2]
        db[fare[1]][fare[0]] = fare[2]
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if i == j { db[i][j] = 0 }
                if db[i][j] > db[i][k] + db[k][j] {
                    db[i][j] = db[i][k] + db[k][j]
                }
            }
        }
    }
    
    for midpoint in 1...n {
        let fare = db[s][midpoint] + db[midpoint][a] + db[midpoint][b]
        if minFare > fare { minFare = fare }
    }
    
    return minFare
}

let answer = solution(n, s, a, b, fares)
print(answer)

