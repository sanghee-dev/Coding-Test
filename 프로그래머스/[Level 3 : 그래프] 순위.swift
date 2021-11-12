import Foundation

let n = 5
let results = [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var db: [[Bool]] = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    
    // 이긴 승부만 true로 저장
    for result in results {
        db[result[0]][result[1]] = true
    }
    
    // i가 k를 이기고, k가 j를 이겼다면 i가 j를 이긴 것임
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if db[i][k] && db[k][j] { db[i][j] = true }
            }
        }
    }
    
    // i의 순위를 알기 위해선 자신을 제외한 모든 승패를 알아야 함
    for i in 1...n {
        var count = 0
        for j in 1...n {
            if db[i][j] || db[j][i] { count += 1 }
        }
        if (count >= n-1) { answer += 1 }
    }
    
    return answer
}

let answer = solution(n, results)
print(answer)

