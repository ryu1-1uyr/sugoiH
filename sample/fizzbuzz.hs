fizzbuzz n 
  | mod n 15 == 0 = "FizzBuzz "
  | mod n 5 == 0 = "Fizz "
  | mod n 3 == 0 = "Buzz "
  | otherwise = show n
