import Foundation

let s = "[)(]"

func isCorrect(_ s: String) -> Bool {
    var queue: [Character] = []
    
    for c in s {
        if queue.isEmpty {
            queue.append(c)
        } else {
            guard let last = queue.last else { continue }
            switch last {
            case "[": if c == "]" { queue.removeLast() } else { queue.append(c) }
            case "(": if c == ")" { queue.removeLast() } else { queue.append(c) }
            case "{": if c == "}" { queue.removeLast() } else { queue.append(c) }
            default: queue.append(c)
            }
        }
    }
    
    return queue.isEmpty
}

func solution(_ s: String) -> Int {
    var count = 0
    
    for offset in 0..<s.count {
        let startIndex = s.index(s.startIndex, offsetBy: offset)
        let str = s[startIndex..<s.endIndex] + s[s.startIndex..<startIndex]
        if isCorrect(String(str)) { count += 1 }
    }
    
    return count
}

let answer = solution(s)
print(answer)

