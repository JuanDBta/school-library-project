require './classroom'
require './student'

describe Classroom do
  let(:classroom_label) { 'Math101' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new(18, classroom, name: 'John Doe') }

  context 'when adding a student to the classroom' do
    before do
      classroom.add_student(student)
    end

    it 'adds the student to the classroom' do
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom of the student' do
      expect(student.classroom).to eq(classroom)
    end
  end
end
