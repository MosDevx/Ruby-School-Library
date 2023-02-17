class Student < Person
	attr_accessor :classroom

	def initialize(age:,classrom:, name:"Unknown", parent_permission:true)
	
		super(age,name,parent_permission)
		@classroom = classroom
	end

	def play_hooky
		"¯\(ツ)/¯"
	end

end