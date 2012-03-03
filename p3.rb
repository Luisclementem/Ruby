def combine_anagrams(words)
  result = Hash.new()
  words.each do |word|
  index = word.downcase.chars.sort { |a,b| a.casecmp(b) }.join
  if (result[index])
    result[index].push( word)
  else
    result[index]= Array(word)
  end
  end
  resArray = Array[]
  result.each do |key,arr|
    resArray.push(result[key])
  end
  return resArray
  
end

puts combine_anagrams(['cars','for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])

