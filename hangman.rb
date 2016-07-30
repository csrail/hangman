require "./lib/secret_word.rb"
require "./lib/word_bank.rb"
require "./lib/game.rb"
require 'json'

Game.new

#REALLY GOOD STUFF HERE
=begin 
def from_json (string)
  JSON.load(string)
end


string = File.open("./lib/save-states/attempt.json")
status = from_json(string)

hangman = Game.new(status)
=end

#p hangman.generate_random_word
#hangman.close_wordbank