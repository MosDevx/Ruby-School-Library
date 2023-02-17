require './nameable_base_decorator'
require './person'

class TrimmerDecorator < NameableDecorator 

	def initialize(nameable_obj)
		super(nameable_obj)
		
	end

  def correct_name
   name = @nameable_obj.correct_name

    if name.length <= 10
    	name
    else
    	name[0...10]
    end
  end
end

person = Person.new(age: 22, name: 'maximilusianous')
trimmed = TrimmerDecorator.new(person)
trimmed.correct_name
# person.correct_name
