#!/usr/bin/env ruby
require './menu'
@menu = Menu.new


def main
  @menu.title
  @menu.options

  loop do
    input = gets.chomp
    case input
    when '1'
      @app.list_books

    when '2'
      @app.list_people
    when '3'
      puts 'To create a Student (Enter 1), to create a Teacher (Enter 2):'
      input = gets.chomp
      if input == '1'
        create_student
      elsif input == '2'
        create_teacher
      else
        puts 'Invalid input'
      end

    when '4'
      create_book

    when '5'
      create_rental

    when '6'
      @app.list_rentals

    when '7'
      puts 'Goodbye!!!'
      exit

    else
      puts 'Invalid input'
    end
  end
end

main
