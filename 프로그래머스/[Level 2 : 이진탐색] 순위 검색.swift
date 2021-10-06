import Foundation

let info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
let query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var db: [String: [Int]] = [:]
    var result: [Int] = []
    
    for data in info {
        let infoArr = data.components(separatedBy: " ")
        let langs = [infoArr[0], "-"]
        let jobs = [infoArr[1], "-"]
        let careers = [infoArr[2], "-"]
        let foods = [infoArr[3], "-"]
        let score = Int(infoArr[4])!
        
        for lang in langs {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        let key = "\(lang) \(job) \(career) \(food)"
                        if db.keys.contains(key) {
                            db[key]?.append(score)
                        } else {
                            db[key] = [score]
                        }
                    }
                }
            }
        }
    }
    
    for data in db {
        let sortedData = data.value.sorted()
        db[data.key] = sortedData
    }

    query.forEach {
        let separatedQuery = $0.components(separatedBy: " ")
        
        let lang = separatedQuery[0]
        let job = separatedQuery[2]
        let career = separatedQuery[4]
        let food = separatedQuery[6]
        let score = Int(separatedQuery[7])!
        
        let key = "\(lang) \(job) \(career) \(food)"
        
        if let dbScores = db[key] {
            var start = 0
            var end = dbScores.count
            while start < end {
                let mid = (start + end) / 2
                if dbScores[mid] >= score {
                    end = mid
                } else {
                    start = mid + 1
                }
            }
            result.append(dbScores.count - start)
        } else {
            result.append(0)
        }
    }
    
    return result
}

solution(info, query)
