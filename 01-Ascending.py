def generate_subsets(s):
    if s==[]:
        return [[]]
    child_subsets = generate_subsets(s[:-1])
    return child_subsets+[k+[s[-1]] for k in child_subsets]

my_set = [1,2,3]
print(", ".join(["{"+",".join([str(l) for l in k])+"}" for k in generate_subsets(my_set)]))
