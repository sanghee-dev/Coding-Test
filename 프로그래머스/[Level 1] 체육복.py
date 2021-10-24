n = 5
lost = [4, 2]
reserve = [3, 5]	

def solution(n, lost, reserve):
    new_lost = [x for x in lost if x not in reserve]
    new_reserve = sorted([x for x in reserve if x not in lost])

    for i in new_reserve:
        if i-1 in new_lost:
            new_lost.remove(i-1)
        elif i+1 in new_lost:
            new_lost.remove(i+1)

    return n-len(new_lost)

answer = solution(n, lost, reserve)
print(answer)