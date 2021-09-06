import Foundation

let new_id = "...!@BaT#*..y.abcdefghijklm"

func solution(_ new_id:String) -> String {
    
    func step1(_ str: String) -> String {
        return str.lowercased()
    }
    
    func step2(_ str: String) -> String {
        let specialChars = ["-", "_", "."]
        return  str.filter({ $0.isLetter || $0.isNumber || specialChars.contains(String($0)) })
    }
    
    func step3(_ str: String) -> String {
        var newStr = str
        while newStr.contains("..") {
            newStr = newStr.replacingOccurrences(of: "..", with: ".")
        }
        return newStr
    }
    
    func step4(_ str: String) -> String {
        var newStr = str
        if newStr.first == "." { newStr.removeFirst() }
        if newStr.last == "." { newStr.removeLast()}
        return newStr
    }
    
    func step5(_ str: String) -> String {
        return str == "" ? "a" : str
    }
    
    func step6(_ str: String) -> String {
        var newStr = str
        if newStr.count >= 16 {
            newStr = String(newStr.prefix(15))
        }
        newStr = step4(newStr)
        return newStr
    }
    
    func step7(_ str: String) -> String {
        if str.count == 1 {
            return String(repeating: str, count: 3)
        }
        if str.count == 2 {
            return str + String(str.last!)
        }
        return str
    }
    
    var answer = new_id
    
    answer = step1(answer)
    answer = step2(answer)
    answer = step3(answer)
    answer = step4(answer)
    answer = step5(answer)
    answer = step6(answer)
    answer = step7(answer)
    
    return answer
}

solution(new_id)
