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

    all_persons.push(new_teacher)

    'New Teacher Created'
  end

  def create_student(age:, name:)
    new_student = Student.new(age: age, name: name, id: generate_student_id)

    all_persons.push(new_student)
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

  def display_all_persons
    all_persons.each_with_index do |person, index|
      role = if person.respond_to?('specialization')
               'Teacher'
             else
               'Student'
             end
      puts "#{index}). Role:#{role} Name:#{person.name}  ID:#{person&.id}"
    end
  end

  def display_rental_for_id(rental_id)
    filtered_rentals = all_rentals.select { |rental| rental_id == rental.person.id }
    if filtered_rentals.empty?
      puts 'Id Not Found. Try again'
    else
      filtered_rentals.each { |rental| puts "Date #{rental.date} '#{rental.book.title}' by #{rental.book.author} " }
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
