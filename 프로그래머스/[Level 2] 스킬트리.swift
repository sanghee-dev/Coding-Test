import Foundation

let skill = "ABC"
let skill_trees = ["OPQ"]

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var count: Int = 0
    let skills = Array(skill)
    
    for skill_tree in skill_trees {
        var lastIndex = 0
        var isAbleToLearn = true
        for (i, s) in skill_tree.enumerated() {
            guard let index = skills.firstIndex(of: s) else { continue }
            if index != lastIndex {
                isAbleToLearn = false
                break
            } else {
                lastIndex += 1
            }
        }
        if isAbleToLearn { count += 1 }
    }
    
    return count
}

let answer = solution(skill, skill_trees)
print(answer)

