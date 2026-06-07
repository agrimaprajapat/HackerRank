#https://www.hackerrank.com/challenges/python-print/problem


if __name__ == '__main__':
    n = int(input())
    new_str=""
    for i in range(1,n+1):
        new_str+=str(i)
        
    print(new_str)