import Foundation

let s = "{{1,2,3},{2,1},{1,2,4,3},{2}}"

func solution(_ s:String) -> [Int] {
    var result: [String] = []
    var s = s
    s.removeFirst(2)
    s.removeLast(2)
    
    s
        .components(separatedBy: "},{")
        .map { $0.components(separatedBy: ",") }
        .sorted { $0.count < $1.count }
        .forEach {
            $0.forEach {
                if !result.contains($0) {
                    result.append($0)
                }
            }
        }
    
    return result.map { Int($0)! }
}

let answer = solution(s)
print(answer)
