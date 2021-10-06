import Foundation

let nums = [1,2,3,4]

func solution(_ nums:[Int]) -> Int {
    var result = 0
    
    func combination(_ index: Int, _ sum: Int, _ count: Int) {
        if count == 3 {
            if isPrime(sum) { result += 1}
            return
        }
        for i in index..<nums.count {
            combination(i + 1, sum + nums[i], count + 1)
        }
    }
    
    combination(0, 0, 0)
    
    return result
}

func isPrime(_ num: Int) -> Bool {
    if(num < 4) { return num == 1 ? false : true }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

solution(nums)

