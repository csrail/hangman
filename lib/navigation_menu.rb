require "./lib/save_load_feature.rb"

class Menu
	include LoadFeature

end


# PLAN
# ascii art title for hangman
# puts basic menu 1. New Game | 2. Load Game
# Sanitise Input for option "1" or "2" only
# Option 1 creates Game.new

# Option 2 goes to the loaded game
# improve: shows menu of selection of saves, save files are named by user_display
# improve: uses indexing
# improve: sanitises input - accepts only numbers and available options
# how do I implement available options??