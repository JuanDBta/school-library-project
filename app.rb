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
    books_data = load_data('books.json')
    if books_data.empty?
      puts 'There are no books available'
    else
      puts 'List of available books:'
      books_data.each do |book_data|
        puts "- #{book_data['title']} by #{book_data['author']}"
      end
    end
  end

  def list_people
    people_data = load_data('people.json')
    if people_data.empty?
      puts 'There are no people available'
    else
      puts 'List of all available people:'
      people_data.each do |person|
        puts "- NAME: #{person['name']}, AGE: #{person['age']} years, ID: #{person['id']}"
      end
    end
  end

  def create_student(age, label, parent_permission, name)
    classroom = Classroom.new(label)
    student = Student.new(age, classroom, parent_permission: parent_permission, name: name)
    @people << student
    save_people_data    
    puts "Student #{student.name} created !"
  end
  
  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
    save_people_data
    puts "Teacher #{teacher.name} created !"
  end
  

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    books_data = @books.map do |book|
      {
        'title' => book.title,
        'author' => book.author,
      }
    end
    save_data('books.json', books_data)

    puts "Book #{book.title} created !"
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
      return
    end

    rental = Rental.new(date, book, person)
    book.add_rental(date, person)
    person.rentals << rental
    @rentals << rental
    puts "Rental on #{rental.date} has been created !"
  end

  def rentals_availability
    if @rentals.empty?
      false
    else
      true
    end
  end

  def list_rentals()
    load_rentals_data
    puts 'Please enter ID:'
    person_id = gets.chomp.to_i
    get_rental = @rentals.select { |rental| rental['id'] == person_id }
    
    if get_rental.empty?
      puts 'No rentals matched with your ID'
    else
      puts "The rentals for ID #{person_id}:"
      get_rental.each do |rental|
        puts "- On #{rental['date']}, #{rental['name']} rented #{rental['title']}"
      end
    end
  end

  def save_data(filename, data)
    begin
      File.write(filename, JSON.generate(data))
    rescue StandardError => e
      puts "Error writing file: #{e}"
    end
  end

  def save_people_data
    people_data = @people.map do |person|
      if person.is_a?(Student)
        {
          'id' => person.id,
          'name' => person.name,
          'age' => person.age,
          'parent_permission' => person.parent_permission,
          'classroom' => person.classroom
        }
      elsif person.is_a?(Teacher)
        {
          'id' => person.id,
          'name' => person.name,
          'age' => person.age,
          'specialization' => person.specialization,
        }
      end
    end
    save_data('people.json', people_data)
  end

  def load_data(filename)
    unless File.exist?(filename)
      File.open(filename, 'a')
      return []
    end

    data = File.read(filename)
    JSON.parse(data) unless data.empty?
  end
end
