class NameableDecorator < nameable
	@nameable_obj

	def initialize(nameable_obj)
		@nameable_obj = nameable_obj
	
	end

	def correct_name
		@nameable_obj&.correct_name	
	end
	
end