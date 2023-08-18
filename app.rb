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
            {
                puts "There are no books available"
            } else
            {
              @books.each do |book|
              puts "This is the list of books available:"
              puts "- #{book.title} by #{book.author}"
            }
        end
    
    def list_people
        if @people.empty?
            {
                puts "There are no people available"
            } else
            {
            @people.each do |person|
            puts "This is the list of all people:"
            puts "- #{person.name} has #{person.age} years and Id #{person.id}"
            }
        end

      