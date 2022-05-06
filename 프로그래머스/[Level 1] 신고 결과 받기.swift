import Cocoa

let id_list = ["muzi", "frodo", "apeach", "neo"]
let report = ["muzi frodo", "muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let k = 2

/*
프로그래머스에서 코드를 실행할 경우 다음과 같은 에러가 발생하므로
'where' clause cannot be attached to a non-generic declaration
Array의 Element 타입을 String으로 고정
*/
extension Array {

    func indexDictionary() -> [Element: Int] where Element: Hashable {
        var dict: [Element: Int] = [:]
        for (index, element) in self.enumerated() {
            dict[element] = index
        }
        return dict
    }

    mutating func appendIfNeeded(_ newElement: Element) where Element: Equatable {
        guard self.contains(newElement) == false else { return }
        self.append(newElement)
    }

}

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let idDict: [String: Int] = id_list.indexDictionary()
    var countList: [Int] = Array(repeating: 0, count: id_list.count)
    var reportDict: [String: [String]] = [:] // [reported: [reporter]]

    for repo in report {
        let arr = repo.components(separatedBy: " ")
        guard let reporter = arr.first,
              let reported = arr.last else { continue }
        guard var list = reportDict[reported] else {
            reportDict[reported] = [reporter]
            continue
        }
        list.appendIfNeeded(reporter)
        reportDict[reported] = list
    }

    reportDict.values.forEach {
        guard $0.count >= k else { return }
        $0.forEach {
            guard let id = idDict[$0] else { return }
            countList[id] += 1
        }
    }

    return countList
}

let result = solution(id_list, report, k)
print(result)

