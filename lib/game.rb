require './lib/save_load_feature.rb'
require 'json'

class Game
	include SaveFeature

	attr_reader :secret_word, :display_letters, :incorrect_guess_history, :user_letter_display, :user_incorrect_guess_history
	attr_accessor :player_guess, :guesses_left, :player_wins, :player_loses

	def initialize(args={})
		@secret_word 									= args["@secret_word"] 						 			|| new_secret_word #{}"committee".split(//) 
		@display_letters 							= args["@display_letters"] 				 			|| Array.new(secret_word.length) {"_"}
		@player_guess 								= args["@player_guess"]						 			|| ""
		@incorrect_guess_history 			= args["@incorrect_guess_history"] 			|| []
		@guesses_left 								= args["@guesses_left"]						 			|| 7

		@user_letter_display 					= args["@user_letter_display"]		 			|| ""
		@user_incorrect_guess_history = args["@user_incorrect_guess_history"]	|| ""

		@player_wins 									= args["@player_wins"]									|| false
		@player_loses 								= args["@player_loses"]									|| false

		system 'clear'

		until player_wins == true || player_loses == true
			play
		end
	end

	private

	def play
		make_guess_message
		sanitise_input
		filter_input
		check_win_or_lose

		system 'clear'
		puts "Player Guess: #{player_guess}"
		puts "Display Letters: #{display_letters}"
		puts "Incorrect Guess History: #{incorrect_guess_history}"
		puts "Gusses Left: #{guesses_left} / 7"
		#puts "Secret Word: #{secret_word}"

		puts "User Display Letters: #{user_letter_display}"
		puts "User Incorrect Guess History: #{user_incorrect_guess_history}"
		puts
	end
	

	protected

	def sanitise_input
		@player_guess = gets.chomp
		save?
		only_one_character?
		is_a_letter?
		repeat_letter?
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
		repeat_letter_correct?
		repeat_letter_incorrect?
	end

	def repeat_letter_correct?
		until !(display_letters.include? player_guess)
			p "You have already correctly guessed '#{player_guess}' before:"
			return sanitise_input
		end
	end

	def repeat_letter_incorrect?
		until !(incorrect_guess_history.include? player_guess)
			p "You have incorrectly guessed '#{player_guess}' before:"
			return sanitise_input
		end
	end


	protected

	def filter_input
		check_guess
		display_current_environment
	end

	def check_guess
		if secret_word.include? player_guess
			record_correct_guess
		else
			record_incorrect_guess
		end
	end

	def record_correct_guess
		secret_word.each_with_index do |letter, index|
			display_letters[index] = letter if letter == player_guess
		end
	end

	def record_incorrect_guess
		incorrect_guess_history << player_guess
		@guesses_left -= 1
	end

	def display_current_environment
		display_letters_for_user
		incorrect_guess_history_for_user
	end

	def display_letters_for_user
		@user_letter_display = display_letters.join(" ")
	end

	def incorrect_guess_history_for_user
		@user_incorrect_guess_history = incorrect_guess_history.join(", ")
	end


	private

	def check_win_or_lose
		player_wins?
		if player_wins == true
			puts "",
					 "Player wins!",
					 "The secret word was indeed `#{secret_word.join("")}`!"
			abort
		elsif
			player_loses?
			puts "",
					 "Player loses",
			     "`#{secret_word.join("")}` was the secret word."
			abort
		end

	end

	def player_wins?
		@player_wins = true if display_letters == secret_word
	end

	def player_loses?
		@player_loses = true if guesses_left == 0
	end


	private

	def make_guess_message
		p "Guess a letter:"
	end

	def alphabet
		("a".."z").to_a
	end

	def new_secret_word
		SecretWord.new.generate_random_word.split(//)
	end

end