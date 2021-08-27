def generate_subsets(s):
    rs=[]
    for n in range(2**len(s)):
        r=[]
        b=("0"*len(s)+"{0:b}".format(n))[-len(s):][::-1]
        for k in range(len(b)):
            if b[k]=='1':
                r+=[s[k]]
        rs+=[r]
    return rs
                

my_set = [1,2,3]
print(", ".join(["{"+",".join([str(l) for l in k])+"}" for k in generate_subsets(my_set)]))

