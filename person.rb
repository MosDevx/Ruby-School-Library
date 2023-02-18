require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true, id: nil)
    super()
    @name = name
    @age = age
    @id = id
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
