if [ "$#" = 0 ] #Checking to see if no argument is passes
then 
     echo "Please pass the argument eg:1 or 1 2."  #Display error message
     exit 1 #Exit the program
fi 
Value=$1 #Assigning first argument to Largestvalue object
for num in "$@" #Iterating through every argument with num being the current argument
do 
   if [ "$num" -gt "$Value" ] #Checking to see if current num argument is greater than the assigned LargestValue
   then
        Value=$num #Replacing the smallest value if true
   fi
done
echo "Largest value is: $Value"
SmallestValue=$1
for num in "$@" #Iterating over every argument
do
  if [ "$num" -lt "$SmallestValue" ] #Checking to see if the current num argument is less than assigned smallest value
  then
      SmallestValue=$num #Replacing the smallest value if true
  fi
done
echo "Smallest value is: $SmallestValue"
sum=0
for add in "$@"
do 
   let sum=$sum+$add #adding all the arguments
   let num=$sum-$Value-$SmallestValue #deducting largestn and smallest value from total sum
done
echo "The sum of the numbers excluding largest and smallest value is: $num"
