import Foundation

let price = 3
let money = 20
let count = 4

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let sum = price * count * (count + 1) / 2
    return Int64(sum - money > 0 ? sum - money : 0)
}

solution(price, money, count)
