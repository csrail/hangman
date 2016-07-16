#Store path to variable name
dictionary = File.open("./wordlist.txt")
# p dictionary #=>  #File:./wordlist.txt

wordlist = []

def adjust_word
	self.strip.downcase
end

dictionary.readlines.each do |line|
	wordlist << line.strip if line.strip.downcase.length >= 5 && line.strip.downcase.length <= 12
end

total_number_of_words = wordlist.length

random_index = rand(total_number_of_words)

p wordlist[random_index]