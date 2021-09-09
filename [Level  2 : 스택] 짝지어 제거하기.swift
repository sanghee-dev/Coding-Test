import Foundation

let s = "abbcdaadca"

func solution(_ s:String) -> Int{
    var stack = [Character]()
    let arr = Array(s)

    for i in arr.indices {
        let str = arr[i]
        if stack.isEmpty { stack.append(str) }
        else {
            if stack.last == str { stack.removeLast() }
            else { stack.append(str) }
        }
    }
     return stack.isEmpty ? 1 : 0
}

solution(s)

