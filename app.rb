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

  def list_books
    if @books.empty?
      puts 'There are no books available'
    else
      puts 'List of available books:'
      @books.each do |book|
        puts "- #{book.title} by #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people available'
    else
      puts 'List of all available people:'
      @people.each do |person|
        puts "- #{person.name} has #{person.age} years and Id #{person.id}"
      end
    end
  end

  def create_student(age, label, parent_permission, name)
    classroom = Classroom.new(label)
    student = Student.new(age, classroom, parent_permission: parent_permission, name: name)
    @people << student
    puts "The student #{student.name} has been created successfully"
    puts 'Enter an option:'
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
    puts "The teacher #{teacher.name} has been created successfully"
    puts 'Enter an option:'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    puts "The book #{book.title} has been created successfully"
    puts 'Enter an option:'
    @books << book
  end

  def create_rental(date, book_title, person_name)
    book = @books.find { |b| b.title == book_title }
    person = @people.find { |p| p.name == person_name }

    if book.nil? || person.nil?
      puts 'Book or person not found'
      return
    end

    rental = Rental.new(date, book, person)
    book.add_rental(date, person)
    person.rentals << rental
    @rentals << rental

    puts "Rental on #{rental.date} has been created successfully"
    puts 'Enter an option:'
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
          puts "- On #{rental.date}, #{rental.person.name} rented #{rental.book.title}"
          puts 'Enter an option:'
        end
      end
    end
  end
end
