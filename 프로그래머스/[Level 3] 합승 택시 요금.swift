import Foundation

let n = 6
let s = 4
let a = 6
let b = 2
let fares = [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    var db: [[Int]] = []

    // db 세팅
    for i in 0...n {
        var arr: [Int] = []
        for j in 0...n {
            arr.append((i == j) ? 0 : 999999)
        }
        db.append(arr)
    }

    // 요금 적용
    for fare in fares {
        db[fare[0]][fare[1]] = fare[2]
        db[fare[1]][fare[0]] = fare[2]
    }

    // i는 출발지점, j는 도착지점, k는 중간지점
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if db[i][j] > (db[i][k] + db[k][j]) {
                    db[i][j] = (db[i][k] + db[k][j])
                }
            }
        }
    }

    var result = db[s][a] + db[s][b]

    // s는 출발지점, a,b는 도착지점, k는 중간지점
    for k in 1...n {
        if result > (db[s][k] + db[k][a] + db[k][b]) {
            result = (db[s][k] + db[k][a] + db[k][b])
        }
    }

    return result
}

let answer = solution(n, s, a, b, fares)
print(answer)

