###Clarifications

####1. On simplifying methods

The following code, and its output were once happening within the class Secret Word:

```ruby
	def adjust_word
		self.strip.downcase
	end

​	def create_word_bank
		dictionary.readlines.each do |line|
		wordlist << line.adjust_word if line.strip.length >= 5 && line.strip.length <= 12
		end		
	end
```

```
hangman.rb:38:in `block in create_word_bank': undefined method `adjust_word' for "Aachen\r\n":String (NoMethodError)
    from hangman.rb:37:in `each'
    from hangman.rb:37:in `create_word_bank'
    from hangman.rb:12:in `initialize'
    from hangman.rb:44:in `new'
    from hangman.rb:44:in `<main>
```

An inefficient solution to this was:

```ruby
	def create_word_bank
		dictionary.readlines.each do |line|

			def line.adjust_word	
				self.strip.downcase
			end

			wordlist << line.adjust_word if line.strip.length >= 5 && line.strip.length <= 12
		end		
	end
```

But this code block looks messy and does not sit well.
It also changes the output time from 70ms to 200ms because you are defining the method `line.adjust_word` with every iteration of `dictionary.readlines.each`.

Kevin's response:
This has a a bit to do with scope and a lot to do with the method look up path
in your first snippet, this line `line.adjust` word will look for the `adjust_word` method on the class its being called on. In this case a string. It returns undefined method because it cant find that method on string or any of the modules included on it or any of the super classes the string inherits from. You have defined the adjust_word method on the main object which isnt in the method look up path for a string.

You're overcomplicating things here in my opinion, using `strip.downcase` is perfectly fine. If you were to extract anything to a different method it would be this logic `if line.strip.length >= 5 && line.strip.length <= 12` which evaluates to a boolean.

The new method should look like this:

```ruby
	def between_5_and_12_characters?(line)
		line.strip.length >= 5 && line.strip.length <= 12
	end
```

####2. Accessing public and protected methods
Public methods can act on an object directly.

Protected methods can only be evoked on an object through proxy of an attr_reader method.


####3. Gotcha - attr_writer method mixed up with declaring local variable
So when using an attr_accessor method within the same class it doesn't work like it would outside of it. @codyloyd was right about all of it. Ruby treats it as a local variable within the method and sets that.

The setter method needs to be called on an instance of the class so `self.player_guess = … works`. You are better just doing what your currently doing though, `@player_guess = …` that seems to be the accepted way to set instance variables within the same class. 

