module SaveFeature
	def to_json
		{
			@secret_word => secret_word,
			@display_letters => display_letters,
			@player_guess => player_guess,
			@incorrect_guess_history => incorrect_guess_history,
			@guesses_left => guesses_left,

			@user_letter_display => user_letter_display,
			@user_incorrect_guess_history => user_incorrect_guess_history,

			@player_wins => player_wins,
			@player_loses => player_loses,
		}.to_json
	end

	def commit_save(save)
		file_path = File.open("./lib/save-states/hello_world.json", "w") do |f|
			f.write(save)
		end
	end


	def save?
		if player_guess == "save"
			puts ""
			p "Session saved."
			commit_save(save_state)
			abort
		end
	end

	def save_state
		self.to_json
	end	
end

module LoadFeature
	def from_json
		
	end
end