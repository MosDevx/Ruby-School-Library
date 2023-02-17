require './capitalize_decorator'
require './trimmer_decorator'
require './person'

person = Person.new(age: 22, name: 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
capitalized_trimmed_person.correct_name
