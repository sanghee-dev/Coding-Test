import Foundation

let w = 8
let h = 12

func solution(_ w:Int, _ h:Int) -> Int64{
    let divisor = gcd(w, h)
    
    let minW = w / divisor
    let minH = h / divisor
    
    let result = (w * h) - ((minW + minH - 1) * divisor)
    
    return Int64(result)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return mod == 0 ? min(a, b) : gcd(b, mod)
}

solution(w, h)

