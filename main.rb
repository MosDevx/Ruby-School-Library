require './app'

class Main
  #  rubocop:disable  Metrics/MethodLength

  def initialize(app)
    @app = app
  end

  def create_person
    loop do
      puts 'Create Student (1)  or Create Teacher (2). Go back(0).'

      person_choice = gets.chomp.to_i

      if !person_choice.between?(0, 2)
        puts 'Invalid Choice. Try again'
        next

      elsif person_choice == 1
        puts 'Enter Name:'
        name = gets.chomp
        puts 'Enter Age'
        age = gets.chomp.to_i
        @app.create_student(name: name, age: age)
        puts
        puts 'Student Created!'
        break

      elsif person_choice == 2
        puts 'Enter Name:'
        name = gets.chomp
        puts 'Enter Age'
        age = gets.chomp.to_i
        puts 'Enter Specialization'
        specialization = gets.chomp
        @app.create_teacher(name: name, age: age, specialization: specialization)
        puts
        puts 'Teacher'
        break

      elsif person_choice.zero?
        break

      end
    end
  end

  def process(choice)
    puts 'Process called'

    case choice

    when 1

      @app.display_all_books

    when 2
      @app.display_all_persons

    when 3
      create_person

    when 4

      puts 'Enter Book Title'
      title = gets.chomp
      puts 'Enter Book Author'
      author = gets.chomp

      @app.create_book(title: title, author: author)
      puts
      puts 'Book Created !!'

    when 5

      puts 'Choose number of book owner'
      @app.display_all_persons
      person_id = gets.chomp.to_i

      puts 'Choose number of Book'
      @app.display_all_books
      book_id = gets.chomp.to_i

      puts 'Enter rental date'
      date = gets.chomp

      @app.create_rental(date: date, book_id: book_id, person_id: person_id)

      puts 'New Rental Recorded'

    when 6

      @app.display_all_persons
      puts 'Choose Id of book renter:'
      id = gets.chomp.to_i

      @app.display_rental_for_id(id)

    else
      puts 'Please try again'
    end
  end

  def run()
    input = 0
    run = 0

    while input != 7
      puts
      puts
      puts 'Welcome to School Library App' if run.zero?
      puts 'Please Choose and option by entering a number'
      puts '1 - List all Books'
      puts '2 - List all People'
      puts '3 - Create a Person'
      puts '4 - Create a Book'
      puts '5 - Create a Rental'
      puts '6 - List all rentals a on given person id'
      puts '7 - Exit'

      puts 'Invalid Choice.Try again:' unless run.zero?

      run = 1

      choice = gets.chomp.to_i
      puts choice

      if choice == 7
        puts 'Goodbye'
        break

      elsif choice.between?(0, 7)
        run = 0
        process(choice)

      else
        next

      end

    end
  end
end
# rubocop:enable  Metrics/MethodLength

app = App.new
main = Main.new(app)
main.run
