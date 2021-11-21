import Foundation

let places = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

extension String {
    subscript(_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    
    // place = ["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"]
    for place in places {
        var pArr: [[Int]] = []
        var isSafe = true
        
        // row == "POOOP"
        // pArr에 P의 [행, 열] 위치값을 넣는다.
        for (i, row) in place.enumerated() {
            for (j, v) in row.enumerated() {
                if v == "P" {
                    pArr.append([i, j])
                }
            }
        }

        for i in 0..<pArr.count {
            if !isSafe { break }
            
            for j in (i+1)..<pArr.count {
                let first = pArr[i] // (1, 0)
                let second = pArr[j] // (2, 1)
                let distance = abs(first[0] - second[0]) + abs(first[1] - second[1])
                
                // 거리가 2 초과인 경우 계속
                if distance > 2 { continue }
                
                // 거리가 1인 경우 X
                if distance == 1 {
                    isSafe = false
                    break
                }
                
                // 거리가 2인 경우 체크
                if distance == 2 {
                    if (first[0] == second[0]) {
                        // 행이 일치하는 경우
                        if place[first[0]][min(first[1], second[1]) + 1] == "O" {
                            isSafe = false
                            break
                        }
                    } else if (first[1] == second[1]) {
                        // 열이 일치하는 경우
                        if place[min(first[0], second[0]) + 1][first[1]] == "O" {
                            isSafe = false
                            break
                        }
                    } else {
                        // 행과 열이 1씩 차이나는 경우
                        if place[first[0]][second[1]] == "O" || place[second[0]][first[1]] == "O" {
                            isSafe = false
                            break
                        }
                    }
                }
            }
        }
        result.append(isSafe ? 1 : 0)
    }
    return result
}

let answer = solution(places)
print(answer)

