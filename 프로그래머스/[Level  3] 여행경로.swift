import Foundation

let tickets = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]

func sortByArrayElements(_ lhs: [String], _ rhs: [String]) -> Bool {
    lhs.reduce("", +) < rhs.reduce("", +)
}

func solution(_ tickets: [[String]]) -> [String] {
    var results: [[String]] = []
    
    func dfs(_ places: [String] , _ indexes: [Int]) {
        var dict: [Int: String] = [:] // index: place
        
        if indexes.count >= tickets.count {
            results.append(places)
            return
        }
        
        for (index, ticket) in tickets.enumerated() {
            if (ticket[0] == places.last) && !indexes.contains(index) {
                dict[index] = ticket[1]
            }
        }
        
        dict.forEach({
            dfs(places + [$0.value], indexes + [$0.key])
        })
    }
    
    dfs(["ICN"], [])
    
    return results.sorted(by: sortByArrayElements)[0]
}

let answer = solution(tickets)

print(answer)
