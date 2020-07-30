#Define a method that take an Integer and return an array of all the numbers between 1 and that number
#Replace all multiple of 3 by "Fizz"
#Replace all multiple of 5 by "Buzz"
#Replace all multiple of 3 and 5 "FizzBuzz"
#///Pseudo code\\\
#Create an array with the capacity of n
#Iterate over the number in the array from 1 up to n
#Update the number with "FizzBuzz" if the number is a multiple of 15 
#Because all multiples of 15 is also multiples of either 3 or 5
#Update the number with "Fizz" if the number is a multiple of 3
#Update the number with "Buzz" if the number if a multiple of 5

def fizzbuzz(n)
    numbers = (1..n).to_a
    numbers.map do |num|
      if (num % 15 == 0)
        "FizzBuzz"
      elsif (num % 5 == 0)
        "Buzz"
      elsif (num % 3 == 0)
        "Fizz"
      else num
      end
    end
  end
  
  p fizzbuzz(56)  