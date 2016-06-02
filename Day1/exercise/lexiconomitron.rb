class Lexiconomitron
  def eat_t(sentence)
    sentence.gsub(/[tT]/,"")
  end

  def shazam(words)
    reverse_array = words.map {|item| item.reverse}
    first_last_array = [eat_t(reverse_array.shift)] + [eat_t(reverse_array.pop)]
  end

  def oompa_loompa(words_array)
    words_array.reject!{|word| word.size > 3}
    shorten_array = words_array.map{ |word| eat_t(word)}
  end
end
