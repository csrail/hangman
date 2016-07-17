class SecretWord
	attr_reader :wordbank

	def initialize
		@wordbank = access_wordbank

		generate_random_word
	end

	
	public

	def generate_random_word
		wordbank.find_random_word
	end

	def close_wordbank
		wordbank.dictionary.close
	end

	
	protected

	def access_wordbank
		WordBank.new
	end

end