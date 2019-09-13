import random
def find_max_crossing_subarray(A, low, mid, high) : 
    max_left, max_right = mid, mid+1
    left_sum = A[mid]
    sum = 0
    for i in range(mid,low-1,-1):
        sum = sum + A[i]
        if sum > left_sum:
            left_sum = sum
            max_left = i
    right_sum = A[mid+1]
    sum = 0
    for i in range(mid+1,high+1):
        sum = sum + A[i]
        if sum > right_sum:
            right_sum = sum
            max_right = i
    return (max_left, max_right, left_sum+right_sum)

def find_max_subarray(A,low=0,high=None):
    if high is None:
        high = len(A)-1
    if high == low:
        return (low,high,A[low])
    mid = (low+high)//2
    left_low,left_high,left_sum    = find_max_subarray(A,low,mid)
    right_low,right_high,right_sum = find_max_subarray(A,mid+1,high)
    cross_low, cross_high,cross_sum = find_max_crossing_subarray(A,low,mid,high)
    if left_sum >= right_sum and left_sum >= cross_sum:
        return left_low, left_high, left_sum
    elif right_sum > cross_sum:
        return right_low, right_high, right_sum
    else:
        return cross_low, cross_high, cross_sum

A = [random.randint(-10,10) for i in range(10)]
print(A)
print(find_max_subarray(A))