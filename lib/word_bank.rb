class WordBank
	attr_reader :dictionary, :wordlist, :find_random_word, :close_stream

	def initialize
		#Assign path to variable name ls "dictionary"
		# p dictionary #=>  #File:./wordlist.txt
		@dictionary = File.open("./lib/wordlist.txt")
		@wordlist = []

		create_word_bank
		
		@find_random_word = wordlist[random_index] 
	end

	
	protected

	def random_index
		rand(total_number_of_words)
	end

	def total_number_of_words
		wordlist.length
	end

	def create_word_bank
		dictionary.readlines.each do |line|
			wordlist << line.strip.downcase if between_5_and_12_characters?(line)
		end		
	end

	def between_5_and_12_characters?(line)
		line.strip.length >= 5 && line.strip.length <= 12
	end

	def close_dictionary
		dictionary.close
	end

end
