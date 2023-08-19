require './person'

# Creating class Teacher
class Teacher < Person
  attr_accessor :age, :specialization, :name

  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name:, parent_permission:)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
