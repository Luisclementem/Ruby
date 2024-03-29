def palindrome?(string)
  string.downcase.gsub(/\W/,'') == string.downcase.reverse.gsub(/\W/,'')
end
def count_words(string)
  h = Hash.new()
  string.downcase.gsub(/\W/, " ").split(" ").each do |w|
    if (h[w])
      h[w] = h[w] + 1 
    else
      h[w] = 1
    end
  end
  return h
end
