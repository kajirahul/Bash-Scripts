 #Assigning first argument to Largestvalue object
largestValue(){ #creating function find largest value
   Value=$1
   for num in "$@" #Iterating through every argument with num being the current argument
   do 
      if [ "$num" -gt "$Value" ] #Checking to see if current num argument is greater than the assigned LargestValue
      then
           Value=$num #Replacing the smallest value if true
      fi
    done
   echo "largest Value is:$Value"
}
lowestValue(){ #creating function to find lowest value
  SmallestValue=$1
  for num in "$@" #Iterating over every argument
  do
    if [ "$num" -lt "$SmallestValue" ] #Checking to see if the current num argument is less than assigned smallest value
    then
        SmallestValue=$num #Replacing the smallest value if true
    fi
  done
  echo "Smallest value is: $SmallestValue"
}
sum(){ #finding sum of passed arguments deducting lowest and largest value
  sum=0
  num=0
  for add in "$@"
  do 
     let sum=$sum+$add #adding all the arguments
     let num=$sum-$Value-$SmallestValue #deducting largestn and smallest value from total sum
  done
  echo "The sum of the numbers excluding largest and smallest value is: $num"
}
num_Array=("$@")
largestValue "${num_Array[@]}" 
lowestValue "${num_Array[@]}"
sum "${num_Array[@]}"
