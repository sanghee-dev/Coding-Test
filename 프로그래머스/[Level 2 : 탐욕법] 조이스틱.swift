import Foundation

let name = "JAZ"

func solution(_ name:String) -> Int {
    let LENGTH = name.count
    let names = Array(name)
    var upDown = 0
    var leftRight = LENGTH - 1
    
    for name in names {
        upDown += getLength(name)
    }
    
    for (index, name) in names.enumerated() {
        if name != Character("A") {
            var nextIndex = index + 1
            while nextIndex < LENGTH && names[nextIndex] == Character("A") {
                nextIndex += 1
            }
            let length = (2 * index) + LENGTH - nextIndex
            leftRight = min(leftRight, length)
        }
    }
    
    return upDown + leftRight
}

func getLength(_ alphabet: Character) -> Int {
    let aValue = Character("A").asciiValue!
    let zValue = Character("Z").asciiValue!
    let value = alphabet.asciiValue!
    
    return Int(min(value - aValue, zValue - value + 1))
}

solution(name)
