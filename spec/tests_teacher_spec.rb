require './teacher'

describe Teacher do
  # Arrange: Set up common variables for the tests
  let(:age) { 30 }
  let(:specialization) { 'Mathematics' }

  context 'when initializing a teacher' do
    it 'sets attributes correctly' do
      # Act: Create a teacher instance
      teacher = Teacher.new(age, specialization)
      # Assert: Verify attributes are set correctly
      expect(teacher.age).to eq(age)
      expect(teacher.specialization).to eq(specialization)
    end
  end

  it 'returns true for can_use_services?' do
    # Arrange: Create a teacher instance
    teacher = Teacher.new(age, specialization)
    # Act: Call the can_use_services? method
    result = teacher.can_use_services?
    # Assert: Verify the result is true
    expect(result).to be(true)
  end
end
