class Game
	attr_reader :secret_word, :user_display
	attr_accessor :player_guess

	def initialize
		@secret_word = split_word
		@user_display = Array.new(secret_word_length) {""}
		@player_guess = ""

	end


end