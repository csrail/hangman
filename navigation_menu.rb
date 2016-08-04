require 'io/console'
require "./lib/secret_word.rb"
require "./lib/word_bank.rb"
require "./lib/game.rb"
require 'json'

class Menu
	
	attr_reader :option, 
							:save_state_option, :save_state_availability, :save_state_file_names, :save_state_file_paths
	
	
	def initialize
		@save_state_availability = []
		@save_state_file_names = []
		@save_state_file_paths = []
		print_menu
		listen_for_game_option
	end

	def print_menu
		system 'clear'
		puts 
		puts "\t _________________ "
		puts "\t|                 |"
		puts "\t|  H A N G M A N  |"
		puts "\t|_________________|"
		puts 

		puts "\t   1. New Game"
		puts "\t   2. Load Game"
		puts
		puts
		puts "\t   Press 1 or 2:"
		puts
	end

	def listen_for_game_option
		@option = STDIN.getch
		redirect_input
	end	

	def redirect_input
		case
		when option == "1"
			Game.new
		when option == "2"
			show_save_states
		when option == "\u0003" || option == "q"
			system 'exit'
		else
			return listen_for_game_option
		end
	end
	
	def show_save_states
		p "Feature not implemented yet."
		puts Dir.pwd
		#p "before"
		Dir.chdir("./lib/save-states")
		#p "after"
		puts Dir.pwd
		Dir.glob("*.json").each_with_index do |f, i|
			save_state_availability << i.to_s
			save_state_file_names << f 
			puts "  #{i+1}.\t#{File.basename(f, ".json")}"
			puts "\t#{File.mtime(f).strftime("%H:%M - %a, %d %b %Y ")}"
			puts
		end
		puts "Pick a save state number:"
		puts
		p		 save_state_availability
		p		 save_state_file_names
		#p		 save_state_file_paths if !save_state_file_paths.empty?
		listen_for_save_state_number
	end
	
	def listen_for_save_state_number
		@save_state_option = (STDIN.getch.to_i - 1).to_s
		redirect_save_state
	end
	
	def redirect_save_state
		if save_state_availability.include? save_state_option
			puts "You have chosen option #{save_state_option}"
			puts file_location = File.expand_path(save_state_file_names[save_state_option.to_i])
			string = File.open(file_location)
			status = from_json(string)
			Game.new(status)
		else
			return listen_for_save_state_number
		end
	end

end

Menu.new

