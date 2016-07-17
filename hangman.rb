timer_start = Time.now

class WordBank
	attr_reader :dictionary, :wordlist, :find_random_word, :close_stream

	def initialize
		#Assign path to variable name "dictionary"
		# p dictionary #=>  #File:./wordlist.txt
		@dictionary = File.open("./wordlist.txt")
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


class SecretWord
	attr_reader :wordbank

	def initialize
		@wordbank = access_wordbank
	end

	def access_wordbank
		WordBank.new
	end

	def generate_random_word
		wordbank.find_random_word
	end

	def close_wordbank
		wordbank.dictionary.close
	end

end

secret_word = SecretWord.new
p secret_word.generate_random_word
secret_word.close_wordbank

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"