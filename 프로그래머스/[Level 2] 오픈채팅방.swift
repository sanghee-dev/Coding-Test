import Foundation

let record = ["Enter uid1234 Muzi",
              "Enter uid4567 Prodo",
              "Leave uid1234",
              "Enter uid1234 Prodo",
              "Change uid4567 Ryan"]

func solution(_ record:[String]) -> [String] {

    let records = record.map({ $0.components(separatedBy: " ") })
    var dataDic: [String: String] = [:]

    records.forEach({ rec in
        if rec[0] != "Leave" {
            dataDic[rec[1]] = rec[2]
        }
    })

    let result = records.filter({ rec in
        rec[0] != "Change"
    }).map({ rec -> String in
        guard let username = dataDic[rec[1]] else { return "" }
        
        switch rec[0] {
        case "Enter": return "\(username)님이 들어왔습니다."
        case "Leave": return "\(username)님이 나갔습니다."
        default: return ""
        }
    })
    
    return result
}

solution(record)
