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
    if !@books.empty?
      puts 'List of available books:'
      @books.each do |book|
        puts "- #{book.title} by #{book.author}"
      end
    else
      puts 'There are no books available'
    end
    
  end

  def list_people
    if @people.empty?
      puts 'There are no people available'
    else
      puts 'List of all available people:'
      @people.each do |person|
        puts "- NAME: #{person.name}, AGE: #{person.age} years, ID: #{person.id}"
      end
    end
  end

  def create_student(age, label, parent_permission, name)
    classroom = Classroom.new(label)
    student = Student.new(age, classroom, parent_permission: parent_permission, name: name)
    @people << student
    puts "Student #{student.name} created !"
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
    puts "Teacher #{teacher.name} created !"
    options
  end

  def create_book(title, author)
    book = Book.new(title, author)
    puts "The book #{book.title} has been created !"
    options
    @books << book
  end

  def create_rental(date, book_title, person_name)
    book = @books.find { |b| b.title == book_title }
    person = @people.find { |p| p.name == person_name }

    if book.nil? || person.nil?
      puts 'Book or person not found'
      options
      return
    end

    rental = Rental.new(date, book, person)
    book.add_rental(date, person)
    person.rentals << rental
    @rentals << rental

    puts "Rental on #{rental.date} has been created !"
    options
  end

  def list_rentals()
    if @rentals.empty?
      puts 'There are no rentals available'
      options
    else
      puts 'Please enter ID:'
      person_id = gets.chomp.to_i
      get_rental = @rentals.select { |rental| rental.person.id == person_id }
      if get_rental.empty?
        puts 'No rentals matched with your ID'
        options
      else
        puts "The rentals for ID #{person_id}:"
        get_rental.each do |rental|
          puts "- On #{rental.date}, #{rental.person.name} rented #{rental.book.title}"
          options
        end
      end
    end
  end
end
