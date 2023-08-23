require './app'

class Menu
    
    def initialize
        @app = App.new
    end

    def title
        puts 'Welcome to Microverse School Library!!!'
        puts
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
        puts 'Enter a Book´s title from the following list:'
        @app.list_books
        book_title = gets.chomp
      
        puts 'Enter a Person name from the following list: '
        @app.list_people
        person_name = gets.chomp
      
        print 'Enter the date: '
        date = gets.chomp
        @app.create_rental(date, book_title, person_name)
      end
    end
      