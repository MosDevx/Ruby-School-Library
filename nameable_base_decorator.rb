require './person.rb'
class NameableDecorator < Nameable
  attr_accessor :nameable_obj

  def initialize(nameable_obj)
    super()
    @nameable_obj = nameable_obj
  end

  def correct_name
    @nameable_obj&.correct_name
  end
end


pers = Person.new(name:"hey", age:10)

newpers = NameableDecorator.new(pers)

newpers.correct_name


