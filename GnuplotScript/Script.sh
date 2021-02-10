<<DESCRIPTION 
   -First, I generated the IP addresses from given input file using regex expression.
   -Second, I used the obtained IP addresses and generate the Longitude, Latitude, city and country name using curl function calling 
    geoiplookup site.
   -Third, I redirected and appended the obtained output to file called world.cor and to color the IP marker I sorted out the added 
    files in world.cor folder
   -Fourth, I created the gnuplot script in the project directory and added values to plot world map and obtained IP addresses to
    produce a png file.
   -Fifth, I changed the pointer style, added label and key to distinguish datas in the obtained png file from gnuplot script. 
DESCRIPTION

#Read the input IP file 
Inputfile=$(<Exam2-IP_Output.txt )

#Creates two different text files, one with standard output(world.cor) and other with colored output(customer.cor)
touch world.cor
touch customer.cor

#Creating loop to read through each line and get required customer information using IP addresses and storing desired output
while read line;
do
  curl -s https://json.geoiplookup.io/$line | \
        jq -r '.longitude, .latitude, .city, .country_name' | \
        while read -r LONGITUDE; do
                read -r LATITUDE
                read -r CITY
                read -r COUNTRY
                echo -e "${LONGITUDE} ${LATITUDE} #${CITY}, ${COUNTRY}">>world.cor
                echo -e "\e[31m${LATITUDE}, \e[95m${LONGITUDE}, \e[33m#${CITY}, \e[34m${COUNTRY}">>customer.cor
		#Adding a two second gap between consecutive calls
		sleep 2s
        done
#Setting the upper boundary of loop
done < Exam2-IP_Output.txt 

#Calling the gnuplot that uses the data from world.cor and plots the required map
gnuplot GnuPlot.gnuplot









