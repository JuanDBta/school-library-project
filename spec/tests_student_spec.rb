require './student'

describe Student do
  # Arrange: Set up common variables for the tests
  let(:classroom) { instance_double('Classroom') }
  let(:age) { 16 }

  context 'when initializing a student' do
    it 'sets attributes and adds student to classroom' do
      # Arrange: Set up classroom double and expected behavior
      expect(classroom).to receive(:add_student)
      # Act: Create a student instance
      student = Student.new(age, classroom)
      # Assert: Verify attributes are set and classroom's add_student was called
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
    end
  end

  it 'plays hooky' do
    # Arrange: Create a student instance
    old_classroom = instance_double('Classroom', students: [])
    allow(old_classroom).to receive(:add_student)
    student2 = Student.new(age, old_classroom)
    # Act: Call the play_hooky method
    result = student2.play_hooky
    # Assert: Verify the result matches the expected output
    expect(result).to eq('¯(ツ)/¯')
  end
end
