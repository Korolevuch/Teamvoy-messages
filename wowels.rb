def countWovels(string)
  arr = ['a', 'e', 'o' , "u", 'y', 'i']
  count = 0
  string.each_char { |el| count += 1 if arr.include?(el) }
  count
end
