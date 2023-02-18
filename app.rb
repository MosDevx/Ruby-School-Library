require './book'
require './teacher'
require './student'
require './rental'

class App
  # rubocop:disable Style/ClassVars
  @@student_id = 100
  @@teacher_id = 400
  # rubocop:enable Style/ClassVars

  attr_accessor :all_books, :all_teachers, :all_students, :all_persons, :all_rentals

  def initialize()
    @all_books = []
    @all_teachers = []
    @all_students = []
    @all_persons = []
    @all_rentals = []
  end

  class << self
    attr_reader :student_id
   end

  class << self
    attr_writer :student_id
  end

  def create_teacher(age:, specialization:, name:, parent_permission: true)
    new_teacher = Teacher.new(age: age, specialization: specialization, name: name,
                              parent_permission: parent_permission, id: generate_teacher_id)

    all_teachers.push(new_teacher)

    'New Teacher Created'
  end

  def create_student(age:, name:)
    new_student = Student.new(age: age, name: name, id: generate_student_id)

    all_students.push(new_student)
    'New Student Created'
  end

  def create_book(title:, author:)
    new_book = Book.new(title: title, author: author)
    all_books.push(new_book)
    'New Book Created'
  end

  def create_rental(date:, book_id:, person_id:)
    book = all_books[book_id]
    person = all_persons[person_id]

    puts

    new_rental = Rental.new(date: date, book: book, person: person)
    all_rentals.push(new_rental)

    'New Rental Recorded'
  end

  def display_all_books
    if all_books.empty?
      puts 'No Books in Library'
    else
      all_books.each_with_index { |book, index| puts "#{index}). Title: '#{book.title}' by #{book.author}" }
    end
  end

  def display_all_sudents
    all_students.each { |student| puts "Name: #{student.name}   Age:#{student.age}   ID:#{student.id}  " }
  end

  def display_all_teachers
    all_teachers.each do |teacher|
      puts "Name: #{teacher.name} Specialization: #{teacher.specialization} ID:#{teacher.id}"
    end
  end

  def display_all_persons
    if all_persons.empty?
      all_persons.concat(all_students)
      all_persons.concat(all_teachers)
      if all_persons.empty?
        puts 'No Persons in School System'
      else
        all_persons.each_with_index do |person, index|
          puts "#{index}). Name:#{person.name}  ID:#{person&.id}"
        end
      end
    else
      all_persons.each_with_index do |person, index|
        puts "#{index}). Name:#{person.name}  ID:#{person&.id}"
      end
    end
  end

  def display_rental_for_id(rental_id)
    filtered_rentals = all_rentals.select { |rental| rental_id == rental.person.id }
		if filtered_rentals.length == 0
			puts "Id Not Found. Try again"
		else filtered_rentals.each { |rental| puts "Date #{rental.date} '#{rental.book.title}' by #{rental.book.author} " }
		end
  end

  def generate_student_id()
    # rubocop:disable Style/ClassVars
    @@student_id += 1
    # rubocop:enable Style/ClassVars
  end

  def generate_teacher_id()
    # rubocop:disable Style/ClassVars
    @@teacher_id += 1
    # rubocop:enable Style/ClassVars
  end
end

# app = App.new
# # classroom = Classroom.new('Default Class')
# app.create_book(title: 'MyBook', author: 'My_Author')

# app.create_student(age: 10, name: 'wamae')
# app.create_teacher(age: 10, name: 'wae', specialization: 'teach')
# app.create_teacher(age: 10, name: 'wae', specialization: 'teach')
# app.display_all_teachers
# app.display_all_persons
# app.display_all_books
