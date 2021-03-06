require 'json'

module SaveFeature
	def save?
		if player_guess == "save"
			puts ""
			p "Session saved."
			commit_save(save_state)
			abort
		end
	end	

	def save_state #is now a json string
		self.to_json
	end	

	def commit_save(save)
		file_path = File.open("./lib/save-states/#{user_letter_display}.json", "w") do |f|
			f.write(save)
		end
	end

	def to_json
		hash = {}
		self.instance_variables.each do |var|
			hash[var] = self.instance_variable_get var
		end
		hash.to_json
	end
end