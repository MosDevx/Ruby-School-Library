require './capitalize_decorator.rb'
require './trimmer_decorator.rb'
require './person.rb'

person = Person.new(age:22, name:'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name