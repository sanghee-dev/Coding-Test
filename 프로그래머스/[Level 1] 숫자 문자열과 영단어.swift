import Foundation

let s = "one4seveneight"

enum Number: String {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine

    var number: Int {
        switch self {
        case .zero: return 0
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        }
    }
}

func solution(_ s:String) -> Int {
    var result = ""
    var temp = ""

    func checkTemp() {
        guard let number = Number(rawValue: temp) else { return }
        result += String(number.number)
        temp = ""
    }

    for char in s {
        let str = String(char)
        guard Int(str) == nil else {
            result += str
            continue
        }
        temp += str
        checkTemp()
    }

    return Int(result) ?? 0
}

let result = solution(s)
print(result)

