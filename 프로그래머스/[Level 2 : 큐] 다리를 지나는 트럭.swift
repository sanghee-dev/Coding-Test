import Foundation

let bridge_length = 2
let weight = 10
let truck_weights = [7,4,5,6]

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge: [Int] = Array(repeating: 0, count: bridge_length)
    var index = 0
    var time = 0
    var weights = 0
    
    while index < truck_weights.count {
        time += 1
        weights -= bridge.removeFirst()
        
        let truck = truck_weights[index]
        if weights + truck > weight {
            bridge.append(0)
        } else {
            bridge.append(truck)
            weights += truck_weights[index]
            index += 1
        }
    }
    
    return time + bridge_length
}

solution(bridge_length, weight, truck_weights)

