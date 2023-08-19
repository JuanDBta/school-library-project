require './classroom'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def options
    puts 'Please enter the number of the option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_books
    if @books.empty?
      puts 'There are no books available'
    else
      @books.each do |book|
        puts 'This is the list of books available:'
        puts "- #{book.title} by #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people available'
    else
      puts 'This is the list of all people:'
      @people.each do |_person|
        puts "- #{person.name} has #{person.age} years and Id #{person.id}"
      end
    end
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, permission)
    classroom = Classroom.new('A')
    @people << student
    puts "#{student.name} has been created successfully"
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts "#{teacher.name} has been created successfully"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} has been created successfully"
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental on #{rental.date} has been created successfully"
  end

  def list_rentals()
    if @rentals.empty?
      puts 'There are no rentals available'
    else
      puts 'Please enter ID:'
      person_id = gets.chomp.to_i
      get_rental = @rentals.select { |rental| rental.person.id == person_id }
      if get_rental.empty?
        puts 'No rentals matched with your ID'
      else
        puts "The rentals for ID #{person_id}:"
        get_rental.each do |rental|
          puts "- Date: #{rental.date}, #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end
