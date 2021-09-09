import Foundation

let dirs = "LULLLLLLU"

func solution(_ dirs: String) -> Int {
    let dirArr = dirs.map({ $0 })
    var x = 0
    var y = 0
    var db = Set<String>() // "x1y1x2y2"
    
    for dir in dirArr {
        move(&x, &y, &db, dir)
    }
    
    return db.count / 2
}

func saveToDb(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ db: inout Set<String>) {
    db.insert("\(x1)\(y1)\(x2)\(y2)")
    db.insert("\(x2)\(y2)\(x1)\(y1)")
}

func move(_ x: inout Int, _ y: inout Int, _ db: inout Set<String>, _ dir: Character) {
    switch dir {
    case "U": if y != 5 {
        saveToDb(x, y, x, (y + 1), &db)
        y += 1
    }
    case "D": if y != -5 {
        saveToDb(x, y, x, (y - 1), &db)
        y -= 1
    }
    case "L": if x != -5 {
        saveToDb(x, y, (x - 1), y, &db)
        x -= 1
    }
    case "R": if x != 5 {
        saveToDb(x, y, (x + 1), y, &db)
        x += 1
    }
    default: break
    }
}

solution(dirs)
