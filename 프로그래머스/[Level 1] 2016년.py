a = 5
b = 24

def solution(a, b):
    months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    weeks = ["THU", "FRI","SAT", "SUN", "MON", "TUE", "WED"]

    days = sum(months[0:(a-1)]) + b

    return weeks[days % 7]

answer = solution(a, b)
print(answer)