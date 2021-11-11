import Foundation

let jobs = [[0, 3], [1, 9], [2, 6]]

func solution(_ jobs:[[Int]]) -> Int {
    var now: Int = 0
    var waits: Int = 0
    var sortedJobs = jobs.sorted { ($0[1] == $1[1]) ? ($0[0] < $1[0]) : ($0[1] < $1[1]) }
    
    while sortedJobs.count > 0 {
        for (index, job) in sortedJobs.enumerated() {
            if job[0] <= now {
                sortedJobs.remove(at: index)
                now += job[1]
                waits += (now - job[0])
                break
            }
            if (index == (sortedJobs.count - 1)) { now += 1 }
        }
    }

    return waits / jobs.count
}

let answer = solution(jobs)
print(answer)
