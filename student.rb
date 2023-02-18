require './Person'

class Student < Person
  attr_accessor :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.inlcudes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
