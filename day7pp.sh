1. Write a program in the following steps
a. Generates 10 Random 3 Digit number.
-shuf -i 100-999 -n 10

b. Store this random numbers into a array.
#!/bash/bin
for i in $(seq 0 9) 
do 
	r=$(( $RANDOM % 900 + 100 )) 
	number[i]=$r
	echo "${number[i]}"
done 
echo "Array in original order"
echo ${number[*]}

c. Then find the 2nd largest and the 2nd smallest element without sorting the array.

shuf -i 100-999 -n 10
#!/bash/bin
#$(( $RANDOM % 900 + 100 ))

s1=999999 
s2=999999
for i in $(seq 1 10) 
do 
	r=$(( $RANDOM % 900 + 100 )) 
	echo $r 
	if [ $s1 -gt $r ] 
	then 
		s2=$s1 
		s1=$r 
	elif [ \( $s2 -gt $r \) -a \( $s1 -ne $r \) ] 
	then 
		s2=$r 
	fi 
done 
echo 
# echo "Smallest $s1" 
echo "Second smallest $s2" 


2.Extend the above program to sort the array and then find the 2nd largest and the 2nd smallest element.
-
#!/bash/bin
#r=$(( $RANDOM % 900 + 100 ))
#number[0]=$r;
#echo ${number[0]}

for i in $(seq 0 9) 
do 
	r=$(( $RANDOM % 900 + 100 )) 
	number[i]=$r
	echo "${number[i]}"
done 
echo "Array in original order"
echo ${number[*]}

for ((i = 0; i<10; i++))
do
    
    for((j = 0; j<10-i-1; j++))
    do
    
        if [ ${number[j]} -gt ${number[$((j+1))]} ]
        then
            temp=${number[j]}
            number[$j]=${number[$((j+1))]}  
            number[$((j+1))]=$temp
        fi
    done
done

echo "Array in sorted order :"
echo ${number[*]}
echo "Second Largest: ${number[8]}"
echo "Second Smallest: ${number[1]}"


5. Take a range from 0 – 100, find the digits that are repeated twice like 33, 77, etc and store them in an array
-
 #!/bash/bin

for i in $(seq 10 100) 
do 
	n=$i
	num=0
	while [ $n -gt 0 ]	
	do
		num=$(expr $num \* 10)
		k=$(expr $n % 10)
	 	num=$(expr $num + $k)
		if [ $num -eq $n ]
		then
             	for i in $(seq 0 100)
			do
				number[i]=$num
            	done	
		fi
		n=$(expr $n / 10)
	done
done 
echo ${number[*]}

