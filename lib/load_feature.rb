module LoadFeature
end
	
	def from_json (string)
		JSON.load(string)
	end


#string = File.open("./lib/save-states/attempt.json")
#from_json(string)