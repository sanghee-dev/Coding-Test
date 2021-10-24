import Foundation

let orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
let course = [2, 3, 4]

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    // dict = [2: [:], 3: [:], 4: [:]]
    var dict = Dictionary(uniqueKeysWithValues: course.map({ ($0, Dictionary<String, Int>()) }))

    for order in orders {
        let orderArr = Array(order).map({ String($0) }).sorted()
        
        for key in course {
            let combiArr = getCombination(orderArr, key)
            for menu in combiArr {
                if dict[key] != nil {
                    if dict[key]![menu] != nil {
                        dict[key]![menu]! += 1
                    } else {
                        dict[key]![menu] = 1
                    }
                }
            }
        }
    }
    
    var result: [String] = []
    
    for key in course {
        guard let maxValue = dict[key]?.values.max(), maxValue > 1 else { break }
        if let maxDict = dict[key]?.filter({ $0.value == maxValue }) {
            result.append(contentsOf: maxDict.keys)
        }
    }
 
    return result.sorted()
}

// ["A", "B", "C"], 2 -> ["AB", "AC", "BC"]
func getCombination(_ array: [String], _ targetNum: Int) -> [String] {
    var result: [String] = []
    
    func combinate(_ index: Int, _ now: String) {
        if now.count == targetNum {
            result.append(now)
            return
        }
        for i in index..<array.count {
            combinate(i + 1, now + array[i])
        }
    }
    
    combinate(0, "")
    return result
}

solution(orders, course)
