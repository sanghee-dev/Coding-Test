from heapq import *

scoville = [1, 2, 3, 9, 10, 12]	
K = 7

def solution(scoville, K):
    count = 0
    heapify(scoville)
    while scoville[0] < K and len(scoville) > 1:
        mix = heappop(scoville) + heappop(scoville) * 2
        heappush(scoville, mix)
        count += 1
    return count if scoville[0] >= K else -1


answer = solution(scoville, K)
print(answer)