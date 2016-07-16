
class SecretWord
	#attr_reader :dictionary, :wordlist
	attr_accessor :dictionary, :wordlist

	def initialize
		#Assign path to variable name "dictionary"
		# p dictionary #=>  #File:./wordlist.txt
		@dictionary = File.open("./wordlist.txt")
		@wordlist = []

		generate_word_bank
	end


	public

	def random_word
		wordlist[random_index]
	end


	protected

	def adjust_word
		self.strip.downcase
	end

	def total_number_of_words
		wordlist.length
	end

	def random_index
		rand(total_number_of_words)
	end

	def generate_word_bank
		dictionary.readlines.each do |line|
			wordlist << line.strip if line.strip.downcase.length >= 5 && line.strip.downcase.length <= 12
		end		
	end



end

secret_word = SecretWord.new
p secret_word.random_word