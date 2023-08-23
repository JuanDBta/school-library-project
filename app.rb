require 'json'
require './classroom'
require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :people, :books, :rentals
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

  def check_rental_availability
    if @books.empty? || @people.empty?
      false
    else
      true
    end
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

  def rentals_availability
    if @rentals.empty?
      false
    else
      true
    end
  end

  def list_rentals()
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
      end
      options
    end
  end

  def save_data
    File.open('books.json', 'w') { |file| file.write(JSON.generate(@books)) }
  
  books_data = @books.map do |book|
    {
      'title' => book.title,
      'author' => book.author,
    }
  end

    File.open('people.json', 'w') { |file| file.write(JSON.generate(@people)) }
    people_data = @people.map do |person|
      {
        'id' => person.id,
        'name' => person.name,
        'age' => person.age,
        'parent_permission' => person.parent_permission,
        'specialization' => person.specialization,
      }
    end

    File.open('rentals.json', 'w') { |file| file.write(JSON.generate(@rentals)) }
    rentals_data = @rentals.map do |rental|
      {
        'date' => rental.date,
        'name' => rental.person.name,
        'title' => rental.books.title,
      }
    end
  end

  def load_data
    if File.exist?('books.json')
      books_data = File.read('books.json')
      @books = JSON.parse(books_data) unless books_data.empty? || books_data.nil?
    end

    if File.exist?('people.json')
      people_data = File.read('people.json')
      @people = JSON.parse(people_data) unless people_data.empty? || people_data.nil?
    end

    if File.exist?('rentals.json')
      rentals_data = File.read('rentals.json')
      @rentals = JSON.parse(rentals_data) unless rentals_data.empty? || rentals_data.nil?
    end
  end  
end
