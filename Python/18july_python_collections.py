# list
lst = [1,1,2,3,4,5,6,7,7,8,9,12,13,15]
# list indexes start from 0
# lst[<index>]
# print (lst[3])
# selection of elements from iterables
# print (lst)

# add elements
# lst.append(22) # always add the elements at the end of the list
# # print (lst)
# lst.insert(3,43)
# print (lst,lst[3])
# deleting elements
# lst.remove(43) # to remove the element based on values
# lst.pop(4) # to remove the elements based on index
# print (lst)
# print (lst)
lst.append([12,24,36,48])
# print (lst)

lst.insert(0,[2,4,6,8,10])
# print (lst)
lst.append((3,6,9,12,15))
# print ("first list", lst[0])

# 2d array
sequence_1 = [1,2,3,4,5]
multiple_2 = [2,4,6,8,10]

print(multiple_2[2])
list_2d = [sequence_1,multiple_2,[3,6,9,12,15],[4,8,12,16,20],[5,10,15,20,25]] 
# get me the list containing the mulitple of 2
print ("multiple of 2",list_2d[1][2]) # way of accessing the 2d arrays
print ("3 multiple list ",list_2d[2])
# list slicing --  important
# Lst[ Initial : End : IndexJump ]
    # initial is inclusive
    # end is exclusive
    # index jump  = for each iterartion is indexjump + prev_indexjump

test = [1,2,3,4,5]
# initial = 0
# end = 3
# indexjump = - 1 
print (test,"checking of reverse index jump", test[-1::-1])
# initial = 4th Index
# end = last index i.e - 4th Index

    # exclusive 
lst.pop(-1)
lst.pop(-1)
print (lst,lst[1:])
print (lst,lst[1:11:1],lst[1:-4:1])
print (lst,lst[1:11:2],lst[1:-4:2])
# print (lst[-4])
# write a python program to get all 
# the even indexed values
print ("even position values",lst[0::2])
# get me the last 5 values from the list
print ("last 5 values from the list",lst[-5:])
# get me the values from index 3 to 8
print ("values from index 3 to 8",lst[3:9])
# the odd indexed values
print ("odd position values",lst[1::2])
# reverse a list using list slicing
print ("reversed list is :",lst[::-1])
print ("reversed list is :",list(reversed(lst)))


# dictionary
dict_test = {
    1: 'one',
    2: 'two',
    3: 'three',
    'test': 'four',
    5: 'five'
}
print (dict_test,dict_test['test'],test[2])
print (dict_test.keys(),dict_test.values())
# print (dict_test.get(<key>))
print (dict_test.get(3))
dict_test['list_test'] = ['apple','orange','pears']



print (dict_test)
# assignment is assigning the right side values to the left hand side variable
dict_test['list_test'][1] = 'mango'

print (dict_test,type(dict_test['list_test']),type(dict_test))

dict_test['list_test'].append('orange')

print (dict_test)
# removing from a dictionary
dict_test.pop(5)
print (dict_test)
# to delete the elements from the dictionary -  would give me the empty dictionry henceforth
# dict_test.clear()

# del dict_test # delete the whole dictionry
# del lst
print (dict_test,lst) # this would give error as we have deleted the collections
# convert lists to dictionary
print (list(dict_test.keys()),list(dict_test.values()))
print (dict(zip([1,2,3,4,5],['one','two','three','four','five'])))

# print (list(zip(list(dict_test.keys()),list(dict_test.values()))))


# tuple - immutable
tuple_exp = (2,6,7,8,5,4,4,4)
print(tuple_exp.count(4))
print (tuple_exp.index(4,3))

# sets
set_1 = {1,1,1,2,4,5,6,7,8,5}
set_2 = {5,22,12,24,9,5,6,7,8,5}
set.discard(set_2,5) # to remove a specific value if 
print (set_1,set_2)
print (set_1.intersection(set_2))
print (set_1.union(set_2))
print (set_2.difference(set_1))
# set(list())
test_list = [1,2,3,4,5,6,7,8,1,2,3,4,5]
# write a program to remove the duplicate values froma list
print ("remove the duplicates from the list",list(set(test_list)))
# 
print (sum(test_list))

# write a program to gget the sum of even positioned elements in the list
print (sum(test_list[0::2]))
# Write a program to reverse the unique elements sorted in descending 
#  #in the odd positioned values into a new tuple
print (test_list,tuple(sorted(list(set(test_list[1::2])))))
#  ---


print (list(dict_test.items())[0])
dict.it