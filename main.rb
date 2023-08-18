#!/usr/bin/env ruby
require './app'
@app = App.new

def create_student
  print 'Enter your name: '
  name = gets.chomp
  print 'Enter your age: '
  age = gets.chomp
  print 'Enter your classroom: '
  classroom_name = gets.chomp
  print 'Do you have permission from your parents? [Y/N]: '
    permission = gets.chomp.downcase
  if permission == 'y'
    parent_permission = true
  elsif permissions == 'n'
    parent_permission = false
  else
    puts 'Invalid input'
  end
  @app.create_student(name, age, classroom_name, parent_permission)
end

def create_teacher
  print 'Enter you name: '
  name = gets.chomp
  print 'Enter your age: '
  age = gets.chomp
  print 'Enter your specialization: '
  spec = gets.chomp
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
  puts 'Enter the book´s title from the following list:'
  @app.list_books()
  book = gets.chomp

  puts 'Enter a name from the following list: '
  @app.list_people()
  person = gets.chomp

  print 'Enter the date: '
  date = gets.chomp
  @app.create_rental(person, book, date)
end

def main
  @app.options
  input = gets.chomp

  case input
  when '1'
    @app.list_books
    main

  when '2'
    @app.list_people
    main

  when '3'
    puts 'To create a Student (Enter 1) or create a Teacher (Enter 2):'
    input = gets.chomp
    if input == '1'
      create_student
      main
    elsif input == '2'
      create_teacher
      main
    else
      puts 'Invalid input'
    end

  when '4'
    create_book
    main

  when '5'
    create_rental
    main

  when '6'
    @app.list_rentals
    main

  when '7'
    exit

  else
    puts 'Invalid input'
    main
  end
end

main