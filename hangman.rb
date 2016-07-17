timer_start = Time.now

require "./lib/secret_word.rb"
require "./lib/word_bank.rb"

secret_word = SecretWord.new
p secret_word.generate_random_word
secret_word.close_wordbank

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"