a=$(<Input_File.txt) #Declaring the input value
pattern='[A-Z]+\s*([0-9]+\.[0-9]+\.[0-9]+.[0-9]+):[0-9]+\s*->\s*[0-9]+\.[0-9]+\.[0-9]+.[0-9]+\:([0-9]+)' #Declaring the regular expression
touch Output.txt # creating a text file to store output
while read  line; #looping through every line of the text file
do
 if [[ $line =~ $pattern ]]; #matching the text with the pattern
   then
     echo "${BASH_REMATCH[1]}"",""${BASH_REMATCH[2]}">>Output.txt #Redirecting the first and second matched value
 fi
done<Input_File.txt #closing the loop after every line is read
