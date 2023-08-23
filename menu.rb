require './app'

class Menu
    
    def initialize
        @app = App.new
    end

    def title
        puts 'Welcome to Microverse School Library!!!'
        puts
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
        @app.list_books
      end

      def list_people
        @app.list_people
      end
      
      def create_student
        print 'Enter your name: '
        name = gets.chomp
        print 'Enter your age: '
        age = gets.chomp
        print 'Enter your classroom: '
        label = gets.chomp
        print 'Do you have permission from your parents? [Y/N]: '
        permission = gets.chomp.downcase
        if permission == 'y'
          parent_permission = true
        elsif permission == 'n'
          parent_permission = false
        else
          puts 'Invalid input'
          puts 'Enter a Menu option: '
        end
        @app.create_student(age, label, parent_permission, name)
      end
      
      def create_teacher
        print 'Enter your name: '
        name = gets.chomp
        print 'Enter your age: '
        age = gets.chomp
        print 'Enter your specialization: '
        specialization = gets.chomp
        @app.create_teacher(age, specialization, name)
      end
      
      def create_book
        print 'Enter title: '
        title = gets.chomp
        print 'Enter author: '
        author = gets.chomp
        @app.create_book(title, author)
      end
      
      def create_rental
        puts 'To create a rental enter a Book title from the list'
        @app.list_books
        book_title = gets.chomp
      
        puts 'To create a rental enter a Person name from the list'
        @app.list_people
        person_name = gets.chomp
      
        print 'Enter the date: '
        date = gets.chomp
        @app.create_rental(date, book_title, person_name)
      end

      def list_rentals
        @app.list_rentals()
      end
    end
      