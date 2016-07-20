module JSONable

require 'json'

	def commit_save(save)
		file_path = File.open("./save-states/hello_world.json", "w") do |f|
			f.write(save)
		end
	end

end
=begin
	class FeatureSaveLoad
		attr_accessor :file_path, :dummy_info, :json_string

		def initialize
			#@dummy_info = "Welcome to the family!"
			#@json_string = ""

			#make_json
		end

		

		def make_json
			@json_string= dummy_info.to_json
		end

		def commit_load

		end

		def from_json
		end

	end

end
=end