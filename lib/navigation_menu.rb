require 'io/console'

class Menu 
	attr_reader :option
	
	def initialize
		print_menu
		listen_for_option
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

	def listen_for_option
		@option = STDIN.getch
		redirect_input
	end

	def redirect_input
		case
		when option == "1"
			system 'ruby hangman.rb'
		when option == "2"
			#puts Dir.getwd
			#Dir.chdir("./lib/save-states")
			filelist = []

			Dir.foreach("./lib/save-states") do |filename|
				filelist << filename if filename.match(".json")
			end
			p filelist
			#p filelist.sort_by {|f| File.mtime("f")}
			
		when option == "\u0003" || "q"
			system 'exit'
		else
			return listen_for_option
		end
	end
end

Menu.new
=begin
class Menu
	include LoadFeature

end
=end

# PLAN

# Sanitise Input for option "1" or "2" only
# Option 1 creates Game.new

# Option 2 goes to the loaded game
# improve: shows menu of selection of saves, save files are named by user_display
# improve: uses indexing
# improve: sanitises input - accepts only numbers and available options
# how do I implement available options??