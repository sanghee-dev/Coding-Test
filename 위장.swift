import Foundation

let clothes = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]

func solution(_ clothes:[[String]]) -> Int {
    let typeSet = Set(clothes.compactMap({ $0[1] }))
    
    let counts = typeSet.map({ type in
        return clothes.filter({ $0[1] == type }).count
    })
    
    return counts.reduce(1, {$0 * ($1 + 1)} ) - 1
}

solution(clothes)

