import Foundation

let numbers = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hand = "left"

func solution(_ numbers:[Int], _ hand:String) -> String {
    var leftHand = 10
    var rightHand = 12
    var result = ""
    
    let leftNums = [1, 4, 7]
    let rightNums = [3, 6, 9]
    
    func moveHandAndAddResult(isLeftHand: Bool, number: Int) {
        if isLeftHand {
            leftHand = number
            result += "L"
        } else {
            rightHand = number
            result += "R"
        }
    }
    
    for num in numbers {
        if leftNums.contains(num) {
            moveHandAndAddResult(isLeftHand: true, number: num)
        } else if rightNums.contains(num) {
            moveHandAndAddResult(isLeftHand: false, number: num)
        } else {
            let number = num == 0 ? 11 : num
            
            let left = abs((number - leftHand) / 3 + (number - leftHand) % 3)
            let right = abs((number - rightHand) / 3 + (number - rightHand) % 3)
            
            if left == right {
                if hand == "left" {
                    moveHandAndAddResult(isLeftHand: true, number: number)
                } else {
                    moveHandAndAddResult(isLeftHand: false, number: number)
                }
            } else if left < right {
                moveHandAndAddResult(isLeftHand: true, number: number)
            } else {
                moveHandAndAddResult(isLeftHand: false, number: number)
            }
        }
    }
    return result
}

solution(numbers, hand)
