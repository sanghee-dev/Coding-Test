import Foundation

let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict: [String: [[Int]]] = [:]
    
    genres.enumerated().forEach { (index, genre) in
        if dict[genre] == nil {
            dict[genre] = [[index, plays[index]]]
        } else {
            dict[genre]! += [[index, plays[index]]]
        }
    }
    
    return Array(dict.values)
        .sorted { $0.reduce(0) { $0 + $1[1] } > $1.reduce(0) { $0 + $1[1] } }
        .flatMap { $0.sorted { $0[1] > $1[1] }.map { $0[0] }.prefix(2) }
}

solution(genres, plays)

