require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    rental
  end
end
