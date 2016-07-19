class Game
	attr_reader :secret_word, :display_letters, :incorrect_guess_history
	attr_accessor :player_guess, :guesses_left

	def initialize
		@secret_word = "committee".split(//) #new_secret_word
		@display_letters = Array.new(secret_word.length) {"_"}
		@player_guess = ""
		@incorrect_guess_history = []
		@guesses_left = 7

		play
	end

	def play
		system 'clear'
		make_guess
		sanitise_input
		filter_input

		#check outputs
		puts "Player Guess: #{player_guess}"
		puts "Display Letters: #{display_letters}"
		puts "Incorrect Guess History: #{incorrect_guess_history}"
		puts "Gusses Left: #{guesses_left} / 7"
		puts "Secret Word: #{secret_word}"
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

	def filter_input
		check_guess
	end

	def record_guess

	end

	def check_guess
		if secret_word.include? player_guess
			correct_guess_response
		else
			incorrect_guess_response
		end
	end

	def correct_guess_response
		secret_word.each_with_index do |letter, index|
			display_letters[index] = letter if letter == player_guess
		end
	end

	def incorrect_guess_response
		incorrect_guess_history << player_guess
		@guesses_left -= 1
	end

	def display_current_environment
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

end