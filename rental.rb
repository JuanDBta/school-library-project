class Rental
  attr_accessor :date, :person, :book

  def initialize(date)
    @date = date
    @book = book
    book.add_rental << self
    @person = person
    person.add_rental << self
  end
end
