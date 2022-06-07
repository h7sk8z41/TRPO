def sumDigit(digit)

  arrayOfDigits = digit
  sum = 0
  while(digit >= 1)
    sum += digit % 10
    digit /= 10;
  end


