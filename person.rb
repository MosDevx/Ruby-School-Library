class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName
end
