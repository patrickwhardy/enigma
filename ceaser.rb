require 'pry'
​#prompt https://gist.github.com/mikedao/b855ac8a2ca21a00662f
# iteration 1
initials = ARGV.map do |name|
  name[0].upcase
end.join
​
# iteration 2
​
def cyphertext(char, key)
  alphabet = ('a'..'z').to_a
  if char == " " || char == "."
    char
  else
    char_index = alphabet.index { |x| x == char.downcase}
    new_index = char_index + key
    if new_index > 27
      new_index - 27
    end
    encrypted_letter = alphabet[new_index]
    if char == char.upcase
      encrypted_letter.upcase!
    else
      encrypted_letter
    end
  end
end
​
def rotate_method(orig_index, key, alphabet)
  final_rotate = orig_index + key
  if final_rotate > 26
    final_rotate = final_rotate - 27
  end
  alphabet[final_rotate]
end
​
key = ARGV[0].to_i
message = ARGV[1..-1]
​
cipher = message.map do |message|
  message.chars.map do |char|
    cyphertext(char, key)
  end.join
end.join(' ')
​
puts cipher
