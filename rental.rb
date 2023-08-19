class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rental << self
    @person = person
    person.rental << self
  end
end
