import Foundation

let expression = "100-200*300-500+20"

func solution(_ expression:String) -> Int64 {
    var result: [Int] = []
    let orders = [["+", "-", "*"], ["+", "*", "-"],
                  ["-", "+", "*"], ["-", "*", "+"],
                  ["*", "+", "-"], ["*", "-", "+"]]
    
    // ["100", "-", "200", "*", "300", "-", "500", "+", "20"]
    let expressArr = splitExpression(expression)
    
    for order in orders {
        let num = calculate(expressArr, order)
        result.append(num)
    }
    
    return Int64(result.max()!)
}

func calculate(_ expressArr: [String], _ orderArr: [String]) -> Int {
    var arr = expressArr
    
    for order in orderArr {
        while arr.contains(order) {
            guard let index = arr.firstIndex(of: order) else { break }
            let firstNum = arr.remove(at: index - 1)
            let secondNum = arr.remove(at: index)
            
            switch order {
            case "+": arr[index - 1] = String("\(Int(firstNum)! + Int(secondNum)!)")
            case "-": arr[index - 1] = String("\(Int(firstNum)! - Int(secondNum)!)")
            case "*": arr[index - 1] = String("\(Int(firstNum)! * Int(secondNum)!)")
            default: break
            }
        }
    }
    
    return abs(Int(arr[0])!)
}

func splitExpression(_ expression: String) -> [String] {
    var result: [String] = []
    var tmp = ""
    
    for v in expression {
        let str = String(v)
        if !["+", "-", "*"].contains(str) {
            tmp += str
        } else {
            result.append(tmp)
            result.append(str)
            tmp = ""
        }
    }
    result.append(tmp)
    
    return result
}

solution(expression)

