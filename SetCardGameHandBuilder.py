# -*- coding: utf-8 -*-
"""
Created on Fri Nov 10 08:20:33 2017

@author: Stebbins
"""

import random
from itertools import combinations

number = ["1","2","3"] # number of shapes
shape = ["S","D","C"]  # Square, Diamond, Circle
colors = ["R","G","P"] # Red, Green, Purple
fill = ["S","E","T"]   # Solid, Empty, Transparent

# Create 81 cards, 1 of each combination
output_list = []
for i in number:
    for j in shape:
        for k in colors:
            for m in fill:
                temp = i+j+k+m
                output_list.append(temp)
                
#print (output_list)
#print("--------------------------------------------------------")

            

#print (temp_list)
#print("--------------------------------------------------------")
#print(output_list)
#print("--------------------------------------------------------")

def allUnique(x):
    seen = set()
    return not any(i in seen or seen.add(i) for i in x)

def allSame(x):
   return x[1:] == x[:-1]

def dealHand():
    # create a copy of the main list and shuffle it
    temp_list = output_list[:]
    random.shuffle(temp_list)    
    
    #Grab the first 12 cards out of the shuffled list for this hand
    this_hand = temp_list[0:6]
#    print (this_hand)
#    print("--------------------------------------------------------")

    sets_in_hand = 0
    #Look for a match
    for combo in combinations(this_hand,3):
#        print (combo)
        
        temp1 = combo[0][0]+combo[1][0]+combo[2][0]
        if allSame(temp1) == True or allUnique(temp1) == True:
            
            temp2 = combo[0][1]+combo[1][1]+combo[2][1]
            if allSame(temp2) == True or allUnique(temp2) == True:
                
                temp3 = combo[0][2]+combo[1][2]+combo[2][2]
                if allSame(temp3) == True or allUnique(temp3) == True:
                    
                    temp4 = combo[0][3]+combo[1][3]+combo[2][3]
                    if allSame(temp4) == True or allUnique(temp4) == True:
#                        print("SET!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                        sets_in_hand = sets_in_hand + 1
#    print("Total sets in this hand = ",sets_in_hand)
    
    handToString(this_hand,sets_in_hand)
    
    if sets_in_hand > 0:
        return True
    else:
        return False
    
def handToString(input_hand,sets_in_hand):
    output_string = ""
    i = 1
    for each in input_hand:
        output_string = output_string + str(i) + "," + each[0] + "," + each[1] + "," + each[2] + "," + each[3] + "/"
        i = i + 1
    output_string  = output_string + str(sets_in_hand)
    print (output_string)
    
hands = 10
hands_with_a_set = 0
for i in range (0,hands):
    temp = dealHand()
    
    if temp == True:
        hands_with_a_set = hands_with_a_set + 1
              
print("")
print("Number of hands out of",hands,"that contain a set is =",hands_with_a_set)


    