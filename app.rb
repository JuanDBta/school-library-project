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
      @books.each do |_book|
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

  def create_student(name, age, classroom_name, parent_permission)
    classroom = Classroom.new(classroom_name)
    student = Student.new(age, classroom, name, parent_permission)
    @people << student
    puts "#{student.name} has created successfully"
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts "#{teacher.name} has created successfully"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} has created successfully"
  end
end
