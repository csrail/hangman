class Game
	attr_reader :secret_word, :display_letters
	attr_accessor :player_guess

	def initialize
		@secret_word = "Crusade" #new_secret_word
		@display_letters = Array.new(secret_word_length) {""}
		@player_guess = ""
		@incorrect_guess_history = []

		play
	end

	def play
		system 'clear'
		make_guess
		sanitise_input
		p player_guess
	end
	
	def make_guess
		p "Guess a letter:"
	end

	def sanitise_input
		@player_guess = gets.chomp
		only_one_character?
		is_a_letter?
	end

	def only_one_character?
		until player_guess.length == 1
			p "One letter only please:"
			return sanitise_input
		end
	end

	def is_a_letter?
		until alphabet.include? player_guess
			p "We only accept letters:"
			return sanitise_input
		end
	end

	def repeat_letter?
	end

	def repeat_letter_correct?
	end

	def repeat_letter_incorrect?
	end

=begin
	def validation_feedback(args)
		p args[:msg]

	end
=end

	def record_guess
	end

	def compare_guess
	end

	def correct_guess
	end

	def incorrect_guess
	end

	def display_history
	end

	def player_wins?
	end

	def player_lose?
	end


	private

	def alphabet
		("a".."z").to_a
	end

	def new_secret_word
		SecretWord.new.generate_random_word.split(//)
	end

	def secret_word_length
		secret_word.size
	end

end