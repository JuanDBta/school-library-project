#!/usr/bin/env ruby
require './menu'

def main
  @menu = Menu.new
  @menu.title

  loop do
    @menu.options
    input = gets.chomp
    case input
    when '1'
      @menu.list_books

    when '2'
      @menu.list_people
    when '3'
      puts 'To create a Student (Enter 1), to create a Teacher (Enter 2):'
      input = gets.chomp
      if input == '1'
        @menu.create_student
      elsif input == '2'
        @menu.create_teacher
      else
        puts 'Invalid input'
        puts 'Enter an option: '
      end

    when '4'
      @menu.create_book

    when '5'
      @menu.create_rental

    when '6'
      @menu.list_rentals

    when '7'
      puts 'Goodbye!!!'
      exit

    else
      puts 'Invalid input'
      puts 'Enter an option: '
    end
  end
end

main
